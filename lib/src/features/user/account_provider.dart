import 'dart:io';

import 'package:chillgo_mobile/src/app.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/data/api_client.dart';
import 'package:chillgo_mobile/src/data/repositories/account_repository.dart';
import 'package:chillgo_mobile/src/data/repositories/chat_repository.dart';
import 'package:chillgo_mobile/src/features/auth/authentication_page.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:chillgo_mobile/src/models/account_model.dart';

class AccountProvider with ChangeNotifier {
  SharedPreferences? _prefs;
  Account? _account;

  static const String _keyAccount = 'account';
  static const String _keyAccessToken = 'accessToken';

  Account? get account => _account;

  File? image;

  final _repository = AccountRepository();
  final _chatAIRepository = ChatRepository();

  AccountProvider() {
    initialize();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final accessToken = _prefs?.getString(_keyAccessToken);
      if (accessToken != null && isTokenExpired(accessToken)) {
        DialogCustom().showDialogConfirm(
            'Phiên đăng nhập hết hạn', 'Vui lòng đăng nhập lại để tiếp tục',
            barrierDismissible: false, onConfirm: () {
          navigaterKey.currentContext!.navigate(
            const AuthenticationPage(),
          );
        });
        return;
      }
    });
  }

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadAccountFromLocal();
  }

  Future<void> saveAccount(Account account, String accessToken) async {
    _account = account;
    final accountJson = json.encode(account.toJson());
    await _prefs?.setString(_keyAccount, accountJson);
    await _prefs?.setString(_keyAccessToken, accessToken);

    notifyListeners();
  }

  Future<void> loadAccountFromLocal() async {
    final accountJson = _prefs?.getString(_keyAccount);
    final accessToken = _prefs?.getString(_keyAccessToken);
    if (accountJson != null && accessToken != null) {
      _account = Account.fromJson(json.decode(accountJson));
      apiClient.setToken(accessToken);
      notifyListeners();
      getMyPackageChatAI();
    }
  }

  Future loadAccount() async {
    _account = await _repository.getAccount(_account!.id);
    final avatar = await _repository.getAvatar(_account!.id);
    _account!.avatarUrl = avatar;
    notifyListeners();
    final accountJson = json.encode(_account!.toJson());
    await _prefs?.setString(_keyAccount, accountJson);
  }

  Future<void> clearAccount() async {
    _account = null;
    await _prefs?.remove(_keyAccount);
    notifyListeners();
  }

  Map<String, dynamic> tokenDecode(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('Invalid token');
    }

    final payload = parts[1];
    final normalized = base64.normalize(payload);
    final decoded = utf8.decode(base64Url.decode(normalized));

    return jsonDecode(decoded);
  }

  bool isTokenExpired(String token) {
    try {
      // Lấy thời gian hết hạn
      final exp = tokenDecode(token)['exp'];
      if (exp == null) {
        return true;
      }

      // Chuyển đổi thời gian hết hạn sang DateTime
      final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);

      // So sánh với thời gian hiện tại
      return DateTime.now().isAfter(expiry);
    } catch (e) {
      print('Error checking token expiration: $e');
      return true; // Trả về true nếu có lỗi xảy ra
    }
  }

  Future<File?> chooseImage() async {
    final picker = ImagePicker();
    final imageResult = await picker.pickImage(source: ImageSource.gallery);
    image = File(imageResult?.path ?? '');
    return image;
  }

  Future<bool> updateAvatar(File file) async {
    final result = await _repository.updateAvatar(file.path, account!.id);
    if (result != null) {
      _account!.avatarUrl = result['image-url'];
      final accountJson = json.encode(_account!.toJson());
      await _prefs?.setString(_keyAccount, accountJson);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future getMyPackageChatAI() async {
    final packages = await _repository.getPackageTransaction(account!.id);
    if (packages.isNotEmpty) {
      if (packages.isNotEmpty) {
        packages.sort((a, b) => b.endDate.compareTo(a.endDate));
        final dateNow = DateTime.now();
        if (DateTime.parse(packages.first.endDate).isAfter(dateNow)) {
          final chatAiPackages = await _chatAIRepository.getChatAIPackage();
          final currentPackage = chatAiPackages.firstWhere((package) =>
              package.id.toLowerCase() ==
              packages.first.packageId.toLowerCase());
          _account!.package = currentPackage;
          _account!.package?.status = packages.first.status;
          notifyListeners();
        }
      }
    }
  }

  Future updateAccount(
      String name, String? gender, DateTime? birthday, String? phone) async {
    final newData = Account(
        id: account!.id,
        firebaseUid: account!.firebaseUid,
        email: account!.email,
        fullName: name,
        role: account!.role,
        gender: gender ?? account!.gender,
        dateOfBirth: birthday ?? account!.dateOfBirth,
        phoneNumber: phone ?? account!.phoneNumber,
        status: account!.status);
    final result = await _repository.updateAccount(newData);
    navigaterKey.currentContext!.showSnackBar(result);
    await loadAccount();
    await getMyPackageChatAI();

    return;
  }

  Future updatePassword(String oldPassword, String newPassword) async {
    final result =
        await _repository.updatePassword(account!, oldPassword, newPassword);
    navigaterKey.currentContext!.showSnackBar(result);
    return;
  }
}

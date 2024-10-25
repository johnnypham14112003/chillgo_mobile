import 'dart:io';

import 'package:chillgo_mobile/src/data/api_client.dart';
import 'package:chillgo_mobile/src/data/repositories/account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadAccount();
  }

  Future<void> saveAccount(Account account, String accessToken) async {
    _account = account;
    final accountJson = json.encode(account.toJson());
    await _prefs?.setString(_keyAccount, accountJson);
    await _prefs?.setString(_keyAccessToken, accessToken);
    apiClient.setToken(accessToken);
    notifyListeners();
  }

  Future<void> loadAccount() async {
    final accountJson = _prefs?.getString(_keyAccount);
    final accessToken = _prefs?.getString(_keyAccessToken);
    if (accountJson != null && accessToken != null) {
      _account = Account.fromJson(json.decode(accountJson));
      apiClient.setToken(accessToken);
      notifyListeners();
    }
  }

  Future<void> clearAccount() async {
    _account = null;
    await _prefs?.remove(_keyAccount);
    notifyListeners();
  }

  expiredToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
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

  Future<File?> chooseImage() async {
    final picker = ImagePicker();
    final imageResult = await picker.pickImage(source: ImageSource.gallery);
    image = File(imageResult?.path ?? '');
    return image;
  }

  Future<bool> updateAvatar(File file) async {
    final result = await _repository.updateAvatar(
        file.path, account!.id, account!.fullName);
    if (result != null) {
      _account!.avatarUrl = result['image-url'];
      notifyListeners();
      return true;
    }
    return false;
  }
}

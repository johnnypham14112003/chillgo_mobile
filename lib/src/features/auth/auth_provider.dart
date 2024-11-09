import 'dart:convert';
import 'dart:developer';

import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/data/api_client.dart';
import 'package:chillgo_mobile/src/data/repositories/account_repository.dart';
import 'package:chillgo_mobile/src/data/services/account_services.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:chillgo_mobile/src/main_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  final AccountService _accountService = AccountService();
  final _repository = AccountRepository();
  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      final response = await DialogCustom().showLoading<Response>(
          context, () => _accountService.fetchLogin(email, password));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final accessToken = data['jwt-token'];
        apiClient.setToken(accessToken);
        final account =
            await _repository.getAccount(data['account-info']['id']);
        account.avatarUrl = data['account-info']['avatar-url'];
        await Provider.of<AccountProvider>(context, listen: false)
            .saveAccount(account, accessToken);
        context.navigate(const MainPage());
        context.read<AccountProvider>().getMyPackageChatAI();
        context.read<LocationProvider>().init();
      } else if (response.statusCode >= 400 && response.statusCode <= 499) {
        context.showSnackBar(
            'Email hoặc mật khẫu sai, Mã lỗi: ${response.statusCode}');
      } else if (response.statusCode >= 500) {
        context.showSnackBar('Lỗi Server! Mã lỗi: ${response.statusCode}');
      } else {
        context.showSnackBar('Lỗi không xác định!');
      }
    } catch (e) {
      log(e.toString());

      context.showSnackBar('Lỗi kết nối! Vui lòng thử lại');
    }
  }

  Future<bool> register(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      final response = await DialogCustom().showLoading<Response>(
          context, () => _accountService.fetchRegister(name, email, password));

      if (response.statusCode == 201 || response.statusCode == 200) {
        context.showSnackBar('Tạo thành công!');
        return true;
      } else if (response.statusCode >= 400 && response.statusCode <= 499) {
        context.showSnackBar('Lỗi Client! Mã lỗi: ${response.statusCode}');
        return false;
      } else if (response.statusCode >= 500) {
        context.showSnackBar('Lỗi Server! Mã lỗi: ${response.statusCode}');
        return false;
      } else {
        context.showSnackBar('Lỗi không xác định!');
        return false;
      }
    } catch (e) {
      context.showSnackBar('Lỗi kết nối! Vui lòng thử lại');
      return false;
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/data/services/account_services.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:chillgo_mobile/src/main_page.dart';
import 'package:chillgo_mobile/src/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  final AccountService _accountService = AccountService();

  Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      final response = await DialogCustom().showLoading<Response>(
          context, () => _accountService.fetchLogin(email, password));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final account = Account.fromJson(data['account-info']);
        final accessToken = data['jwt-token'];
        await Provider.of<AccountProvider>(context, listen: false)
            .saveAccount(account, accessToken);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MainPage()),
            (route) => false);
        context.read<LocationProvider>().init();
      } else if (response.statusCode >= 400 && response.statusCode <= 499) {
        context.showSnackBar('Lỗi Client! Mã lỗi: ${response.statusCode}');
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

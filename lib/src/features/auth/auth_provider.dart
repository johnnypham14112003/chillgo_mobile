import 'dart:convert';

import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/data/services/account_services.dart';
import 'package:chillgo_mobile/src/features/home/home_page.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  final AccountService _accountService = AccountService();

  login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      Response response = await _accountService.fetchLogin(email, password);

      if (response.statusCode == 200) {
        final account = Account.fromJson(jsonDecode(response.body));
        await Provider.of<AccountProvider>(context, listen: false)
            .saveAccount(account);

        //Navigate to home page
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomePage()));
      } else if (response.statusCode >= 400 && response.statusCode <= 499) {
        context.showSnackBar('Lỗi Client! Mã lỗi: ${response.statusCode}');
      } else if (response.statusCode >= 500) {
        context.showSnackBar('Lỗi Server! Mã lỗi: ${response.statusCode}');
      } else {
        context.showSnackBar('Lỗi không xác định!');
      }
    } catch (e) {
      context.showSnackBar('Lỗi kết nối! Vui lòng thử lại');
    } finally {
      // setState(() {
      //   _isLoading = false;
      // });
    }
  }

  Future<bool> register(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    try {
      Response response =
          await _accountService.fetchRegister(name, email, password);

      if (response.statusCode == 201) {
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

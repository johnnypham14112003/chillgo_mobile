import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/core/utils/validator.dart';
import 'package:flutter/material.dart';

import 'password_field.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordRetypeController;
  final bool isLoading;
  final Function() onRegister;
  final Function() onNavigateToLogin;
  const RegisterForm(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.passwordController,
      required this.passwordRetypeController,
      required this.isLoading,
      required this.onRegister,
      required this.onNavigateToLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          ImageFactory.branding600px,
          width: 250,
          height: 100,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Text(
            'Đăng Ký Tài Khoản Mới',
            style: context.textTheme.titleLarge
                ?.copyWith(color: Theme.of(context).highlightColor),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Container(
            width: context.querySize.width * 0.8,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.querySize.width,
                  child: TextFormField(
                    controller: nameController,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: 'Họ và tên',
                      labelStyle: context.textTheme.bodyMedium,
                      alignLabelWithHint: true,
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      height: 1.8,
                    ),
                    cursorColor: Theme.of(context).indicatorColor,
                    validator: Validator.validateName,
                  ),
                ),
                SizedBox(
                  width: context.querySize.width,
                  child: TextFormField(
                    controller: emailController,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: 'Email',
                      labelStyle: context.textTheme.bodyMedium,
                      alignLabelWithHint: true,
                    ),
                    style: context.textTheme.bodyMedium?.copyWith(
                      height: 1.8,
                    ),
                    cursorColor: Theme.of(context).indicatorColor,
                    validator: Validator.validateEmail,
                  ),
                ),
                SizedBox(
                  width: context.querySize.width,
                  child: PasswordField(
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  width: context.querySize.width,
                  child: PasswordField(
                    controller: passwordRetypeController,
                    labelText: 'Nhập Lại Mật khẩu',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập lại mật khẩu';
                      }
                      if (value != passwordController.text) {
                        return 'Mật khẩu không khớp';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 40),
          child: ElevatedButton(
            onPressed: isLoading ? null : onRegister,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(context.querySize.width * 0.6, 40),
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc của button
              ),
            ),
            child: isLoading
                ? const CircularProgressIndicator()
                : Text("Đăng Kí",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Theme.of(context).cardColor)),
          ),
        ),
        Text(
          'Bạn đã có tài khoản?',
          style: context.textTheme.bodyMedium,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 40),
          child: ElevatedButton(
            onPressed: onNavigateToLogin,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(context.querySize.width * 0.6, 40),
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              backgroundColor: Theme.of(context).cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Bo góc của button
              ),
            ),
            child: Text("Quay Lại Đăng Nhập",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Theme.of(context).primaryColor)),
          ),
        ),
      ],
    );
  }
}

import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/core/utils/validator.dart';
import 'package:flutter/material.dart';

import 'password_field.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final Function() onLogin;
  final Function() onNavigateToRegister;
  const LoginForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.isLoading,
      required this.onLogin,
      required this.onNavigateToRegister});

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
            'Xin Chào!',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).highlightColor),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
          child: Text(
            'Đăng nhập để trải nghiệm ứng dụng cùng mình nhé!',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Container(
            width: context.querySize.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.querySize.width,
                  child: TextFormField(
                    controller: emailController,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      alignLabelWithHint: true,
                    ),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.8,
                        ),
                    cursorColor: Theme.of(context).indicatorColor,
                    validator: Validator.validateEmail,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: PasswordField(controller: passwordController),
                ),
                Align(
                  alignment: const AlignmentDirectional(1, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: TextButton(
                      onPressed: () {
                        print('CantLoginText pressed ...');
                      },
                      style: TextButton.styleFrom(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          backgroundColor: const Color(0x00FFFFFF),
                          // Transparent color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          )),
                      child: Text(
                        'Quên mật khẩu?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: Gap.l, horizontal: Gap.m),
          child: ElevatedButton(
            onPressed: isLoading ? null : onLogin,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 45),
              padding: EdgeInsets.zero,
              backgroundColor: context.theme.primaryColor,
              elevation: 0,
            ),
            child: isLoading
                ? const CircularProgressIndicator()
                : Text('Đăng Nhập',
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: context.theme.cardColor)),
          ),
        ),
        Text(
          'Bạn chưa có tài khoản?',
          style: context.textTheme.bodyMedium,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: Gap.l, horizontal: Gap.m),
          child: ElevatedButton(
            onPressed: onNavigateToRegister,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 45),
              padding: EdgeInsets.zero,
              backgroundColor: Theme.of(context).cardColor,
            ),
            child: Text(
              "Đi Tới Đăng Ký",
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

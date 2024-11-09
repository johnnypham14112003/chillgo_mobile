import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/core/utils/validator.dart';
import 'package:chillgo_mobile/src/features/auth/widgets/password_field.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/dialog_custom.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});
  final _keyForm = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WrapperPage(
        titleAppBar: 'Thay đổi mật khẩu',
        child: Padding(
          padding: const EdgeInsets.all(Gap.m),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                PasswordField(
                  controller: _oldPasswordController,
                  labelText: 'Mật khẩu hiện tại',
                  validator: Validator.validatePassword,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Gap.s),
                  child: PasswordField(
                    controller: _passwordController,
                    labelText: 'Mật khẩu mới',
                    validator: Validator.validatePassword,
                  ),
                ),
                PasswordField(
                  controller: _confirmPasswordController,
                  labelText: 'Xác nhận mật khẩu',
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Mật khẩu xác nhận không khớp';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: Gap.m),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () => _updatePassword(context),
                        child: const Text('Cập nhật')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _updatePassword(BuildContext context) {
    if (_keyForm.currentState!.validate()) {
      DialogCustom()
          .showLoading(
              context,
              () => context.read<AccountProvider>().updatePassword(
                  _oldPasswordController.text, _passwordController.text))
          .whenComplete(context.pop);
    }
  }
}

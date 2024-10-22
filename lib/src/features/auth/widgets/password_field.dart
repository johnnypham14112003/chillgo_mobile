import 'package:chillgo_mobile/src/core/utils/validator.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? Function(String?)? validator;
  const PasswordField({
    super.key,
    required this.controller,
    this.labelText,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !_passwordVisible,
      decoration: InputDecoration(
        isDense: false,
        labelText: widget.labelText ?? 'Mật khẩu',
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        alignLabelWithHint: true,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Theme.of(context).indicatorColor,
            size: 20,
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.8,
          ),
      cursorColor: Theme.of(context).indicatorColor,
      validator: widget.validator ?? Validator.validatePassword,
    );
  }
}

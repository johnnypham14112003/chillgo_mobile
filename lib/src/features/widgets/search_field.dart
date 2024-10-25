import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController? controller;
  const SearchField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(Gap.m),
        borderSide: BorderSide.none);
    return TextField(
      autofocus: false,
      obscureText: false,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintText: 'Tìm kiếm ...',
        hintStyle: context.textTheme.bodyMedium,
        contentPadding: EdgeInsets.zero,
        focusedBorder: border,
        enabledBorder: border,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: Icon(
          Icons.mic,
          color: context.theme.primaryColor,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(Gap.m),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(Gap.m),
        ),
      ),
    );
  }
}

import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        isDense: false,
        alignLabelWithHint: false,
        hintText: 'Tìm kiếm...',
        hintStyle: context.textTheme.bodyMedium,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            //color: Color(0x00000000),
            color: Theme.of(context).indicatorColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(17),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).secondaryHeaderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(17),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(17),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFFF0000),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(17),
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).indicatorColor,
        ),
        suffixIcon: Icon(
          Icons.mic,
          color: Theme.of(context).indicatorColor,
        ),
      ),
      style: context.textTheme.bodyMedium,
      //validator: _model.textControllerValidator.asValidator(context),
    );
  }
}

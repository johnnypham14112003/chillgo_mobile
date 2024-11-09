import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/user/widgets/item_menu_widget.dart';
import 'package:flutter/material.dart';

class SettingMenuWidget extends StatelessWidget {
  const SettingMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tài Khoản & Bảo Mật',
          style: context.textTheme.titleMedium,
        ),
        const SizedBox(height: Gap.m),
        ...SettingMenuType.values.map(
          (e) => ItemMenuWidget(
            title: e.title,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

enum SettingMenuType {
  region(title: 'Quốc gia'),
  currency(title: 'Tiền tệ'),
  language(title: 'Ngôn ngữ'),
  darkMode(title: 'Chế độ tối'),
  ;

  const SettingMenuType({required this.title});
  final String title;
}

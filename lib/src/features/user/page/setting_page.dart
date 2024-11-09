import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/features/user/widgets/account_security_widget.dart';
import 'package:chillgo_mobile/src/features/user/widgets/item_menu_widget.dart';
import 'package:chillgo_mobile/src/features/user/widgets/setting_menu.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WrapperPage(
      titleAppBar: 'Cài đặt ứng dụng',
      action: const SizedBox.shrink(),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(Gap.m),
          child: ListView(
            children: const [
              AccountSecurityWidget(),
              SizedBox(height: Gap.m),
              SettingMenuWidget(),
              SizedBox(height: Gap.m),
              ItemMenuWidget(
                title: 'Điều khoản & điều kiện',
                icon: Icons.support_rounded,
              ),
              ItemMenuWidget(
                title: 'Chính sách quyền riêng tư',
                icon: Icons.thumb_up_rounded,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/user/page/account_infor_page.dart';
import 'package:chillgo_mobile/src/features/user/page/change_password_page.dart';
import 'package:chillgo_mobile/src/features/user/widgets/item_menu_widget.dart';
import 'package:flutter/material.dart';

class AccountSecurityWidget extends StatelessWidget {
  const AccountSecurityWidget({super.key});

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
        ...AccountSecurityType.values.map((e) => ItemMenuWidget(
              title: e.title,
              icon: e.icon,
              onTap: () => _handleOnTap(context, e),
            )),
      ],
    );
  }

  _handleOnTap(BuildContext context, AccountSecurityType type) {
    switch (type) {
      case AccountSecurityType.account:
        context.push(const AccountInforPage());
        break;
      case AccountSecurityType.security:
        break;
      case AccountSecurityType.password:
        context.push(ChangePasswordPage());
        break;
    }
  }
}

enum AccountSecurityType {
  account(title: 'Thông tin tài khoản', icon: Icons.person_rounded),
  password(title: 'Mật khẩu & bảo mật', icon: Icons.favorite_rounded),
  security(title: 'Thiết lập chế độ riêng tư', icon: Icons.wallet);

  const AccountSecurityType({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/auth/authentication_page.dart';
import 'package:chillgo_mobile/src/features/payment_method/payment_method_page.dart';
import 'package:chillgo_mobile/src/features/user/page/personal_page.dart';
import 'package:chillgo_mobile/src/features/user/page/setting_page.dart';
import 'package:chillgo_mobile/src/features/user/widgets/item_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../account_provider.dart';

enum ProfileMenuType {
  account(icon: Icons.person_search_rounded, label: 'Xem Hồ Sơ Của Tôi'),
  favorite(icon: Icons.favorite_rounded, label: 'Yêu Thích'),
  plan(icon: Icons.save_as, label: 'Kế Hoạch Của Tôi'),
  payment(icon: Icons.wallet, label: 'Phương Thức Thanh Toán'),
  help(icon: Icons.support_rounded, label: 'Trợ Giúp & Hỗ Trợ'),
  setting(icon: Icons.settings_rounded, label: 'Cài Đặt'),
  rate(icon: Icons.thumb_up_rounded, label: 'Đánh Giá Ứng Dụng ChillGo'),
  logout(icon: Icons.logout_rounded, label: 'Đăng Xuất');

  const ProfileMenuType({required this.label, required this.icon});
  final String label;
  final IconData icon;
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  _handleOnTap(BuildContext context, ProfileMenuType type) {
    switch (type) {
      case ProfileMenuType.account:
        context.push(const PersonalPage());
        break;
      case ProfileMenuType.favorite:
        break;
      case ProfileMenuType.plan:
        break;
      case ProfileMenuType.payment:
        context.push(const PaymentMethodPage());
        break;
      case ProfileMenuType.setting:
        context.push(const SettingPage());
        break;
      case ProfileMenuType.logout:
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: context.theme.cardColor,
            titleTextStyle: context.textTheme.titleMedium,
            title: const Text('Đăng Xuất'),
            content: const Text('Bạn có muốn đăng xuất ?'),
            actions: [
              OutlinedButton(
                  onPressed: context.pop,
                  child: Text(
                    'Hủy',
                    style: context.textTheme.bodyMedium,
                  )),
              FilledButton(
                  onPressed: () {
                    context
                      ..navigate(const AuthenticationPage())
                      ..read<AccountProvider>().clearAccount();
                  },
                  child: Text(
                    'Đăng Xuất',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: context.theme.cardColor),
                  )),
            ],
          ),
        );
        break;
      case ProfileMenuType.rate:
        _launchUrl(urlHome);

      case ProfileMenuType.help:
        _launchUrl(urlHelpCenter);
    }
  }

  Future<void> _launchUrl(String value) async {
    final url = Uri.parse(value);
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Gap.m, 0.0, Gap.m, Gap.m),
      child: Column(
        children: ProfileMenuType.values
            .map(
              (e) => ItemMenuWidget(
                title: e.label,
                icon: e.icon,
                onTap: () => _handleOnTap(context, e),
              ),
            )
            .toList(),
      ),
    );
  }
}

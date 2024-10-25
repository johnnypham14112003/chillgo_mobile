import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/auth/authentication_page.dart';
import 'package:chillgo_mobile/src/features/cart/cart_page.dart';
import 'package:chillgo_mobile/src/features/user/page/account_infor_page.dart';
import 'package:flutter/material.dart';

enum ProfileMenuType {
  account(icon: Icons.person_search_rounded, label: 'Xem Hồ Sơ Của Tôi'),
  favorite(icon: Icons.favorite_rounded, label: 'Yêu Thích'),
  plan(icon: Icons.save_as, label: 'Kế Hoạch Của Tôi'),
  cart(
      icon: Icons.shopping_cart_checkout_rounded,
      label: 'Giỏ Hàng, Thanh Toán'),
  setting(icon: Icons.settings_rounded, label: 'Cài Đặt'),
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
        context.push(const AccountInforPage());
        break;
      case ProfileMenuType.favorite:
        break;
      case ProfileMenuType.plan:
        break;
      case ProfileMenuType.cart:
        context.push(const CartPage());
        break;
      case ProfileMenuType.setting:
        break;
      case ProfileMenuType.logout:
        context.navigate(const AuthenticationPage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Gap.m, 0.0, Gap.m, Gap.m),
      child: Column(
        children: ProfileMenuType.values
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: Gap.m),
                child: InkWell(
                  borderRadius: BorderRadius.circular(Gap.s),
                  onTap: () => _handleOnTap(context, e),
                  child: Ink(
                    width: context.querySize.width,
                    padding: const EdgeInsets.all(Gap.m),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(Gap.s),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          e.icon,
                          color: Theme.of(context).indicatorColor,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Text(
                              e.label,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Theme.of(context).indicatorColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

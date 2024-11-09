import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../cart/cart_page.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.fromSTEB(Gap.m, Gap.s, Gap.m, Gap.s),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Gap.m),
          bottomRight: Radius.circular(Gap.m),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, Gap.xl, 0, Gap.xs),
            child: SizedBox(
              width: context.querySize.width,
              child: const SearchField(),
            ),
          ),
          Consumer<AccountProvider>(builder: (context, provider, child) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    ImageFactory.avatarDefault,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(Gap.s, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Xin chào,',
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: Theme.of(context).cardColor),
                        ),
                        Text(
                          provider.account?.fullName ?? 'Người dùng',
                          style: context.textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).secondaryHeaderColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(Gap.s, 0),
                    child: GestureDetector(
                      onTap: () async {},
                      child: Row(children: [
                        Icon(
                          Icons.place,
                          color: Theme.of(context).cardColor,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Việt Nam",
                          style: context.textTheme.bodyMedium
                              ?.copyWith(color: Theme.of(context).cardColor),
                        ),
                      ]),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).cardColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.notifications_rounded,
                    color: Theme.of(context).cardColor,
                  ),
                  onPressed: () {
                    context.showSnackBar('Tính năng đang phát triển');
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

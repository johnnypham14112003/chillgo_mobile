// Pub Packages
import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/user/page/upddate_avatar_page.dart';
import 'package:chillgo_mobile/src/features/user/widgets/profile_menu.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  _chooseImage(BuildContext context) async {
    final image = await context.read<AccountProvider>().chooseImage();
    if (image != null && image.path.isNotEmpty) {
      context.push(UpdateAvatarScreen(file: image));
    }
  }

  @override
  Widget build(BuildContext context) {
   return WrapperPage(
      titleAppBar: 'Tài khoản',
      isMainPage: true,
      child: Consumer<AccountProvider>(builder: (context, provider, child) {
        final account = provider.account!;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
              child: Container(
                width: context.querySize.width,
                height: context.querySize.height * 0.19,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Theme.of(context).cardColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.all(Gap.xs),
                              child: CircleAvatar(
                                radius: context.querySize.width * 0.12,
                                backgroundColor: context.theme.primaryColor,
                                backgroundImage: account.avatarUrl != null
                                    ? NetworkImage(
                                        account.avatarUrl!,
                                      )
                                    : const AssetImage(
                                        ImageFactory.avatarDefault,
                                      ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: Gap.s,
                            child: GestureDetector(
                              onTap: () => _chooseImage(context),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.theme.cardColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.edit_square,
                                    color: context.theme.primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(account.fullName,
                          style: context.textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
            const ProfileMenu()
          ],
        );
      }),
    );
  }
}

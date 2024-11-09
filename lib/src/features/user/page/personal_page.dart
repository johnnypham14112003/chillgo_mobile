import 'package:chillgo_mobile/src/core/configs/image_factory.dart';
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';
import 'package:chillgo_mobile/src/features/user/page/setting_page.dart';
import 'package:chillgo_mobile/src/features/widgets/wrapper_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalPage extends StatelessWidget {
  const PersonalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountProvider>(builder: (context, provider, child) {
      final infor = provider.account!;
      final heightHeader = context.querySize.width * 0.5;
      return WrapperPage(
        titleAppBar: infor.email,
        action: IconButton(
            onPressed: () => context.push(const SettingPage()),
            icon: Icon(
              Icons.settings,
              color: context.theme.cardColor,
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: context.theme.secondaryHeaderColor,
          shape: const CircleBorder(),
          child: const Icon(Icons.add_rounded),
        ),
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: Gap.m),
                width: context.querySize.width,
                height: heightHeader,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// IMPORTANT
                    SizedBox(height: heightHeader),
                    Positioned.fill(
                      top: Gap.xxl,
                      bottom: 0,
                      left: Gap.m,
                      right: Gap.m,
                      child: Container(
                        width: context.querySize.width,
                        decoration: BoxDecoration(
                            color: context.theme.cardColor,
                            borderRadius: BorderRadius.circular(Gap.s),
                            boxShadow: [boxShadow]),
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: Gap.xxl,
                              backgroundImage: infor.avatarUrl != null
                                  ? NetworkImage(
                                      infor.avatarUrl!,
                                    )
                                  : const AssetImage(
                                      ImageFactory.avatarDefault,
                                    ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              infor.fullName,
                              style: context.textTheme.titleSmall,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: Gap.xl, top: Gap.s),
                            child: Text(
                              'Blogger',
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: context.theme.primaryColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: Gap.xl),
                            child: Text('Yêu du lịch, thích khám phá',
                                style: context.textTheme.bodySmall),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: Gap.m),
                              child: Text('2 bài viết',
                                  style: context.textTheme.titleSmall),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: context.theme.cardColor,
                child: TabBar(
                  labelColor: context.theme.primaryColor,
                  indicatorColor: context.theme.primaryColor,
                  dividerColor: Colors.transparent,
                  tabs: ['Bài viết', 'Yêu thích', 'Đăng lại']
                      .map((tab) => Tab(
                            text: tab,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

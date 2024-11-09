// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:chillgo_mobile/src/core/utils/extention.dart';
import 'package:chillgo_mobile/src/features/widgets/search_field.dart';

class WrapperPage extends StatelessWidget {
  final String titleAppBar;
  final Widget child;
  final Widget? bottomNavigationBar;
  final bool isSearchBar;
  final bool isMainPage;
  final Widget? action;
  final Widget? floatingActionButton;
  const WrapperPage({
    super.key,
    required this.titleAppBar,
    required this.child,
    this.bottomNavigationBar,
    this.isSearchBar = false,
    this.isMainPage = false,
    this.action,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width: context.querySize.width,
                  height: context.querySize.height * 0.13 +
                      (isSearchBar ? kToolbarHeight : 0)),
              Container(
                width: context.querySize.width,
                height: context.querySize.height * 0.13 +
                    (isSearchBar ? kToolbarHeight - Gap.m : 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(Gap.m),
                    bottomRight: Radius.circular(Gap.m),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
              ),
              Positioned(
                bottom: isSearchBar ? kToolbarHeight : 0,
                left: Gap.s,
                right: Gap.s,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: isMainPage
                      ? const SizedBox(width: 50)
                      : BackButton(color: context.theme.cardColor),
                  title: Center(
                    child: Text(
                      titleAppBar,
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: context.theme.cardColor),
                    ),
                  ),
                  trailing: action ??
                      IconButton(
                        icon: Icon(
                          Icons.notifications_rounded,
                          color: context.theme.cardColor,
                        ),
                        onPressed: () {},
                      ),
                ),
              ),
              if (isSearchBar)
                const Positioned(
                  bottom: 0,
                  left: Gap.m,
                  right: Gap.m,
                  child: SearchField(),
                ),
            ],
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

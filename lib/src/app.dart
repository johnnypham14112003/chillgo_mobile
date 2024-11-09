import 'package:chillgo_mobile/src/features/auth/authentication_page.dart';
import 'package:chillgo_mobile/src/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/themes/colors_theme.dart';
import 'features/user/account_provider.dart';

var navigaterKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeColorData>(builder: (context, themeProvider, child) {
      return Consumer<AccountProvider>(builder: (context, provider, child) {
        return MaterialApp(
          title: 'Chillgo',
          navigatorKey: navigaterKey,
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeColor,
          home: provider.account != null
              ? const MainPage()
              : const AuthenticationPage(),
        );
      });
    });
  }
}

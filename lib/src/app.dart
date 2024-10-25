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
    //Sync with system and load theme
    Provider.of<ThemeColorData>(context, listen: false)
        .loadThemeFromSharedPref(context);
    return Consumer<AccountProvider>(builder: (context, provider, child) {
      return MaterialApp(
        title: 'Chillgo',
        navigatorKey: navigaterKey,
        debugShowCheckedModeBanner: false,
        //App theme get from 'Provider'  which ref the getter 'themeColor' in class ThemeColorData
        theme: Provider.of<ThemeColorData>(context).themeColor,
        home: provider.account != null
            ? const MainPage()
            : const AuthenticationPage(),
      );
    });
  }
}
/*
Đây là đoạn code mà tôi đã tạo bằng flutter flow, hãy chuyển đổi các widget và Theme data thành của Flutter (dart) dùng thư viện mặc định là material và theme là Theme.of(context).color
* */
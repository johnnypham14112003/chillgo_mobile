import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/themes/colors_theme.dart';
import 'features/auth/authentication_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Sync with system and load theme
    Provider.of<ThemeColorData>(context, listen: false)
        .loadThemeFromSharedPref(context);
    return MaterialApp(
      title: 'Chillgo',
      debugShowCheckedModeBanner: false,
      //App theme get from 'Provider'  which ref the getter 'themeColor' in class ThemeColorData
      theme: Provider.of<ThemeColorData>(context).themeColor,
      home: const AuthenticationPage(),
      // home: const HomePage(),
      //home: ProfilePage(),
    );
  }
}
/*
Đây là đoạn code mà tôi đã tạo bằng flutter flow, hãy chuyển đổi các widget và Theme data thành của Flutter (dart) dùng thư viện mặc định là material và theme là Theme.of(context).color
* */
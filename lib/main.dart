// Pub Packages
import 'package:chillgo_mobile/screens/authentication_page.dart';
import 'package:chillgo_mobile/screens/home_page.dart';
import 'package:chillgo_mobile/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Other Dart
import 'package:chillgo_mobile/enviroment_vars/colors_theme.dart';
import 'package:chillgo_mobile/enviroment_vars/account_cache.dart';

void main() async {
  // Ensure Flutter framework is initialized
  WidgetsFlutterBinding.ensureInitialized();

  //Create SharedPreferences và ThemeColorData
  final sharedPreferences = await SharedPreferences.getInstance();
  final themeData = ThemeColorData(sharedPreferences);
  final accountProvider = AccountProvider();
  await accountProvider.initialize();

  runApp(
    MultiProvider(
      providers: [
        //Create root global 'ThemeColorData'
        ChangeNotifierProvider<ThemeColorData>(
          create: (BuildContext context) => themeData,
        ),
        ChangeNotifierProvider<AccountProvider>(
          create: (BuildContext context) => accountProvider,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

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
      //home: AuthenticationPage(),
      home: HomePage(),
      //home: ProfilePage(),
    );
  }
}
/*
Đây là đoạn code mà tôi đã tạo bằng flutter flow, hãy chuyển đổi các widget và Theme data thành của Flutter (dart) dùng thư viện mặc định là material và theme là Theme.of(context).color
* */
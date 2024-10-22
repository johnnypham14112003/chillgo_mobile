// Pub Packages
import 'package:chillgo_mobile/src/features/auth/auth_provider.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Other Dart
import 'package:chillgo_mobile/src/core/themes/colors_theme.dart';
import 'package:chillgo_mobile/src/features/user/account_provider.dart';

import 'src/app.dart';

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
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LocationProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

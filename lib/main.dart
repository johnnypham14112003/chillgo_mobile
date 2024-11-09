// Pub Packages
import 'package:chillgo_mobile/src/features/auth/auth_provider.dart';
import 'package:chillgo_mobile/src/features/blog/blog_provider.dart';
import 'package:chillgo_mobile/src/features/location/location_provider.dart';
import 'package:chillgo_mobile/src/features/cart/cart_provider.dart';
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
  runApp(
    MultiProvider(
      providers: [
        //Create root global 'ThemeColorData'
        ChangeNotifierProvider<ThemeColorData>(
          create: (BuildContext context) => themeData,
        ),
        ChangeNotifierProvider<AccountProvider>(
          create: (BuildContext context) => AccountProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => LocationProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => CartProvider(),
        ),

        ChangeNotifierProvider(
          create: (BuildContext context) => BlogProvider(),
        ),
       
      ],
      child: const MyApp(),
    ),
  );
}

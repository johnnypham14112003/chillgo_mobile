// Pub Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Other Dart
import 'package:chillgo_mobile/enviroment_vars/colors_theme.dart';
import 'package:chillgo_mobile/screens/home_page.dart';

void main() async {
  // Ensure Flutter framework is initialized
  WidgetsFlutterBinding.ensureInitialized();

  //Create SharedPreferences và ThemeColorData
  final sharedPreferences = await SharedPreferences.getInstance();
  final themeData = ThemeColorData(sharedPreferences);
  runApp(
    //Create root global 'ThemeColorData'
    ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => themeData,
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
      home: const HomePage(),
    );
  }
}

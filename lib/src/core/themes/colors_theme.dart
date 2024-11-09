// Pub Packages
import 'package:chillgo_mobile/src/core/themes/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Declare Global Vars - Color Theme
var light = ThemeData(
    primaryColor: const Color.fromRGBO(90, 78, 255, 1),
    primaryColorLight: const Color.fromRGBO(111, 116, 240, 1),
    primaryColorDark: const Color.fromRGBO(90, 28, 205, 1),
    secondaryHeaderColor: const Color.fromRGBO(205, 238, 0, 1),
    highlightColor: const Color.fromRGBO(238, 160, 255, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
    cardColor: Colors.white,
    indicatorColor: const Color.fromRGBO(32, 38, 45, 1),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromRGBO(32, 38, 45, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromRGBO(205, 238, 0, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFFF0000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFFF0000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(10, 10, 10, 0.75),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(Gap.m)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color.fromRGBO(205, 238, 0, 1),
        textStyle:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(Gap.m)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Gap.m)),
    )),
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
    ));

var dark = ThemeData(
    primaryColor: const Color.fromRGBO(205, 238, 0, 1),
    primaryColorLight: const Color.fromRGBO(226, 244, 166, 1),
    primaryColorDark: const Color.fromRGBO(115, 158, 0, 1),
    secondaryHeaderColor: const Color.fromRGBO(90, 78, 255, 1),
    highlightColor: const Color.fromRGBO(238, 160, 255, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(10, 10, 10, 1),
    cardColor: const Color.fromRGBO(32, 38, 45, 1),
    indicatorColor: const Color.fromRGBO(223, 217, 210, 1),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromRGBO(32, 38, 45, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromRGBO(205, 238, 0, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFFF0000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0xFFFF0000),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(0),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(223, 217, 210, 0.75),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(Gap.m)),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color.fromRGBO(205, 238, 0, 1),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(Gap.m)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Gap.m)),
    )),
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(223, 217, 210, 1),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(223, 217, 210, 1),
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(223, 217, 210, 1),
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(223, 217, 210, 1),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(223, 217, 210, 1),
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.normal,
        color: Color.fromRGBO(223, 217, 210, 1),
      ),
    ));
//====================================================================================

//Use 'Provider' pattern to manage color theme and save in 'SharedPreferences'
class ThemeColorData with ChangeNotifier {
  //-----------[ DECLARE ]-----------
  SharedPreferences _sharedPreferences;
  bool _isDark;

  //Set default
  ThemeColorData(this._sharedPreferences) : _isDark = true {
    loadThemeFromSharedPref();
  }

  //Getter return var type
  bool get isDark => _isDark;

  ThemeData get themeColor {
    return _isDark ? dark : light;
  }

  //-----------[ Method ]-----------
  //Create local memory
  Future<void> createSharedPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //Save to local memory
  void saveThemeToSharedPref(bool value) {
    _sharedPreferences.setBool('themeData', value);
  }

  //Get current from memory
  Future<void> loadThemeFromSharedPref() async {
    await createSharedPrefObject();

    // Get themeData from local storage
    bool? storedTheme = _sharedPreferences.getBool('themeData');

    if (storedTheme == null) {
      _isDark =
          SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
    } else {
      _isDark = storedTheme;
    }
    notifyListeners();
  }

  //Change Theme
  void toggleTheme() {
    _isDark = !_isDark;
    saveThemeToSharedPref(_isDark);
    notifyListeners();
  }
}

// Pub Packages
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Declare Global Vars - Color Theme
var light = ThemeData(
    primaryColor: const Color.fromRGBO(90, 78, 255, 1),
    primaryColorLight: const Color.fromRGBO(111, 116, 240, 1),
    secondaryHeaderColor: const Color.fromRGBO(205, 238, 0, 1),
    highlightColor: const Color.fromRGBO(238, 160, 255, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromRGBO(10, 10, 10, 0.75)),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
      headlineSmall: TextStyle(
        color: Color.fromRGBO(32, 38, 45, 1),
      ),
    ));

var dark = ThemeData(
    primaryColor: const Color.fromRGBO(205, 238, 0, 1),
    primaryColorLight: const Color.fromRGBO(226, 244, 166, 1),
    secondaryHeaderColor: const Color.fromRGBO(90, 78, 255, 1),
    highlightColor: const Color.fromRGBO(238, 160, 255, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(10, 10, 10, 1),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromRGBO(223, 217, 210, 0.75)),
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Color.fromRGBO(223, 217, 210, 1),
      ),
      headlineSmall: TextStyle(
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
  ThemeColorData(this._sharedPreferences) : _isDark = true;

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
  Future<void> loadThemeFromSharedPref(BuildContext context) async {
    await createSharedPrefObject();

    // Get themeData from local storage
    bool? storedTheme = _sharedPreferences.getBool('themeData');

    if (storedTheme == null) {
      _isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
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

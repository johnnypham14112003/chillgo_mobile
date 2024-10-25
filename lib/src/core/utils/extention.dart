import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  /// Returns [MediaQueryData.size] from the nearest [MediaQuery] ancestor or throws an exception, if no such ancestor exists.
  Size get querySize => MediaQuery.sizeOf(this);

  /// Returns [ThemeData] from the nearest [Theme] ancestor or throws an exception, if no such ancestor exists.
  ThemeData get theme => Theme.of(this);

  /// Returns [ColorScheme] from the nearest [Theme] ancestor or throws an exception, if no such ancestor exists.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  dynamic showSnackBar(String message) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(content: Text(message)),
      );
  Future<void> showPopupNotifi(String title, String content) async {
    showDialog(
      context: this,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
      ),
    );
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(this);
    });
    return;
  }

  void pop() => Navigator.pop(this);

  void push(Widget screen) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => screen));

  void navigate(Widget screen) => Navigator.pushAndRemoveUntil(
      this, MaterialPageRoute(builder: (context) => screen), (route) => false);
}

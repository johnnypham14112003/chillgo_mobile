import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {

  /// Returns [MediaQueryData.size] from the nearest [MediaQuery] ancestor or throws an exception, if no such ancestor exists.
  Size get querySize => MediaQuery.sizeOf(this);

  /// Returns [ThemeData] from the nearest [Theme] ancestor or throws an exception, if no such ancestor exists.
  ThemeData get theme => Theme.of(this);

  /// Returns [ColorScheme] from the nearest [Theme] ancestor or throws an exception, if no such ancestor exists.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
}
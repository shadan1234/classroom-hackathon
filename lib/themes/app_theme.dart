// lib/components/theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.deepPurple;
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Colors.white;
  static const TextStyle headingTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );
  static const TextStyle subHeadingTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}

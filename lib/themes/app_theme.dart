import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.deepPurple;
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Colors.white;

  // Define a custom button color
  static const Color purpleButtonColor = Color(0xFF673AB7); // Replace with your preferred purple hex code

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

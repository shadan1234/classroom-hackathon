
import 'package:flutter/material.dart';
import 'package:grade_pro/features/dashboard/students_dashboard_screen.dart';
import 'package:grade_pro/features/faculty/faculty_mainPage.dart';
import 'package:grade_pro/features/faculty/ta_management_screen.dart';
import 'package:grade_pro/features/ta/ta_dashboard_screen.dart';
import 'package:grade_pro/features/ta/ta_main_page.dart';
import 'package:grade_pro/onboarding_screen.dart';
import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grading Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: OnboardingScreen.routeName  ,
      onGenerateRoute: generateRoute, // Use the centralized router
    );
  }
}

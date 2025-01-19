import 'package:classroom_goa_hackathon/features/courses/course_management_system.dart';
import 'package:classroom_goa_hackathon/features/dashboard/students_dashboard_screen.dart';
import 'package:classroom_goa_hackathon/features/faculty/faculty_dashboard_screen.dart';
import 'package:classroom_goa_hackathon/features/faculty/faculty_mainPage.dart';
import 'package:classroom_goa_hackathon/features/ta/ta_dashboard_screen.dart';
import 'package:classroom_goa_hackathon/features/ta/ta_main_page.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
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
      initialRoute: FacultyDashboardScreen.routeName  ,
      onGenerateRoute: generateRoute, // Use the centralized router
    );
  }
}

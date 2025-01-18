import 'package:classroom_goa_hackathon/features/dashboard/profile_screen.dart';
import 'package:classroom_goa_hackathon/features/faculty/faculty_grading.dart';
import 'package:classroom_goa_hackathon/features/faculty/student_management.dart';
import 'package:classroom_goa_hackathon/features/faculty/ta_management_screen.dart';
import 'package:flutter/material.dart';

class FacultyDashboardScreen extends StatefulWidget {
  static const String routeName = '/faculty_main';

  const FacultyDashboardScreen({Key? key}) : super(key: key);

  @override
  _FacultyDashboardScreenState createState() => _FacultyDashboardScreenState();
}

class _FacultyDashboardScreenState extends State<FacultyDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const StudentManagementScreen(),
    const TAManagementScreen(),
    const GradesFeedbackScreen(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.blue[50], // Light blue background
        selectedItemColor: Colors.blue, // Blue for selected items
        unselectedItemColor: Colors.grey[600], // Grey for unselected items
        type: BottomNavigationBarType.fixed, // Ensures text is always visible
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Student Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'TA Management',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Grades & Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

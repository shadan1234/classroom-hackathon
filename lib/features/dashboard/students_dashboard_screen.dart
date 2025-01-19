import 'package:flutter/material.dart';
import 'courses_screen.dart';
import 'assignments.dart';
import 'profile_screen.dart';
import 'grades_tab.dart'; // Import Grades Screen

class StudentDashboard extends StatefulWidget {
  static const String routeName = "/student-dashboard";

  const StudentDashboard({super.key});
  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  int _currentIndex = 0;

  // Tabs for each section
  final List<Widget> _tabs = [
    CoursesTab(),       // Courses Screen
    AssignmentsTab(),   // Assignments Screen
    GradesTab(),        // Grades Tab
    const ProfileTab(),       // Profile Screen
  ];

  // Color Scheme
  final Color primaryColor = Colors.blueAccent;
  final Color secondaryColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Dashboard',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A11CB), Color(0xFF2575FC)], // Purple to Blue gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: _tabs[_currentIndex], // Display the selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: secondaryColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Assignments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Grades',
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

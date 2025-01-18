import 'package:classroom_goa_hackathon/features/faculty/student_management.dart';
import 'package:classroom_goa_hackathon/features/faculty/ta_management_screen.dart';
import 'package:classroom_goa_hackathon/themes/app_theme.dart';
import 'package:flutter/material.dart';

class FacultyDashboard extends StatelessWidget {
  static const String routeName = '/faculty_dashboard';

  const FacultyDashboard({Key? key}) : super(key: key);

  Widget buildDashboardCard(
      BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25, // Increased height
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF8E44AD), Color(0xFF5B2C6F)], // Purple Gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80.0, // Bigger icon
                color: Colors.white,
              ),
              const SizedBox(height: 20.0), // More spacing between icon and text
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0, // Increased font size
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2, // Two columns for a grid layout
        childAspectRatio: 0.75, // Adjusted ratio to have taller cards
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          buildDashboardCard(
            context,
            Icons.people,
            'Student Management',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => StudentManagementScreen()));
            },
          ),
          buildDashboardCard(
            context,
            Icons.school,
            'TA Management',
            () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => TAManagementScreen()));
            },
          ),
          buildDashboardCard(
            context,
            Icons.assignment,
            'Review Grades & Feedback',
            () {
              // Navigate to Review Grades & Feedback Screen
            },
          ),
          buildDashboardCard(
            context,
            Icons.assignment_turned_in,
            'Assignment Management',
            () {
              // Navigate to Assignment Management Screen
            },
          ),
        ],
      ),
    );
  }
}

// lib/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import '../../commons/custom_card.dart';
import '../../models/user_models.dart';
import '../../themes/app_theme.dart';


class DashboardScreen extends StatelessWidget {
  final UserRole userRole;

  const DashboardScreen({required this.userRole, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildDashboardOptions(context),
        ),
      ),
    );
  }

  List<Widget> _buildDashboardOptions(BuildContext context) {
    if (userRole == UserRole.faculty) {
      return [
        CustomCard(
          title: 'Manage Courses',
          subtitle: 'Add TAs and Students to courses',
          icon: Icons.book,
          onTap: () => Navigator.pushNamed(context, '/manage_courses'),
        ),
        CustomCard(
          title: 'Grade Overview',
          subtitle: 'View and override TA-submitted grades',
          icon: Icons.grade,
          onTap: () => Navigator.pushNamed(context, '/grade_overview'),
        ),
      ];
    } else if (userRole == UserRole.ta) {
      return [
        CustomCard(
          title: 'View Submissions',
          subtitle: 'Review and grade student submissions',
          icon: Icons.assignment,
          onTap: () => Navigator.pushNamed(context, '/view_submissions'),
        ),
      ];
    } else if (userRole == UserRole.student) {
      return [
        CustomCard(
          title: 'My Grades',
          subtitle: 'View graded submissions and feedback',
          icon: Icons.check_circle,
          onTap: () => Navigator.pushNamed(context, '/my_grades'),
        ),
        CustomCard(
          title: 'Request Re-evaluation',
          subtitle: 'Raise queries on grades',
          icon: Icons.help,
          onTap: () => Navigator.pushNamed(context, '/request_revaluation'),
        ),
      ];
    } else {
      return [const Text('Invalid role')];
    }
  }
}

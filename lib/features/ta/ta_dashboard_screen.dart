import 'package:flutter/material.dart';
import 'package:grade_pro/features/ta/course_details.dart';

class TADashboardScreen extends StatelessWidget {
  static const String routeName='/taDashboard_screen';
  
  final List<Map<String, String>> assignedCourses = [
    {'courseName': 'Math 101', 'courseCode': 'MATH101'},
    {'courseName': 'Physics 201', 'courseCode': 'PHY201'},
    {'courseName': 'Computer Science 301', 'courseCode': 'CS301'},
  ];

   TADashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TA Dashboard'),
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
      body: ListView.builder(
        itemCount: assignedCourses.length,
        itemBuilder: (context, index) {
          final course = assignedCourses[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(course['courseName']!),
              subtitle: Text('Course Code: ${course['courseCode']}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseDetailsScreenTA(courseName: course['courseName']!),
                  ),
                );
              },
            ),
          );
        },
      ),

    );
  }
}

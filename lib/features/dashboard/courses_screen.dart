import 'package:classroom_goa_hackathon/features/dashboard/course_details.dart';
import 'package:flutter/material.dart';

class CoursesTab extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {'title': 'Math 101', 'status': 'Ongoing', 'grade': 'A', 'feedback': 'Great work!'},
    {'title': 'Physics 201', 'status': 'Completed', 'grade': 'B+', 'feedback': 'Needs improvement.'},
    {'title': 'Chemistry 301', 'status': 'Ongoing', 'grade': 'N/A', 'feedback': 'Pending submission.'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(course['title']!),
            subtitle: Text('Status: ${course['status']}'),
            
          ),
        );
      },
    );
  }
}

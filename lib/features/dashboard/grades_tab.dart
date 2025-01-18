import 'package:classroom_goa_hackathon/features/dashboard/course_details.dart';  
import 'package:flutter/material.dart';

class GradesTab extends StatelessWidget {
  // Sample list of enrolled courses
  final List<Map<String, String>> courses = [
    {'title': 'Mathematics', 'grade': 'A'},
    {'title': 'Physics', 'grade': 'B+'},
    {'title': 'Computer Science', 'grade': 'A-'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              courses[index]['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Grade: ${courses[index]['grade']}'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to CourseDetailsScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => 
                 
                  CourseDetailsScreen(
                     grade: 'A', feedback: 'good very good', courseName: courses[index]['title']!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

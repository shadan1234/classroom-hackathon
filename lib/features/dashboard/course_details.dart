import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  final String courseName;
  final String grade;
  final String feedback;

  const CourseDetailsScreen({
    Key? key,
    required this.courseName,
    required this.grade,
    required this.feedback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: $courseName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Grade: $grade',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Feedback:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              feedback,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Apply for reevaluation logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Reevaluation requested!')),
                );
              },
              child: const Text('Apply for Reevaluation'),
            ),
          ],
        ),
      ),
    );
  }
}

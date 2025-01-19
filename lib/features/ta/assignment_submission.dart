import 'package:flutter/material.dart';
import 'package:grade_pro/features/ta/grading_screen.dart';

class AssignmentSubmissionsScreen extends StatelessWidget {
  final String assignmentTitle;
  final String courseName;

  AssignmentSubmissionsScreen({
    super.key,
    required this.assignmentTitle,
    required this.courseName,
  });

  final List<Map<String, dynamic>> submissions = [
    {'studentName': 'John Doe', 'submissionDate': '2025-01-18', 'status': 'Pending'},
    {'studentName': 'Jane Smith', 'submissionDate': '2025-01-17', 'status': 'Graded'},
    {'studentName': 'Alex Brown', 'submissionDate': '2025-01-16', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$assignmentTitle - Submissions'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)], // Blue to Green gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: $courseName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: submissions.length,
                itemBuilder: (context, index) {
                  final submission = submissions[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(submission['studentName']),
                      subtitle: Text('Submitted on: ${submission['submissionDate']}'),
                      trailing: Text(
                        submission['status'],
                        style: TextStyle(
                          color: submission['status'] == 'Pending' ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GradingScreen(
                              studentName: submission['studentName'],
                              assignmentTitle: assignmentTitle,
                              courseName: courseName,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

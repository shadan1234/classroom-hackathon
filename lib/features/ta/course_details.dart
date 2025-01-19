import 'package:flutter/material.dart';
import 'package:grade_pro/features/ta/assignment_submission.dart';

class CourseDetailsScreenTA extends StatelessWidget {
  final String courseName;

   CourseDetailsScreenTA({super.key, required this.courseName});

  final List<Map<String, String>> assignments = [
    {'title': 'Assignment 1', 'dueDate': '2025-01-20', 'status': 'Pending'},
    {'title': 'Assignment 2', 'dueDate': '2025-01-25', 'status': 'Graded'},
  ];

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
            const Text(
              'Assignments:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: assignments.length,
                itemBuilder: (context, index) {
                  final assignment = assignments[index];
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(assignment['title']!),
                      subtitle: Text('Due: ${assignment['dueDate']}'),
                      trailing: Text(
                        assignment['status']!,
                        style: TextStyle(
                          color: assignment['status'] == 'Pending' ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssignmentSubmissionsScreen(
                              assignmentTitle: assignment['title']!,
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

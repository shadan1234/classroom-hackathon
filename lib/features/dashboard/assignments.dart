import 'package:flutter/material.dart';

import 'assignment_details_screen.dart';

class AssignmentsTab extends StatelessWidget {
  final List<Map<String, String>> assignments = [
    {'title': 'Assignment 1', 'course': 'Math 101', 'dueDate': '2025-01-25', 'status': 'Pending'},
    {'title': 'Assignment 2', 'course': 'Physics 201', 'dueDate': '2025-01-22', 'status': 'Submitted'},
  ];

   AssignmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: assignments.length,
      itemBuilder: (context, index) {
        final assignment = assignments[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(assignment['title']!),
            subtitle: Text('Course: ${assignment['course']}\nDue: ${assignment['dueDate']}'),
            trailing: Text(
              assignment['status']!,
              style: TextStyle(
                color: assignment['status'] == 'Pending' ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // Navigate to the AssignmentDetails screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AssignmentDetailsScreen(
                    title: assignment['title']!,
                    course: assignment['course']!,
                    dueDate: assignment['dueDate']!,
                    status: assignment['status']!,
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

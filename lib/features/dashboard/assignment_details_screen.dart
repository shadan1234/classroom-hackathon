import 'package:flutter/material.dart';

class AssignmentDetailsScreen extends StatefulWidget {
  final String title;
  final String course;
  final String dueDate;
  final String status;

  const AssignmentDetailsScreen({
    Key? key,
    required this.title,
    required this.course,
    required this.dueDate,
    required this.status,
  }) : super(key: key);

  @override
  State<AssignmentDetailsScreen> createState() => _AssignmentDetailsScreenState();
}

class _AssignmentDetailsScreenState extends State<AssignmentDetailsScreen> {
  bool isSubmitted = false;

  void uploadAssignment() {
    setState(() {
      isSubmitted = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Assignment uploaded successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course: ${widget.course}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Due Date: ${widget.dueDate}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Status: ${isSubmitted ? "Submitted" : widget.status}',
              style: TextStyle(
                fontSize: 18,
                color: isSubmitted ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: isSubmitted ? null : uploadAssignment,
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload Assignment'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            if (isSubmitted)
              const Center(
                child: Text(
                  'You have successfully submitted your assignment!',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

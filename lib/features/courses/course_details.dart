import 'package:flutter/material.dart';
import '../../commons/custom_button.dart';
import '../../modals/add_assignment.dart';
import '../../modals/add_ta_student_modal.dart';
import '../../themes/app_theme.dart';


class CourseDetailScreen extends StatefulWidget {
  final String courseName;

  const CourseDetailScreen({required this.courseName, super.key});

  static const String routeName = '/course_details';

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  final List<String> tas = ['TA 1', 'TA 2'];
  final List<String> students = ['Student 1', 'Student 2'];
  final List<Map<String, String>> assignments = [
    {'title': 'Assignment 1', 'due': '2025-01-20', 'file': 'None'}
  ];

  void _addTA(String name) {
    setState(() {
      tas.add(name);
    });
  }

  void _addStudent(String name) {
    setState(() {
      students.add(name);
    });
  }

  void _addAssignment(String title, String dueDate, String fileName) {
    setState(() {
      assignments.add({'title': title, 'due': dueDate, 'file': fileName});
    });
  }

  void _removeTA(int index) {
    setState(() {
      tas.removeAt(index);
    });
  }

  void _removeStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  void _removeAssignment(int index) {
    setState(() {
      assignments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.courseName),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => AddTAStudentModal(
              onAddTA: _addTA,
              onAddStudent: _addStudent,
            ),
          );
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Teaching Assistants
              _buildSection('Teaching Assistants', tas, (index) => _removeTA(index)),
              const SizedBox(height: 16),

              // Students
              _buildSection('Students', students, (index) => _removeStudent(index)),
              const SizedBox(height: 16),

              // Assignments
              _buildAssignmentsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    String title,
    List<String> items,
    void Function(int index) onRemove,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onRemove(index),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildAssignmentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Assignments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...assignments.asMap().entries.map((entry) {
          final index = entry.key;
          final assignment = entry.value;
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: ListTile(
              title: Text(assignment['title'] ?? ''),
              subtitle: Text('Due: ${assignment['due']} \nFile: ${assignment['file']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeAssignment(index),
              ),
            ),
          );
        }).toList(),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Add Assignment',
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => AddAssignmentModal(onAddAssignment: _addAssignment),
            );
          },
        ),
      ],
    );
  }
}

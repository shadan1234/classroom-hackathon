
import 'package:flutter/material.dart';
import 'package:grade_pro/features/courses/course_details.dart';
import '../../commons/custom_button.dart';
import '../../commons/custom_textfield.dart';
import '../../themes/app_theme.dart';

class CourseManagementScreen extends StatefulWidget {
  static const String routeName = '/manage_courses';

  const CourseManagementScreen({super.key});

  @override
  State<CourseManagementScreen> createState() => _CourseManagementScreenState();
}

class _CourseManagementScreenState extends State<CourseManagementScreen> {
  final TextEditingController courseNameController = TextEditingController();

  final List<String> courses = [
    "Math 101",
    "Physics 202",
    "CS 305"
  ]; // Sample data

  void _addCourse() {
    final String courseName = courseNameController.text.trim();
    if (courseName.isNotEmpty) {
      setState(() {
        courses.add(courseName);
      });
      Navigator.pop(context); // Close the bottom sheet
      courseNameController.clear(); // Clear input
    }
  }

  void _showAddCourseModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New Course',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Course Name',
                controller: courseNameController,
              ),
              const SizedBox(height: 16),
              CustomButton(
                  color: AppTheme.primaryColor,
                text: 'Add Course',
                onPressed: _addCourse,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Courses'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCourseModal,
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Existing Courses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CourseDetailScreen(courseName: courses[index]),
                          ),
                        );
                      },
                      title: Text(courses[index],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            courses.removeAt(index);
                          });
                        },
                      ),
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

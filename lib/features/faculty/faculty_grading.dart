import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GradesFeedbackScreen extends StatefulWidget {
  const GradesFeedbackScreen({Key? key}) : super(key: key);

  @override
  State<GradesFeedbackScreen> createState() => _GradesFeedbackScreenState();
}

class _GradesFeedbackScreenState extends State<GradesFeedbackScreen> {
  final List<Map<String, dynamic>> students = [
    {'name': 'John Doe', 'id': 'ST001', 'grade': 'A', 'feedback': 'Excellent work!'},
    {'name': 'Jane Smith', 'id': 'ST002', 'grade': 'B', 'feedback': 'Good effort, needs improvement in assignments.'},
    {'name': 'Alex Brown', 'id': 'ST003', 'grade': 'A', 'feedback': 'Consistently great performance!'},
    {'name': 'Emily Davis', 'id': 'ST004', 'grade': 'C', 'feedback': 'Needs to work on participation.'},
  ];

  final Map<String, int> gradeDistribution = {'A': 2, 'B': 1, 'C': 1};

  void addOrEditGrade(int? index) {
    final TextEditingController nameController = TextEditingController(
      text: index != null ? students[index]['name'] : '',
    );
    final TextEditingController idController = TextEditingController(
      text: index != null ? students[index]['id'] : '',
    );
    final TextEditingController gradeController = TextEditingController(
      text: index != null ? students[index]['grade'] : '',
    );
    final TextEditingController feedbackController = TextEditingController(
      text: index != null ? students[index]['feedback'] : '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(index == null ? 'Add Grade & Feedback' : 'Edit Grade & Feedback'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: idController,
                  decoration: const InputDecoration(labelText: 'ID'),
                ),
                TextField(
                  controller: gradeController,
                  decoration: const InputDecoration(labelText: 'Grade'),
                ),
                TextField(
                  controller: feedbackController,
                  decoration: const InputDecoration(labelText: 'Feedback'),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    idController.text.isNotEmpty &&
                    gradeController.text.isNotEmpty) {
                  setState(() {
                    if (index == null) {
                      students.add({
                        'name': nameController.text,
                        'id': idController.text,
                        'grade': gradeController.text,
                        'feedback': feedbackController.text,
                      });
                      gradeDistribution.update(
                          gradeController.text, (value) => value + 1,
                          ifAbsent: () => 1);
                    } else {
                      // Update grade distribution
                      gradeDistribution.update(
                          students[index]['grade'], (value) => value - 1);
                      gradeDistribution.update(
                          gradeController.text, (value) => value + 1,
                          ifAbsent: () => 1);

                      students[index] = {
                        'name': nameController.text,
                        'id': idController.text,
                        'grade': gradeController.text,
                        'feedback': feedbackController.text,
                      };
                    }
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(index == null
                          ? 'Grade added successfully!'
                          : 'Grade updated successfully!'),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void deleteGrade(int index) {
    setState(() {
      gradeDistribution.update(
          students[index]['grade'], (value) => value - 1,
          ifAbsent: () => 0);
      students.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Grade removed successfully!')),
    );
  }

  void bulkUpload() {
    // Logic for uploading grades and feedback via CSV or Excel
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bulk upload feature coming soon!')),
    );
  }

  void exportData() {
    // Logic for exporting data
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export feature coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grades & Feedback Management'),
        actions: [
          IconButton(
            onPressed: exportData,
            icon: const Icon(Icons.download),
            tooltip: 'Export Data',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Grade Distribution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SfCircularChart(
              series: <CircularSeries>[
                PieSeries<MapEntry<String, int>, String>(
                  dataSource: gradeDistribution.entries.toList(),
                  xValueMapper: (data, _) => data.key,
                  yValueMapper: (data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(student['grade']),
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      title: Text(student['name']),
                      subtitle: Text(student['feedback']),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Edit') {
                            addOrEditGrade(index);
                          } else if (value == 'Delete') {
                            deleteGrade(index);
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'Edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem(
                            value: 'Delete',
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: bulkUpload,
              icon: const Icon(Icons.upload),
              label: const Text('Bulk Upload Grades'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addOrEditGrade(null),
        child: const Icon(Icons.add),
        tooltip: 'Add Grade',
      ),
    );
  }
}

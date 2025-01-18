import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class GradingScreen extends StatefulWidget {
  final String studentName;
  final String assignmentTitle;
  final String courseName;

  const GradingScreen({
    Key? key,
    required this.studentName,
    required this.assignmentTitle,
    required this.courseName,
  }) : super(key: key);

  @override
  State<GradingScreen> createState() => _GradingScreenState();
}

class _GradingScreenState extends State<GradingScreen> {
  String? selectedFileName;
  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }
  }

  void submitGrading() {
    if (feedbackController.text.isNotEmpty && gradeController.text.isNotEmpty && selectedFileName != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Grading submitted successfully!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields before submitting')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grading: ${widget.studentName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Assignment: ${widget.assignmentTitle}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: feedbackController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Feedback',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: gradeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Grade',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton.icon(
                onPressed: pickFile,
                icon: const Icon(Icons.upload_file),
                label: const Text('Upload Graded File'),
              ),
              const SizedBox(height: 8.0),
              if (selectedFileName != null)
                Text(
                  'Selected File: $selectedFileName',
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              const SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: submitGrading,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text('Submit Grading'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

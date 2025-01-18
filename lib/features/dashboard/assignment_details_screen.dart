import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
  String? selectedFileName; // Holds the name of the selected PDF file

  // Function to pick a PDF file
  Future<void> pickPdfFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          selectedFileName = result.files.single.name;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File selected: ${result.files.single.name}')),
        );
      } else {
        debugPrint("No file selected");
      }
    } catch (e) {
      debugPrint("Error picking file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick a file.')),
      );
    }
  }

  // Function to simulate file upload
  void uploadAssignment() {
    if (selectedFileName == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file before uploading!')),
      );
      return;
    }

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
                onPressed: pickPdfFile,
                icon: const Icon(Icons.folder_open),
                label: const Text('Select PDF File'),
              ),
            ),
            const SizedBox(height: 16.0),
            if (selectedFileName != null)
              Center(
                child: Text(
                  'Selected File: $selectedFileName',
                  style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
              ),
            const SizedBox(height: 16.0),
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

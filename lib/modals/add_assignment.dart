
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:grade_pro/themes/app_theme.dart';

import '../../../commons/custom_button.dart';
import '../../../commons/custom_textfield.dart';

class AddAssignmentModal extends StatefulWidget {
  final void Function(String title, String dueDate, String fileName) onAddAssignment;

  const AddAssignmentModal({required this.onAddAssignment, super.key});

  @override
  State<AddAssignmentModal> createState() => _AddAssignmentModalState();
}

class _AddAssignmentModalState extends State<AddAssignmentModal> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  String selectedFileName = 'None';
  
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
    } else {
      debugPrint("No file selected");
    }
  } catch (e) {
    debugPrint("Error picking file: $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Assignment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Assignment Title',
              controller: titleController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Due Date (YYYY-MM-DD)',
              controller: dueDateController,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text('Selected File: $selectedFileName'),
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: pickPdfFile,
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
                color: AppTheme.primaryColor,
              text: 'Add Assignment',
              onPressed: () {
                if (titleController.text.trim().isNotEmpty &&
                    dueDateController.text.trim().isNotEmpty) {
                  widget.onAddAssignment(
                    titleController.text.trim(),
                    dueDateController.text.trim(),
                    selectedFileName,
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

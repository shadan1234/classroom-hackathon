import 'package:flutter/material.dart';
import '../../../commons/custom_button.dart';
import '../../../commons/custom_textfield.dart';

class AddTAStudentModal extends StatelessWidget {
  final void Function(String name) onAddTA;
  final void Function(String name) onAddStudent;

  const AddTAStudentModal({
    required this.onAddTA,
    required this.onAddStudent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

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
              'Add TA or Student',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Enter Name',
              controller: controller,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: 'Add TA',
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      onAddTA(controller.text.trim());
                      Navigator.pop(context);
                    }
                  },
                ),
                CustomButton(
                  text: 'Add Student',
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      onAddStudent(controller.text.trim());
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

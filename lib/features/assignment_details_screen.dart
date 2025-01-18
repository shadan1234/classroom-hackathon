// import 'package:flutter/material.dart';

// class AssignmentDetailsScreen extends StatelessWidget {
//   static const String routeName='assignment_details_screen';
//   final String title;
//   final String dueDate;
//   final String? filePath;

//   const AssignmentDetailsScreen({
//     Key? key,
//     required this.title,
//     required this.dueDate,
//     this.filePath, required String course,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Assignment Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Due Date: $dueDate',
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 16),
//             if (filePath != null)
//               ElevatedButton.icon(
//                 icon: const Icon(Icons.file_open),
//                 label: const Text('View File'),
//                 onPressed: () {
//                   // TODO: Handle file opening
//                 },
//               ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Mark as completed
//               },
//               child: const Text('Mark as Completed'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

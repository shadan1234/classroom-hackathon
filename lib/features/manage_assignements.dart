// import 'package:classroom_goa_hackathon/features/assignment_details_screen.dart';
// import 'package:flutter/material.dart';

// class ManageAssignmentsScreen extends StatelessWidget {
//   const ManageAssignmentsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manage Assignments'),
//       ),
//       body: ListView.builder(
//         itemCount: 10, // Replace with actual assignments count
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: ListTile(
//               title: Text('Assignment ${index + 1}'),
//               subtitle: const Text('Due Date: 2025-01-20'),
//               trailing: IconButton(
//                 icon: const Icon(Icons.edit),
//                 onPressed: () {
//                   // TODO: Edit Assignment
//                 },
//               ),
//               onTap: () {
//                 // TODO: Navigate to Assignment Details
//                 // Navigator.pushNamed(context,  AssignmentDetailsScreen.routeName  );
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => AssignmentDetailsScreen(
//                       title: 'Math Assignment',
//                       dueDate: '2025-01-20',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // TODO: Add New Assignment
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

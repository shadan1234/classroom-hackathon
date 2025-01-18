// import 'package:classroom_goa_hackathon/features/manage_assignements.dart';
// import 'package:classroom_goa_hackathon/features/manage_students.dart';
// import 'package:flutter/material.dart';

// class FacultyDashboard extends StatelessWidget {
//   const FacultyDashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Faculty Dashboard'),
//         centerTitle: true,
//       ),
//       body: GridView.count(
//         crossAxisCount: 2,
//         padding: const EdgeInsets.all(16),
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         children: [
//           _buildDashboardCard(
//             context,
//             title: 'Manage Students',
//             icon: Icons.person,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ManageStudentsScreen(),
//                 ),
//               );
//             },
//           ),
//           _buildDashboardCard(
//             context,
//             title: 'Manage TAs',
//             icon: Icons.school,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ManageStudentsScreen()
//                 ),
//               );
//             },
//           ),
//           _buildDashboardCard(
//             context,
//             title: 'Manage Assignments',
//             icon: Icons.assignment,
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const ManageAssignmentsScreen(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDashboardCard(BuildContext context,
//       {required String title, required IconData icon, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 48, color: Theme.of(context).primaryColor),
//               const SizedBox(height: 16),
//               Text(
//                 title,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

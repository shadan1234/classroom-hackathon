import 'package:flutter/material.dart';

class TAManagementScreen extends StatelessWidget {
  const TAManagementScreen({Key? key}) : super(key: key);
 void addStudent() {
    // Logic to add a student
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TA Management'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF56CCF2), Color(0xFF2F80ED)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Teaching Assistants',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Example TA list length
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                      ),
                      title: Text('TA ${index + 1}'),
                      subtitle: Text('Email: ta${index + 1}@example.com'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Assign') {
                            // Logic to assign TA
                          } else if (value == 'Remove') {
                            // Logic to remove TA
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'Assign',
                            child: Text('Assign to Course'),
                          ),
                          const PopupMenuItem(
                            value: 'Remove',
                            child: Text('Remove TA'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: addStudent,
                icon: const Icon(Icons.add),
                label: const Text('Add New TA'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

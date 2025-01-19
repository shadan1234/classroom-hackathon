import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // TODO: Add filter functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Example data count
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text('Assignment ${index + 1}'),
              subtitle: const Text('Due: 2025-01-20'),
              trailing: IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  // TODO: Navigate to Assignment Details Screen
                },
              ),
              onTap: () {
                // TODO: Handle card tap
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Open Add Assignment Modal
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TAManagementScreen extends StatefulWidget {
  const TAManagementScreen({Key? key}) : super(key: key);

  @override
  State<TAManagementScreen> createState() => _TAManagementScreenState();
}

class _TAManagementScreenState extends State<TAManagementScreen> {
  final List<Map<String, String>> tas = [
    {'name': 'John Doe', 'email': 'john.doe@example.com', 'id': 'ST001'},
    {'name': 'Jane Smith', 'email': 'jane.smith@example.com', 'id': 'ST002'},
    {'name': 'Alex Brown', 'email': 'alex.brown@example.com', 'id': 'ST003'},
  ];

  void addStudent() {
    String name = '';
    String email = '';
    String id = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New TA'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'ID'),
                  onChanged: (value) {
                    id = value;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (name.isNotEmpty && email.isNotEmpty && id.isNotEmpty) {
                  setState(() {
                    tas.add({'name': name, 'email': email, 'id': id});
                  });
                  Navigator.of(context).pop(); // Close the dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('TA added successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields!')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void deleteStudent(int index) {
    setState(() {
      tas.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('TA removed successfully!')),
    );
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
                itemCount: tas.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                        color: Colors.blueAccent,
                      ),
                      title: Text("${tas[index]['name']} (${tas[index]['id']})"),
                      subtitle: Text('Email: ${tas[index]['email']}'),
                      trailing: PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Assign') {
                            // Logic to assign TA
                          } else if (value == 'Remove') {
                            deleteStudent(index);
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Welcome, TA!'),
              const SizedBox(height: 16),
              _buildWelcomeCard(),
              const SizedBox(height: 24),
              _buildSectionTitle('Quick Overview'),
              const SizedBox(height: 16),
              _buildStatsRow(),
              const SizedBox(height: 24),
              _buildSectionTitle('Recent Submissions'),
              const SizedBox(height: 16),
              _buildSubmissionsList(),
              const SizedBox(height: 24),
              _buildSectionTitle('Announcements'),
              const SizedBox(height: 16),
              _buildAnnouncementsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildWelcomeCard() {
    return Card(
      elevation: 4,
      color: Colors.indigo.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello, TA!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Here’s an overview of student submissions and activities for today.',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatTile(
          icon: Icons.assignment_turned_in,
          title: 'Assignments',
          value: '24/30',
          color: Colors.indigo,
        ),
        _buildStatTile(
          icon: Icons.group,
          title: 'Students',
          value: '120',
          color: Colors.green,
        ),
        _buildStatTile(
          icon: Icons.feedback,
          title: 'Feedback',
          value: '15 Pending',
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildStatTile({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, color: color),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmissionsList() {
    return Column(
      children: [
        _buildSubmissionTile(
          studentName: 'John Doe',
          assignmentTitle: 'Assignment 1',
          status: 'Submitted',
          color: Colors.green,
        ),
        _buildSubmissionTile(
          studentName: 'Jane Smith',
          assignmentTitle: 'Assignment 1',
          status: 'Pending',
          color: Colors.red,
        ),
        _buildSubmissionTile(
          studentName: 'David Johnson',
          assignmentTitle: 'Assignment 2',
          status: 'Graded',
          color: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildSubmissionTile({
    required String studentName,
    required String assignmentTitle,
    required String status,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(Icons.person, color: color),
        ),
        title: Text(
          '$studentName - $assignmentTitle',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Status: $status'),
      ),
    );
  }

  Widget _buildAnnouncementsCard() {
    return Card(
      elevation: 4,
      color: Colors.orange.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Deadline',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Assignment 3 is due on 20th Jan, 2025. Make sure to remind students to submit on time!',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

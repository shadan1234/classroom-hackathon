import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const CustomCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40.0),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis, // Prevent overflow
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium,
          overflow: TextOverflow.ellipsis, // Prevent overflow
        ),
        onTap: onTap,
      ),
    );
  }
}

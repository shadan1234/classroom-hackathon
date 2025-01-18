import 'package:classroom_goa_hackathon/features/dashboard/profile_screen.dart';
import 'package:classroom_goa_hackathon/features/faculty/faculty_dashboard_screen.dart';
import 'package:classroom_goa_hackathon/features/faculty/overview_screen.dart';
import 'package:classroom_goa_hackathon/features/faculty/student_management.dart';
import 'package:classroom_goa_hackathon/features/faculty/ta_management_screen.dart';
import 'package:classroom_goa_hackathon/features/ta/ta_dashboard_screen.dart';
import 'package:classroom_goa_hackathon/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TaMainPage extends StatefulWidget {
  static const String routeName = '/ta-mainpage';

  const TaMainPage({Key? key}) : super(key: key);

  @override
  _TaMainPageState createState() => _TaMainPageState();
}

class _TaMainPageState extends State<TaMainPage> {
  int _currentIndex = 0; // Tracks the current tab
  final List<Widget> _screens = [
     const OverviewScreen(),
     TADashboardScreen(),
    
     ProfileTab(), // Profile Screen
    // Overview Screen
     // Work-Related Screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
            BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Overview',
          ),
         
        
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Work',
          ), 
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}

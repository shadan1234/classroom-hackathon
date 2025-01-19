import 'package:flutter/material.dart';
import 'package:grade_pro/features/dashboard/profile_screen.dart';
import 'package:grade_pro/features/faculty/overview_screen.dart';
import 'package:grade_pro/features/ta/ta_dashboard_screen.dart';

class TaMainPage extends StatefulWidget {
  static const String routeName = '/ta-mainpage';

  const TaMainPage({super.key});

  @override
  _TaMainPageState createState() => _TaMainPageState();
}

class _TaMainPageState extends State<TaMainPage> {
  int _currentIndex = 0; // Tracks the current tab
  final List<Widget> _screens = [
     const OverviewScreen(),
     TADashboardScreen(),
    
     const ProfileTab(), // Profile Screen
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

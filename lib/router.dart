
import 'package:flutter/material.dart';
import 'package:grade_pro/features/dashboard/dashboard_screen.dart';
import 'package:grade_pro/features/dashboard/students_dashboard_screen.dart';
import 'package:grade_pro/features/faculty/faculty_dashboard_screen.dart';
import 'package:grade_pro/features/faculty/faculty_mainPage.dart';
import 'package:grade_pro/features/ta/ta_main_page.dart';
import 'package:grade_pro/models/user_models.dart';
import 'package:provider/provider.dart';

import 'features/auth/auth_screen.dart';
import 'features/auth/login.dart';
import 'features/auth/signup.dart';
import 'features/courses/course_management_system.dart';
import 'features/ta/ta_dashboard_screen.dart';
import 'onboarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OnboardingScreen(),
      );
    case ChoiceScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ChoiceScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoginScreen(),
      );
    case SignupScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SignupScreen(),
      );
     case CourseManagementScreen.routeName:
     return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const CourseManagementScreen() );
     case DashboardScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (context) {
          final userProvider = Provider.of<UserProvider>(context, listen: false);
          final userRole = userProvider.user?.role;

          if (userRole == UserRole.faculty) {
            return const DashboardScreen(userRole: UserRole.faculty);
          } else if (userRole == UserRole.ta) {
            return const DashboardScreen(userRole: UserRole.ta);
          } else if (userRole == UserRole.student) {
            return const DashboardScreen(userRole: UserRole.student);
          } else {
            return const Scaffold(
              body: Center(child: Text('Invalid User Role')),
            );
          }
        },
      );
  // case AssignmentDetailsScreen.routeName:
  //  var p = routeSettings.arguments as pair<String,String>;
  //     return MaterialPageRoute(
         
  //       settings: routeSettings,
        
  //       builder: (_) => AssignmentDetailsScreen(

  //       ),
  //     );
  case StudentDashboard.routeName:
     return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const StudentDashboard() );
       case TADashboardScreen.routeName:
     return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>TADashboardScreen() );
      
       case FacultyDashboard.routeName:
     return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const FacultyDashboard() );

       case   FacultyDashboardScreen.routeName:
     return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const FacultyDashboardScreen() );
      
        case  TaMainPage.routeName:

     return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>const TaMainPage() );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist'),
          ),
        ),
      );
  }
}

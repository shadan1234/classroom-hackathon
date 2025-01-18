// lib/screens/signup_screen.dart
import 'package:classroom_goa_hackathon/commons/custom_button.dart';
import 'package:classroom_goa_hackathon/commons/custom_textfield.dart';
import 'package:classroom_goa_hackathon/features/dashboard/dashboard_screen.dart';
import 'package:classroom_goa_hackathon/features/dashboard/students_dashboard_screen.dart';
import 'package:classroom_goa_hackathon/features/faculty_dashboard.dart';
import 'package:classroom_goa_hackathon/models/user_models.dart';
import 'package:classroom_goa_hackathon/themes/app_theme.dart';
import 'package:flutter/material.dart';


class SignupScreen extends StatelessWidget {
    static const String routeName = '/signup';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Text('Create Account', style: AppTheme.headingTextStyle),
              const SizedBox(height: 8),
              Text('Sign up to get started!', style: AppTheme.subHeadingTextStyle),
              const SizedBox(height: 40),
              CustomTextField(
                hintText: 'Full Name',
                controller: nameController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  // Handle sign up logic here
                  // Navigator.pushNamed(context,'/dashboard_screen');
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>
                  StudentDashboard()
                  )
                  );

                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

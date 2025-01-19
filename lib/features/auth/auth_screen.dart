import 'package:flutter/material.dart';
import 'package:grade_pro/features/auth/login.dart';
import 'package:grade_pro/features/auth/signup.dart';
import 'package:grade_pro/themes/app_theme.dart';
import '../../commons/custom_button.dart';

class ChoiceScreen extends StatelessWidget {
  static const String routeName = '/choice';

  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to GradingPro'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Choose an Option',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity, // Makes the button stretch horizontally
                child: CustomButton(
                  backgroundColor: AppTheme.primaryColor,
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity, // Makes the button stretch horizontally
                child: CustomButton(
                  backgroundColor: AppTheme.primaryColor,
                  text: 'Create Account',
                  onPressed: () {
                    Navigator.pushNamed(context, SignupScreen.routeName);
                  },
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Welcome to the best grading app for your academic success!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// lib/screens/login_screen.dart
import 'package:classroom_goa_hackathon/commons/custom_button.dart';
import 'package:classroom_goa_hackathon/commons/custom_textfield.dart';
import 'package:classroom_goa_hackathon/themes/app_theme.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
    static const String routeName = '/login';
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
              Text('Welcome Back!', style: AppTheme.headingTextStyle),
              const SizedBox(height: 8),
              Text('Log in to continue', style: AppTheme.subHeadingTextStyle),
              const SizedBox(height: 40),
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
                text: 'Log In',
                onPressed: () {
                  // Handle login logic here
                   Navigator.pushNamed(context,'/manage_courses');
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don’t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text('Sign Up'),
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

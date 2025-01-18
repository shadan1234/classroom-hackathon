import 'package:flutter/material.dart';
import '../../commons/custom_button.dart';

class ChoiceScreen extends StatelessWidget {
  static const String routeName = '/choice';

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
            CustomButton(
              text: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Create Account',
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
    );
  }
}

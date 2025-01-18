import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/OnboardingScreen';

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.school, size: 100, color: Colors.white),
              SizedBox(height: 20),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Welcome to GradingPro!'),
                    TyperAnimatedText('Effortless Grading Experience'),
                  ],
                  repeatForever: true,
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        color: Colors.greenAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.assignment, size: 100, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Grade Assignments\nEffortlessly',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.feedback, size: 100, color: Colors.white),
              SizedBox(height: 20),
              Text(
                'Provide Feedback\nSeamlessly',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/choice'); // Navigate to Choice Screen
                },
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableSideReveal: true,
        waveType: WaveType.liquidReveal,
        fullTransitionValue: 600,
        enableLoop: true,
        positionSlideIcon: 0.8,
        slideIconWidget: Icon(Icons.arrow_forward_ios, color: Colors.white),
      ),
    );
  }
}

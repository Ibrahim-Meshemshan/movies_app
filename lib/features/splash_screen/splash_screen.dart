import 'package:flutter/material.dart';
import 'package:movies_app/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  OnboardingScreen(),
          )),
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/images/splash_movies.png')],
        ),
      ),
    );
  }
}

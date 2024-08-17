import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:finalproject1/Premium.dart';
import 'package:finalproject1/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SplashScreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextRoute: PremiumPlan.routeName,
      splash: Image.asset('assets/images/try3.gif',fit: BoxFit.cover,),splashIconSize: double.infinity,
      nextScreen: OnBoarding(),
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}

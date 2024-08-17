import 'package:finalproject1/myTheme.dart';
import 'package:flutter/material.dart';
import 'SharedPref.dart';
import 'UI/Login.dart';
import 'UI/SlideMenu.dart';
import 'package:animated_introduction/animated_introduction.dart';
class OnBoarding extends StatelessWidget {
  static const String routeName = "Onboarding";

  final List <SingleIntroScreen> list = [
    SingleIntroScreen(
        headerBgColor: const Color(0xff7174a1),
        sideDotsBgColor: MyTheme.primaryColor,
        mainCircleBgColor: MyTheme.iconlight,
        imageAsset: 'assets/images/1.png',
        title: 'Doctor Appointments',
        description: 'You can save your appointments with your doctors and the app will remind you on time.'
    ),
    SingleIntroScreen(
        headerBgColor: const Color(0xff7174a1),
        sideDotsBgColor: MyTheme.primaryColor,
        mainCircleBgColor: MyTheme.iconlight,
        imageAsset: 'assets/images/2.png',
        title: 'Patient History',
        description: 'You can upload your x-rays and your medical test results for better health tracking.'
    ),
    SingleIntroScreen(
        headerBgColor: const Color(0xff7174a1),
        mainCircleBgColor: MyTheme.iconlight,
        sideDotsBgColor: MyTheme.primaryColor,
        imageAsset: 'assets/images/7.gif',
        title: 'Medicine Reminder',
        description: 'The app will remind you of the time of medicine. '),
  ];
  @override  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedIntroduction(
          slides: list,
          footerGradients: [
            Colors.deepPurple,
            MyTheme.primaryColor
          ],
          onSkip: (){
            // MaterialPageRoute(builder: (context) => SharedPref.getId() != null ? SlideMenu() : LoginPage(),);
            Navigator.push(context, MaterialPageRoute(builder: (context) => SharedPref.getId() != null ? SlideMenu() : LoginPage()));
          },
          onDone: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SharedPref.getId() != null ? SlideMenu() : LoginPage()));
          }
      ),
    );
  }}

//

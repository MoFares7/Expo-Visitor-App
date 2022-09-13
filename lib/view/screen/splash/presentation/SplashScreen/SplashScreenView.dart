// ignore_for_file: file_names
import 'dart:async';
import 'package:expo_visitor/view/screen/splash/presentation/IntroductionScreen/IntroductionScreen.dart';
import 'package:expo_visitor/view/screen/splash/presentation/SplashScreen/widgets/backgroud.dart';
import 'package:expo_visitor/view/widgets/Logo.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  Future<void> goToNextView() async {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IntroductionScreenView()),
      ),
    );
  }

  @override
  void initState() {
     goToNextView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [Logo(), BackGround()],
    ));
  }
}

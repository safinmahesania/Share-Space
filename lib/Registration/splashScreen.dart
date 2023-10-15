import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.to(
          const LoginScreen(),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            child: Image.asset(
              'assets/splashscreenbg.jpg',
              fit: BoxFit.cover,
              height: size.height,
              width: size.width,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/sharespace-darkblue-nobg.png',
              width: 500,
              height: 500,
              //fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

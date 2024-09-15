import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/Core/AppRouter/PageRoute.dart';
import 'package:news_app/Core/Utils/AppAssets.dart';
import 'package:news_app/Core/Utils/AppColors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, PageRoutes.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color:AppColors.whiteColor,
          image: DecorationImage(
              image: AssetImage(AppAssets.backgroundImage), fit: BoxFit.cover),
        ),
        child: Center(child: Image.asset(AppAssets.splashImage)),
      ),
    );
  }
}

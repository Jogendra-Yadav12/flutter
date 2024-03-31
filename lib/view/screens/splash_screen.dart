import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/app_colors.dart';

import 'package:mvvm_provider_setup/view_model/session_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SessionService sp = SessionService();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      sp.checkAuthentication(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.abc,color: AppColor.white,)
      ),
    );
  }
}

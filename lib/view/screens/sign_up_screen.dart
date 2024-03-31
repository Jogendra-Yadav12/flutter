import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, RoutesName.loginScreen);
          },
          child: const Text("signup"),
        ),
      ),
    );
  }
}

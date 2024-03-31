import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/app_strings.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/view/screens/home_screen.dart';
import 'package:mvvm_provider_setup/view/screens/login_screen.dart';
import 'package:mvvm_provider_setup/view/screens/sign_up_screen.dart';
import 'package:mvvm_provider_setup/view/screens/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
// ------------------------- SPLASH SCREEN ROUTE -------------------------
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashScreen(),
        );

// ------------------------- TUTORIAL SCREEN ROUTE -------------------------
      case RoutesName.signUpScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpScreen(),
        );

// ------------------------- SIGNUP SCREEN ROUTE -------------------------
      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

// ------------------------- VERIFY OTP SCREEN ROUTE -------------------------
      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

// ------------------------- DEFAULT ROUTE -------------------------
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text(AppString.noRoute),
              ),
            );
          },
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/routes/routes.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/view_model/auth_view_model.dart';
import 'package:mvvm_provider_setup/view_model/data_view_model.dart';
import 'package:mvvm_provider_setup/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(),
        ),
         ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => DataViewModel(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute: RoutesName.splashScreen,
          onGenerateRoute: Routes.generateRoute,
          // home: const SplashScreen(),
        );
      },
    );
  }
}

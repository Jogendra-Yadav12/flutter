import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mvvm_provider_setup/app/app_strings.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppString.home),
            const Gap(10),
            InkWell(
              onTap: () {
                loginViewModel.remove().then((value) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.loginScreen,
                    (route) => false,
                  );
                });
              },
              child: const Text(AppString.logout),
            )
          ],
        ),
      ),
    );
  }
}

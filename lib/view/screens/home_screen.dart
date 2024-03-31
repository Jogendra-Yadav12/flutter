import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            // Utils.toastMessage("Something went wrong ");
            // Utils.flushBarErrorMessage(context, "Something went wrong ");
            // Utils.showSnackBar(context, "Something went wrong ");
            Utils.showAlertDialog(context, "Error", "Something went wrong ");
          },
          child: const Text("home"),
        ),
      ),
    );
  }
}

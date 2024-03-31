import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mvvm_provider_setup/app/app_strings.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';
import 'package:mvvm_provider_setup/view/widgets/button/rectangle_button.dart';
import 'package:mvvm_provider_setup/view/widgets/text_field/custom_text_field.dart';
import 'package:mvvm_provider_setup/view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = AuthViewModel();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                    context,
                    _emailFocusNode,
                    _passwordFocusNode,
                  );
                },
                focusNode: _emailFocusNode,
                nextFocusNode: _passwordFocusNode,
                hintText: AppString.email,
                controller: _emailController,
                prefixIcon: const Icon(
                  Icons.email,
                ),
              ),
              const Gap(10),
              ValueListenableBuilder(
                valueListenable: _obscureText,
                builder: (context, value, child) {
                  return CustomTextField(
                    focusNode: _passwordFocusNode,
                    isObscure: _obscureText.value,
                    hintText: AppString.password,
                    controller: _passwordController,
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility_off,
                    ),
                  );
                },
              ),
              const Gap(20),
              RectangleButton(
                loading: authViewModel.loginLoading,
                onTap: () {
                  if (_emailController.text.trim().isEmpty ||
                      _passwordController.text.trim().isEmpty) {
                    Utils.flushBarErrorMessage(
                      context,
                      "Please fill all the fields",
                    );
                  } else {
                    // Map<String, String> loginCredential = {
                    //   "email": "eve.holt@reqres.in",
                    //   "password": "cityslicka"
                    // };
                    Map<String, String> loginCredential = {
                      "email": _emailController.text.trim().toString(),
                      "password": _passwordController.text.trim().toString()
                    };
                    authViewModel.loginApi(loginCredential, context);
                  }
                },
                buttonName: AppString.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

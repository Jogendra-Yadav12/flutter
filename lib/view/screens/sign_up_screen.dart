import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mvvm_provider_setup/app/app_strings.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';
import 'package:mvvm_provider_setup/view/widgets/button/rectangle_button.dart';
import 'package:mvvm_provider_setup/view/widgets/text_field/custom_text_field.dart';
import 'package:mvvm_provider_setup/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    final authViewModel = Provider.of<AuthViewModel>(context);
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
                loading: authViewModel.signUpLoading,
                onTap: () {
                  if (_emailController.text.trim().isEmpty ||
                      _passwordController.text.trim().isEmpty) {
                    Utils.flushBarErrorMessage(
                      context,
                      "Please fill all the fields",
                    );
                  } else {
                    Map<String, String> signUpCredential = {
                      "email": "eve.holt@reqres.in",
                      "password": "pistol"
                    };
                    // Map<String, String> loginCredential = {
                    //   "email": _emailController.text.trim().toString(),
                    //   "password": _passwordController.text.trim().toString()
                    // };
                    authViewModel.signUpApi(signUpCredential, context);
                  }
                },
                buttonName: AppString.signup,
              ),
              const Gap(20),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.loginScreen,
                      (route) => false,
                    );
                  },
                  child: const Text("Already have an account? Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

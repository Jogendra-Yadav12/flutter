import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool isObscure;
  final void Function(String)? onFieldSubmitted;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onFieldSubmitted,
    required this.focusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      focusNode: focusNode,
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

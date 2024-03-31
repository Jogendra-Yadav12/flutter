import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/app_colors.dart';

class RectangleButton extends StatelessWidget {
  final bool loading;
  final VoidCallback onTap;
  final String buttonName;
  const RectangleButton({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        minimumSize: Size(w * 0.95, h * 0.07),
        backgroundColor: AppColor.yellow,
      ),
      onPressed: onTap,
      child: loading
          ? const CircularProgressIndicator(
              strokeWidth: 3,
              color: AppColor.white,
            )
          : Text(
              buttonName,
              style: const TextStyle(
                color: AppColor.white,
              ),
            ),
    );
  }
}

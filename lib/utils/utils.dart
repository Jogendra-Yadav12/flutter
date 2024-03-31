import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_provider_setup/app/app_strings.dart';

class Utils {
  static void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
  // --------------------------- flushBarErrorMessage  ---------------------------
  static void flushBarErrorMessage(BuildContext context, String message) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(10),
        positionOffset: 10,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: message,
        backgroundColor: Colors.red,
      )..show(context),
    );
  }

  //  --------------------------- toastMessage ---------------------------
  /// it has some problems in latest version of android
  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  // --------------------------- showSnackBar ---------------------------
  /// you can contomize based on requirement
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: Colors.red.withOpacity(0.8),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  //  --------------------------- showAlertDialog  ---------------------------
  /// you can contomize based on requirement
  static void showAlertDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    AlertDialog alertDialog = AlertDialog(
      elevation: 25,
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(AppString.ok),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}

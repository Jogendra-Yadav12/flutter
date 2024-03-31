import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/model/login_model.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';
import 'package:mvvm_provider_setup/view_model/login_view_model.dart';

class SessionService {
  Future<LoginModel> getUserData() => LoginViewModel().getLoginData();
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (value.token == "null" || value.token == "") {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.loginScreen,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RoutesName.homeScreen,
          (route) => false,
        );
      }
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
    });
  }
}

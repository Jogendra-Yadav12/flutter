import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/repository/auth_repository.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

 

  // ------------------------------- SET LOGIN LOADING FUNCTION -------------------------------
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  void setLoginLoading(value) {
    _loginLoading = value;
    notifyListeners();
  }

  // ------------------------------- SET FORGOT PASSWORD LOADING FUNCTION -------------------------------
   // bool _forgotPasswordLoading = false;
  // bool get forgotPasswordLoading => _forgotPasswordLoading;
  // void setForgotPasswordLoading(value) {
  //   _forgotPasswordLoading = value;
  //   notifyListeners();
  // }

  // ------------------------------- LOGIN API -------------------------------
  Future<void> loginApi(dynamic loginCredential, BuildContext context) async {
   
    setLoginLoading(true);
    
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    _authRepo.loginApi(loginCredential).then((value) {
      setLoginLoading(false);

      String token = value["token"].toString();
      sharedPreferences.setString("token", token);
      print("---------token $token -------------------");

      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.homeScreen,
        (route) => false,
      );
      Utils.flushBarErrorMessage(context, "Login");
    }).onError((error, stackTrace) {
      setLoginLoading(false);

      Utils.flushBarErrorMessage(context, error.toString());
    });
  }
}

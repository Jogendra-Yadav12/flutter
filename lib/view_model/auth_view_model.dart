import 'package:flutter/material.dart';
import 'package:mvvm_provider_setup/app/app_strings.dart';
import 'package:mvvm_provider_setup/app/routes/routes_name.dart';
import 'package:mvvm_provider_setup/repository/auth_repository.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  // ------------------------------- SET LOGIN LOADING FUNCTION -------------------------------
  bool _loginLoading = false;
  bool get loginLoading => _loginLoading;
  void setLoginLoading(value) {
    _loginLoading = value;
    notifyListeners();
  }

  // ------------------------------- SET SIGNUP LOADING FUNCTION -------------------------------
  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  void setSignUpLoading(value) {
    _signUpLoading = value;
    notifyListeners();
  }

  // ------------------------------- LOGIN API -------------------------------
  Future<void> loginApi(dynamic loginCredential, BuildContext context) async {
    setLoginLoading(true);

    _authRepo.loginApi(loginCredential).then((value) {
      setLoginLoading(false);

      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.homeScreen,
        (route) => false,
      );
      Utils.flushBarErrorMessage(context, AppString.login);
    }).onError((error, stackTrace) {
      setLoginLoading(false);

      Utils.flushBarErrorMessage(context, error.toString());
    });
  }

  // ------------------------------- SIGNUP API -------------------------------
  Future<void> signUpApi(dynamic signUpCredential, BuildContext context) async {
    setSignUpLoading(true);

    // final SharedPreferences sharedPreferences =
    //     await SharedPreferences.getInstance();

    _authRepo.signUpApi(signUpCredential).then((value) {
      setSignUpLoading(false);

      // String token = value["token"].toString();
      // sharedPreferences.setString("token", token);

      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutesName.loginScreen,
        (route) => false,
      );
      Utils.flushBarErrorMessage(context, AppString.signup);
    }).onError((error, stackTrace) {
      setSignUpLoading(false);

      Utils.flushBarErrorMessage(context, error.toString());
    });
  }
}

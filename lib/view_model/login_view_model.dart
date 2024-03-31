import 'package:flutter/foundation.dart';
import 'package:mvvm_provider_setup/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier {
  Future<bool> saveLoginData(LoginModel loginData) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("token", loginData.token);
    notifyListeners();
    return true;
  }

  Future<LoginModel> getLoginData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString("token");
    return LoginModel(
      token: token.toString(),
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove("token");
    return true;
  }
}

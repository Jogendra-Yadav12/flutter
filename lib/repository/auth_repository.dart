import 'package:mvvm_provider_setup/api/app_urls.dart';
import 'package:mvvm_provider_setup/api/base_api_services.dart';
import 'package:mvvm_provider_setup/api/network_api_services.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();
// ----------------------------- LOGIN API -----------------------------
  Future<dynamic> loginApi(dynamic loginCredential) async {
    try {
      dynamic response = await _baseApiServices.postApiResponse(
          AppUrl.loginUrl, loginCredential);

      return response;
    } catch (error) {
      Utils.toastMessage(error.toString());
    }
  }

  // ----------------------------- SIGNUP API -----------------------------
  Future<dynamic> signUpApi(dynamic signUpCredential) async {
    try {
      dynamic response =
          await _baseApiServices.postApiResponse(AppUrl.signupUrl, signUpCredential);

      return response;
    } catch (error) {
      Utils.toastMessage(error.toString());
    }
  }
}

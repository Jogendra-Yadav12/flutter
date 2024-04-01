
import 'package:mvvm_provider_setup/api/app_urls.dart';
import 'package:mvvm_provider_setup/api/base_api_services.dart';
import 'package:mvvm_provider_setup/api/network_api_services.dart';
import 'package:mvvm_provider_setup/model/data_model.dart';
import 'package:mvvm_provider_setup/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();
// ---------------------------- GET DATA API ----------------------------
  Future<DataModel> getDataApi() async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final String? token = sharedPreferences.getString("token");

      dynamic header = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };

      dynamic response =
          await _baseApiServices.getApiResponse(AppUrl.dataUrl);

      print(response.toString());
      return response = DataModel.fromJson(response);
    } catch (error) {
      Utils.toastMessage(error.toString());
      rethrow;
    }
  }
}

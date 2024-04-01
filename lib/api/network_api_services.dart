import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm_provider_setup/api/api_exception.dart';
import 'package:mvvm_provider_setup/api/base_api_services.dart';
import 'package:mvvm_provider_setup/app/app_strings.dart';

class NetworkApiServices extends BaseApiServices {
  // ---------------------------- GET API ----------------------------
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(seconds: 30),
          );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(AppString.noInternet);
    }
    return responseJson;
  }

  // ---------------------------- POST API ----------------------------
  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(
            const Duration(seconds: 10),
          );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(AppString.noInternet);
    }

    return responseJson;
  }

// ---------------------------- RESPONSE STATUS CODE ----------------------------
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        String errorType = errorResponse["type"];
        throw BadRequestException(errorType);
      case 404:
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        return errorResponse.toString();

      default:
        Map<String, dynamic> errorResponse = jsonDecode(response.body);
        return errorResponse.toString();
    }
  }
}

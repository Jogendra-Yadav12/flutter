abstract class BaseApiServices {
  Future<dynamic> getApiResponse(String url,header);
  Future<dynamic> postApiResponse(String url, dynamic data);
}

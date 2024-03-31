import 'package:mvvm_provider_setup/api/api_status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse([
    this.status,
    this.data,
    this.message,
  ]);
  ApiResponse.loading() : status = Status.loading;
  ApiResponse.complete(this.data) : status = Status.complete;
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status :$status \nMessage :$message \nData : $data";
  }
}

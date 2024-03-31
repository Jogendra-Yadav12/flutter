class ApiException implements Exception {
  final String? _message;
  final String? _prefix;

  ApiException([
    this._message,
    this._prefix,
  ]);
  @override
  String toString() {
    return "$_prefix $_message";
  }
}

class FetchDataException extends ApiException {
  FetchDataException([String? message]) : super(message, "");
}

class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message, "");
}

class UnAuthorizedException extends ApiException {
  UnAuthorizedException([String? message]) : super(message, "");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, "");
}

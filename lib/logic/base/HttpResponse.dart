class HttpResponse{
  String _result;
  String _message;
  int _statusCode;
  bool _success;

  int get statusCode => _statusCode;

  set statusCode(int value) {
    _statusCode = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get result => _result;

  set result(String value) {
    _result = value;
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }
}
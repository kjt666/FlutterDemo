import 'package:flutter_app/bean/user_bean.dart';

class HttpResponse {
  String _code  = "";
  String _msg = "";
  UserBean? _data;

  String get code => _code;

  String get msg => _msg;

  UserBean? get data => _data;

  HttpResponse(this._code, this._msg, this._data);

  HttpResponse.fromJson(dynamic json) {
    _code = json["code"];
    _msg = json["msg"];
    _data = json["data"] != null ? UserBean.fromJson(json["data"]) : null;
  }

  @override
  String toString() {
    return 'HttpResponse{_code: $_code, _msg: $_msg, _data: $_data}';
  }
}

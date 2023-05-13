

class GetIntroM {
  GetIntroM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetIntroM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
GetIntroM copyWith({  bool? error,
  String? message,
  Data? data,
}) => GetIntroM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}


class Data {
  Data({
      String? introduction,}){
    _introduction = introduction;
}

  Data.fromJson(dynamic json) {
    _introduction = json['introduction'];
  }
  String? _introduction;
Data copyWith({  String? introduction,
}) => Data(  introduction: introduction ?? _introduction,
);
  String? get introduction => _introduction;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['introduction'] = _introduction;
    return map;
  }

}
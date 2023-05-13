/// error : false
/// message : "No of Floor"
/// data : [3,2,1]

class GetFloorM {
  GetFloorM({
      bool? error, 
      String? message, 
      List<num>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetFloorM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? json['data'].cast<num>() : [];
  }
  bool? _error;
  String? _message;
  List<num>? _data;
GetFloorM copyWith({  bool? error,
  String? message,
  List<num>? data,
}) => GetFloorM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<num>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}
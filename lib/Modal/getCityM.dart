class GetCityM {
  GetCityM({
      bool? error, 
      String? message, 
      List<cityData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetCityM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(cityData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<cityData>? _data;
GetCityM copyWith({  bool? error,
  String? message,
  List<cityData>? data,
}) => GetCityM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<cityData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 10
/// name : "Faridabad"
/// state_id : 13

class cityData {
  cityData({
      num? id, 
      String? name, 
      num? stateId,}){
    _id = id;
    _name = name;
    _stateId = stateId;
}

  cityData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _stateId = json['state_id'];
  }
  num? _id;
  String? _name;
  num? _stateId;
  cityData copyWith({  num? id,
  String? name,
  num? stateId,
}) => cityData(  id: id ?? _id,
  name: name ?? _name,
  stateId: stateId ?? _stateId,
);
  num? get id => _id;
  String? get name => _name;
  num? get stateId => _stateId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['state_id'] = _stateId;
    return map;
  }

}
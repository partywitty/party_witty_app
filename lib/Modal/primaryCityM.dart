/// error : false
/// message : "Get City Detail Successfully."
/// data : [{"id":1,"user_id":308,"city_id":"11","price":"100","temp":"0","created_at":"2022-12-21T13:14:49.000000Z","updated_at":"2022-12-21T13:14:49.000000Z","name":"Palwal"},{"id":2,"user_id":308,"city_id":"13","price":"1000","temp":"0","created_at":"2022-12-21T13:14:49.000000Z","updated_at":"2022-12-21T13:14:49.000000Z","name":"Hassanpur"},{"id":3,"user_id":308,"city_id":"13","price":"1000","temp":"0","created_at":"2022-12-21T13:14:49.000000Z","updated_at":"2022-12-21T13:14:49.000000Z","name":"Hassanpur"}]

class PrimaryCityM {
  PrimaryCityM({
      bool? error, 
      String? message, 
      List<primaryCityData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  PrimaryCityM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(primaryCityData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<primaryCityData>? _data;
PrimaryCityM copyWith({  bool? error,
  String? message,
  List<primaryCityData>? data,
}) => PrimaryCityM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<primaryCityData>? get data => _data;

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

/// id : 1
/// user_id : 308
/// city_id : "11"
/// price : "100"
/// temp : "0"
/// created_at : "2022-12-21T13:14:49.000000Z"
/// updated_at : "2022-12-21T13:14:49.000000Z"
/// name : "Palwal"

class primaryCityData {
  primaryCityData({
      num? id, 
      num? userId, 
      String? cityId, 
      String? price, 
      String? temp, 
      String? createdAt, 
      String? updatedAt, 
      String? name,}){
    _id = id;
    _userId = userId;
    _cityId = cityId;
    _price = price;
    _temp = temp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _name = name;
}

  primaryCityData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _cityId = json['city_id'];
    _price = json['price'];
    _temp = json['temp'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _name = json['name'];
  }
  num? _id;
  num? _userId;
  String? _cityId;
  String? _price;
  String? _temp;
  String? _createdAt;
  String? _updatedAt;
  String? _name;
  primaryCityData copyWith({  num? id,
  num? userId,
  String? cityId,
  String? price,
  String? temp,
  String? createdAt,
  String? updatedAt,
  String? name,
}) => primaryCityData(  id: id ?? _id,
  userId: userId ?? _userId,
  cityId: cityId ?? _cityId,
  price: price ?? _price,
  temp: temp ?? _temp,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  name: name ?? _name,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get cityId => _cityId;
  String? get price => _price;
  String? get temp => _temp;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['city_id'] = _cityId;
    map['price'] = _price;
    map['temp'] = _temp;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['name'] = _name;
    return map;
  }

}
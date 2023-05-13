/// error : false
/// message : "Get Product Successfully."
/// data : [{"id":3,"user_id":1,"product_name":"tewst","product_size":"656","price":"560","server_people":"6","created_at":"2022-12-09T06:33:51.000000Z","updated_at":"2022-12-09T06:45:57.000000Z"},{"id":4,"user_id":1,"product_name":"new product","product_size":"255","price":"500","server_people":"2","created_at":"2022-12-09T06:33:51.000000Z","updated_at":"2022-12-09T06:33:51.000000Z"},{"id":5,"user_id":1,"product_name":"new product","product_size":"255","price":"500","server_people":"2","created_at":"2022-12-09T06:33:52.000000Z","updated_at":"2022-12-09T06:33:52.000000Z"},{"id":12,"user_id":1,"product_name":null,"product_size":null,"price":null,"server_people":null,"created_at":"2022-12-09T11:31:27.000000Z","updated_at":"2022-12-09T11:31:27.000000Z"},{"id":13,"user_id":1,"product_name":null,"product_size":null,"price":null,"server_people":null,"created_at":"2022-12-09T11:31:47.000000Z","updated_at":"2022-12-09T11:31:47.000000Z"},{"id":14,"user_id":1,"product_name":null,"product_size":null,"price":null,"server_people":null,"created_at":"2022-12-09T11:32:39.000000Z","updated_at":"2022-12-09T11:32:39.000000Z"},{"id":15,"user_id":1,"product_name":null,"product_size":null,"price":null,"server_people":null,"created_at":"2022-12-09T11:33:17.000000Z","updated_at":"2022-12-09T11:33:17.000000Z"}]

class GetproductM {
  GetproductM({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetproductM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
GetproductM copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => GetproductM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

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

/// id : 3
/// user_id : 1
/// product_name : "tewst"
/// product_size : "656"
/// price : "560"
/// server_people : "6"
/// created_at : "2022-12-09T06:33:51.000000Z"
/// updated_at : "2022-12-09T06:45:57.000000Z"

class Data {
  Data({
      num? id, 
      num? userId, 
      String? productName, 
      String? productSize, 
      String? price, 
      String? serverPeople, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _productName = productName;
    _productSize = productSize;
    _price = price;
    _serverPeople = serverPeople;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productName = json['product_name'];
    _productSize = json['product_size'];
    _price = json['price'];
    _serverPeople = json['server_people'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _productName;
  String? _productSize;
  String? _price;
  String? _serverPeople;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? userId,
  String? productName,
  String? productSize,
  String? price,
  String? serverPeople,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  productName: productName ?? _productName,
  productSize: productSize ?? _productSize,
  price: price ?? _price,
  serverPeople: serverPeople ?? _serverPeople,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get productName => _productName;
  String? get productSize => _productSize;
  String? get price => _price;
  String? get serverPeople => _serverPeople;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['product_name'] = _productName;
    map['product_size'] = _productSize;
    map['price'] = _price;
    map['server_people'] = _serverPeople;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
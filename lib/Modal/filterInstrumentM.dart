/// error : false
/// message : "get Instruments Successfully."
/// data : [{"id":1,"subcategory_id":15,"name":"Piano","image":null,"created_at":"2022-12-07T05:23:21.000000Z","updated_at":"2022-12-07T05:23:21.000000Z"},{"id":2,"subcategory_id":15,"name":"Flute","image":null,"created_at":"2022-12-07T05:23:21.000000Z","updated_at":"2022-12-07T05:23:21.000000Z"},{"id":3,"subcategory_id":15,"name":"Veena","image":null,"created_at":"2022-12-07T05:23:44.000000Z","updated_at":"2022-12-07T05:23:44.000000Z"},{"id":4,"subcategory_id":15,"name":"Drums","image":null,"created_at":"2022-12-07T05:23:44.000000Z","updated_at":"2022-12-07T05:23:44.000000Z"},{"id":5,"subcategory_id":15,"name":"Mridangam","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"}]

class FilterInstrumentM {
  FilterInstrumentM({
      bool? error, 
      String? message, 
      List<insData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  FilterInstrumentM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(insData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<insData>? _data;
FilterInstrumentM copyWith({  bool? error,
  String? message,
  List<insData>? data,
}) => FilterInstrumentM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<insData>? get data => _data;

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
/// subcategory_id : 15
/// name : "Piano"
/// image : null
/// created_at : "2022-12-07T05:23:21.000000Z"
/// updated_at : "2022-12-07T05:23:21.000000Z"

class insData {
  insData({
      num? id, 
      num? subcategoryId, 
      String? name, 
      dynamic image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _subcategoryId = subcategoryId;
    _name = name;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  insData.fromJson(dynamic json) {
    _id = json['id'];
    _subcategoryId = json['subcategory_id'];
    _name = json['name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _subcategoryId;
  String? _name;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
  insData copyWith({  num? id,
  num? subcategoryId,
  String? name,
  dynamic image,
  String? createdAt,
  String? updatedAt,
}) => insData(  id: id ?? _id,
  subcategoryId: subcategoryId ?? _subcategoryId,
  name: name ?? _name,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get subcategoryId => _subcategoryId;
  String? get name => _name;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subcategory_id'] = _subcategoryId;
    map['name'] = _name;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
/// error : false
/// message : "Get Subcategory Successfully."
/// data : {"status":"1","id":15,"artists_type_id":1,"name":"solo","num_of_intrument":"1","image":null,"created_at":"2022-12-06T11:43:29.000000Z","updated_at":"2022-12-06T11:43:29.000000Z"}

class InstrumentListM {
  InstrumentListM({
      bool? error, 
      String? message,
    subData? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  InstrumentListM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? subData.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  subData? _data;
InstrumentListM copyWith({  bool? error,
  String? message,
  subData? data,
}) => InstrumentListM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  subData? get data => _data;

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

/// status : "1"
/// id : 15
/// artists_type_id : 1
/// name : "solo"
/// num_of_intrument : "1"
/// image : null
/// created_at : "2022-12-06T11:43:29.000000Z"
/// updated_at : "2022-12-06T11:43:29.000000Z"

class subData {
  subData({
      String? status, 
      num? id, 
      num? artistsTypeId, 
      String? name, 
      String? numOfIntrument, 
      dynamic image, 
      String? createdAt, 
      String? updatedAt,}){
    _status = status;
    _id = id;
    _artistsTypeId = artistsTypeId;
    _name = name;
    _numOfIntrument = numOfIntrument;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  subData.fromJson(dynamic json) {
    _status = json['status'];
    _id = json['id'];
    _artistsTypeId = json['artists_type_id'];
    _name = json['name'];
    _numOfIntrument = json['num_of_intrument'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _status;
  num? _id;
  num? _artistsTypeId;
  String? _name;
  String? _numOfIntrument;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
  subData copyWith({  String? status,
  num? id,
  num? artistsTypeId,
  String? name,
  String? numOfIntrument,
  dynamic image,
  String? createdAt,
  String? updatedAt,
}) => subData(  status: status ?? _status,
  id: id ?? _id,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  name: name ?? _name,
  numOfIntrument: numOfIntrument ?? _numOfIntrument,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get status => _status;
  num? get id => _id;
  num? get artistsTypeId => _artistsTypeId;
  String? get name => _name;
  String? get numOfIntrument => _numOfIntrument;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['id'] = _id;
    map['artists_type_id'] = _artistsTypeId;
    map['name'] = _name;
    map['num_of_intrument'] = _numOfIntrument;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
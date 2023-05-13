/// error : false
/// message : "Address Detail."
/// data : {"id":7,"user_id":2,"flat_no":null,"landmark":null,"state":null,"city":null,"pincode":null,"id_proof":"public/id_proof/1670061550.png","aadhar_number":null,"created_at":"2022-12-03T07:56:24.000000Z","updated_at":"2022-12-03T09:59:10.000000Z"}

class AddressM {
  AddressM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  AddressM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
AddressM copyWith({  bool? error,
  String? message,
  Data? data,
}) => AddressM(  error: error ?? _error,
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

/// id : 7
/// user_id : 2
/// flat_no : null
/// landmark : null
/// state : null
/// city : null
/// pincode : null
/// id_proof : "public/id_proof/1670061550.png"
/// aadhar_number : null
/// created_at : "2022-12-03T07:56:24.000000Z"
/// updated_at : "2022-12-03T09:59:10.000000Z"

class Data {
  Data({
      num? id, 
      num? userId, 
      dynamic flatNo, 
      dynamic landmark, 
      dynamic state, 
      dynamic city, 
      dynamic pincode, 
      String? idProof, 
      dynamic aadharNumber, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _flatNo = flatNo;
    _landmark = landmark;
    _state = state;
    _city = city;
    _pincode = pincode;
    _idProof = idProof;
    _aadharNumber = aadharNumber;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _flatNo = json['flat_no'];
    _landmark = json['landmark'];
    _state = json['state'];
    _city = json['city'];
    _pincode = json['pincode'];
    _idProof = json['id_proof'];
    _aadharNumber = json['aadhar_number'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  dynamic _flatNo;
  dynamic _landmark;
  dynamic _state;
  dynamic _city;
  dynamic _pincode;
  String? _idProof;
  dynamic _aadharNumber;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? userId,
  dynamic flatNo,
  dynamic landmark,
  dynamic state,
  dynamic city,
  dynamic pincode,
  String? idProof,
  dynamic aadharNumber,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  flatNo: flatNo ?? _flatNo,
  landmark: landmark ?? _landmark,
  state: state ?? _state,
  city: city ?? _city,
  pincode: pincode ?? _pincode,
  idProof: idProof ?? _idProof,
  aadharNumber: aadharNumber ?? _aadharNumber,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  dynamic get flatNo => _flatNo;
  dynamic get landmark => _landmark;
  dynamic get state => _state;
  dynamic get city => _city;
  dynamic get pincode => _pincode;
  String? get idProof => _idProof;
  dynamic get aadharNumber => _aadharNumber;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['flat_no'] = _flatNo;
    map['landmark'] = _landmark;
    map['state'] = _state;
    map['city'] = _city;
    map['pincode'] = _pincode;
    map['id_proof'] = _idProof;
    map['aadhar_number'] = _aadharNumber;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
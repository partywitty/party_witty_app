
class ClubListM {
  ClubListM({
      bool? error, 
      String? message, 
      List<ClubData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  ClubListM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ClubData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<ClubData>? _data;
ClubListM copyWith({  bool? error,
  String? message,
  List<ClubData>? data,
}) => ClubListM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<ClubData>? get data => _data;

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


class ClubData {
  ClubData({
      num? id, 
      num? userId, 
      String? nameOfClub, 
      String? address, 
      String? landmark, 
      String? state, 
      String? city, 
      String? pincode, 
      String? iam, 
      String? poc, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _nameOfClub = nameOfClub;
    _address = address;
    _landmark = landmark;
    _state = state;
    _city = city;
    _pincode = pincode;
    _iam = iam;
    _poc = poc;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ClubData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _nameOfClub = json['name_of_club'];
    _address = json['address'];
    _landmark = json['landmark'];
    _state = json['state'];
    _city = json['city'];
    _pincode = json['pincode'];
    _iam = json['iam'];
    _poc = json['poc'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _nameOfClub;
  String? _address;
  String? _landmark;
  String? _state;
  String? _city;
  String? _pincode;
  String? _iam;
  String? _poc;
  String? _createdAt;
  String? _updatedAt;
  ClubData copyWith({  num? id,
  num? userId,
  String? nameOfClub,
  String? address,
  String? landmark,
  String? state,
  String? city,
  String? pincode,
  String? iam,
  String? poc,
  String? createdAt,
  String? updatedAt,
}) => ClubData(  id: id ?? _id,
  userId: userId ?? _userId,
  nameOfClub: nameOfClub ?? _nameOfClub,
  address: address ?? _address,
  landmark: landmark ?? _landmark,
  state: state ?? _state,
  city: city ?? _city,
  pincode: pincode ?? _pincode,
  iam: iam ?? _iam,
  poc: poc ?? _poc,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get nameOfClub => _nameOfClub;
  String? get address => _address;
  String? get landmark => _landmark;
  String? get state => _state;
  String? get city => _city;
  String? get pincode => _pincode;
  String? get iam => _iam;
  String? get poc => _poc;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name_of_club'] = _nameOfClub;
    map['address'] = _address;
    map['landmark'] = _landmark;
    map['state'] = _state;
    map['city'] = _city;
    map['pincode'] = _pincode;
    map['iam'] = _iam;
    map['poc'] = _poc;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
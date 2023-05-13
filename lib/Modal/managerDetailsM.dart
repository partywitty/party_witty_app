
class ManagerDetailsM {
  ManagerDetailsM({
      bool? error, 
      String? message,
    managerDetails? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  ManagerDetailsM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? managerDetails.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  managerDetails? _data;
ManagerDetailsM copyWith({  bool? error,
  String? message,
  managerDetails? data,
}) => ManagerDetailsM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  managerDetails? get data => _data;

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


class managerDetails {
  managerDetails({
      num? id, 
      num? userId, 
      String? signature, 
      String? name, 
      String? contactNo, 
      String? languageId, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _signature = signature;
    _name = name;
    _contactNo = contactNo;
    _languageId = languageId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  managerDetails.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _signature = json['signature'];
    _name = json['name'];
    _contactNo = json['contact_no'];
    _languageId = json['language_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _signature;
  String? _name;
  String? _contactNo;
  String? _languageId;
  String? _createdAt;
  String? _updatedAt;
  managerDetails copyWith({  num? id,
  num? userId,
  String? signature,
  String? name,
  String? contactNo,
  String? languageId,
  String? createdAt,
  String? updatedAt,
}) => managerDetails(  id: id ?? _id,
  userId: userId ?? _userId,
  signature: signature ?? _signature,
  name: name ?? _name,
  contactNo: contactNo ?? _contactNo,
  languageId: languageId ?? _languageId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get signature => _signature;
  String? get name => _name;
  String? get contactNo => _contactNo;
  String? get languageId => _languageId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['signature'] = _signature;
    map['name'] = _name;
    map['contact_no'] = _contactNo;
    map['language_id'] = _languageId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
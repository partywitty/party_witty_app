
class BankDetailsM {
  BankDetailsM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  BankDetailsM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
BankDetailsM copyWith({  bool? error,
  String? message,
  Data? data,
}) => BankDetailsM(  error: error ?? _error,
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
      num? id, 
      num? userId, 
      String? bankname, 
      String? ifsccode, 
      String? branch, 
      String? acountNumber, 
      String? panName, 
      String? panNumber, 
      String? cancelChaque, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _bankname = bankname;
    _ifsccode = ifsccode;
    _branch = branch;
    _acountNumber = acountNumber;
    _panName = panName;
    _panNumber = panNumber;
    _cancelChaque = cancelChaque;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _bankname = json['bankname'];
    _ifsccode = json['ifsccode'];
    _branch = json['branch'];
    _acountNumber = json['acount_number'];
    _panName = json['pan_name'];
    _panNumber = json['pan_number'];
    _cancelChaque = json['cancel_chaque'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _bankname;
  String? _ifsccode;
  String? _branch;
  String? _acountNumber;
  String? _panName;
  String? _panNumber;
  String? _cancelChaque;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? userId,
  String? bankname,
  String? ifsccode,
  String? branch,
  String? acountNumber,
  String? panName,
  String? panNumber,
  String? cancelChaque,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  bankname: bankname ?? _bankname,
  ifsccode: ifsccode ?? _ifsccode,
  branch: branch ?? _branch,
  acountNumber: acountNumber ?? _acountNumber,
  panName: panName ?? _panName,
  panNumber: panNumber ?? _panNumber,
  cancelChaque: cancelChaque ?? _cancelChaque,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get bankname => _bankname;
  String? get ifsccode => _ifsccode;
  String? get branch => _branch;
  String? get acountNumber => _acountNumber;
  String? get panName => _panName;
  String? get panNumber => _panNumber;
  String? get cancelChaque => _cancelChaque;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['bankname'] = _bankname;
    map['ifsccode'] = _ifsccode;
    map['branch'] = _branch;
    map['acount_number'] = _acountNumber;
    map['pan_name'] = _panName;
    map['pan_number'] = _panNumber;
    map['cancel_chaque'] = _cancelChaque;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
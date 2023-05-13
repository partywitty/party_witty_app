/// error : false
/// message : "get user data Successfully."
/// data : {"user":{"id":308,"user_id":0,"username":"akash","contact_no":"6565555555","email":"z@gmail.com","password":"$2y$10$7XbxY7KCeIEkFtl/T22XPe2QvNNj.z.gh4M1BPzKcKfcw3WE1oUMK","gender":"male","role":"Artist","last_login":"2022-12-21 01:14:34","referral_code":"c5KtBNY2QuVfKlTx","otp":0,"status":"0","latitude":null,"logitude":null,"end_page":"referral_code","temp":0,"created_at":"2022-12-21T07:44:34.000000Z","updated_at":"2022-12-21T07:44:49.000000Z"},"temp_user":{"id":2,"user_id":308,"username":"akash","contact_no":"9876543210","gender":"male","temp":0,"created_at":"2022-12-21T10:11:01.000000Z","updated_at":"2022-12-21T10:11:01.000000Z"}}

class PrimaryM {
  PrimaryM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  PrimaryM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
PrimaryM copyWith({  bool? error,
  String? message,
  Data? data,
}) => PrimaryM(  error: error ?? _error,
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

/// user : {"id":308,"user_id":0,"username":"akash","contact_no":"6565555555","email":"z@gmail.com","password":"$2y$10$7XbxY7KCeIEkFtl/T22XPe2QvNNj.z.gh4M1BPzKcKfcw3WE1oUMK","gender":"male","role":"Artist","last_login":"2022-12-21 01:14:34","referral_code":"c5KtBNY2QuVfKlTx","otp":0,"status":"0","latitude":null,"logitude":null,"end_page":"referral_code","temp":0,"created_at":"2022-12-21T07:44:34.000000Z","updated_at":"2022-12-21T07:44:49.000000Z"}
/// temp_user : {"id":2,"user_id":308,"username":"akash","contact_no":"9876543210","gender":"male","temp":0,"created_at":"2022-12-21T10:11:01.000000Z","updated_at":"2022-12-21T10:11:01.000000Z"}

class Data {
  Data({
      User? user, 
      TempUser? tempUser,}){
    _user = user;
    _tempUser = tempUser;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _tempUser = json['temp_user'] != null ? TempUser.fromJson(json['temp_user']) : null;
  }
  User? _user;
  TempUser? _tempUser;
Data copyWith({  User? user,
  TempUser? tempUser,
}) => Data(  user: user ?? _user,
  tempUser: tempUser ?? _tempUser,
);
  User? get user => _user;
  TempUser? get tempUser => _tempUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_tempUser != null) {
      map['temp_user'] = _tempUser?.toJson();
    }
    return map;
  }

}

/// id : 2
/// user_id : 308
/// username : "akash"
/// contact_no : "9876543210"
/// gender : "male"
/// temp : 0
/// created_at : "2022-12-21T10:11:01.000000Z"
/// updated_at : "2022-12-21T10:11:01.000000Z"

class TempUser {
  TempUser({
      num? id, 
      num? userId, 
      String? username, 
      String? contactNo, 
      String? gender, 
      num? temp, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _username = username;
    _contactNo = contactNo;
    _gender = gender;
    _temp = temp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  TempUser.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _username = json['username'];
    _contactNo = json['contact_no'];
    _gender = json['gender'];
    _temp = json['temp'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _username;
  String? _contactNo;
  String? _gender;
  num? _temp;
  String? _createdAt;
  String? _updatedAt;
TempUser copyWith({  num? id,
  num? userId,
  String? username,
  String? contactNo,
  String? gender,
  num? temp,
  String? createdAt,
  String? updatedAt,
}) => TempUser(  id: id ?? _id,
  userId: userId ?? _userId,
  username: username ?? _username,
  contactNo: contactNo ?? _contactNo,
  gender: gender ?? _gender,
  temp: temp ?? _temp,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get username => _username;
  String? get contactNo => _contactNo;
  String? get gender => _gender;
  num? get temp => _temp;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['username'] = _username;
    map['contact_no'] = _contactNo;
    map['gender'] = _gender;
    map['temp'] = _temp;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 308
/// user_id : 0
/// username : "akash"
/// contact_no : "6565555555"
/// email : "z@gmail.com"
/// password : "$2y$10$7XbxY7KCeIEkFtl/T22XPe2QvNNj.z.gh4M1BPzKcKfcw3WE1oUMK"
/// gender : "male"
/// role : "Artist"
/// last_login : "2022-12-21 01:14:34"
/// referral_code : "c5KtBNY2QuVfKlTx"
/// otp : 0
/// status : "0"
/// latitude : null
/// logitude : null
/// end_page : "referral_code"
/// temp : 0
/// created_at : "2022-12-21T07:44:34.000000Z"
/// updated_at : "2022-12-21T07:44:49.000000Z"

class User {
  User({
      num? id, 
      num? userId, 
      String? username, 
      String? contactNo, 
      String? email, 
      String? password, 
      String? gender, 
      String? role, 
      String? lastLogin, 
      String? referralCode, 
      num? otp, 
      String? status, 
      dynamic latitude, 
      dynamic logitude, 
      String? endPage, 
      num? temp, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _username = username;
    _contactNo = contactNo;
    _email = email;
    _password = password;
    _gender = gender;
    _role = role;
    _lastLogin = lastLogin;
    _referralCode = referralCode;
    _otp = otp;
    _status = status;
    _latitude = latitude;
    _logitude = logitude;
    _endPage = endPage;
    _temp = temp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _username = json['username'];
    _contactNo = json['contact_no'];
    _email = json['email'];
    _password = json['password'];
    _gender = json['gender'];
    _role = json['role'];
    _lastLogin = json['last_login'];
    _referralCode = json['referral_code'];
    _otp = json['otp'];
    _status = json['status'];
    _latitude = json['latitude'];
    _logitude = json['logitude'];
    _endPage = json['end_page'];
    _temp = json['temp'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _username;
  String? _contactNo;
  String? _email;
  String? _password;
  String? _gender;
  String? _role;
  String? _lastLogin;
  String? _referralCode;
  num? _otp;
  String? _status;
  dynamic _latitude;
  dynamic _logitude;
  String? _endPage;
  num? _temp;
  String? _createdAt;
  String? _updatedAt;
User copyWith({  num? id,
  num? userId,
  String? username,
  String? contactNo,
  String? email,
  String? password,
  String? gender,
  String? role,
  String? lastLogin,
  String? referralCode,
  num? otp,
  String? status,
  dynamic latitude,
  dynamic logitude,
  String? endPage,
  num? temp,
  String? createdAt,
  String? updatedAt,
}) => User(  id: id ?? _id,
  userId: userId ?? _userId,
  username: username ?? _username,
  contactNo: contactNo ?? _contactNo,
  email: email ?? _email,
  password: password ?? _password,
  gender: gender ?? _gender,
  role: role ?? _role,
  lastLogin: lastLogin ?? _lastLogin,
  referralCode: referralCode ?? _referralCode,
  otp: otp ?? _otp,
  status: status ?? _status,
  latitude: latitude ?? _latitude,
  logitude: logitude ?? _logitude,
  endPage: endPage ?? _endPage,
  temp: temp ?? _temp,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get username => _username;
  String? get contactNo => _contactNo;
  String? get email => _email;
  String? get password => _password;
  String? get gender => _gender;
  String? get role => _role;
  String? get lastLogin => _lastLogin;
  String? get referralCode => _referralCode;
  num? get otp => _otp;
  String? get status => _status;
  dynamic get latitude => _latitude;
  dynamic get logitude => _logitude;
  String? get endPage => _endPage;
  num? get temp => _temp;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['username'] = _username;
    map['contact_no'] = _contactNo;
    map['email'] = _email;
    map['password'] = _password;
    map['gender'] = _gender;
    map['role'] = _role;
    map['last_login'] = _lastLogin;
    map['referral_code'] = _referralCode;
    map['otp'] = _otp;
    map['status'] = _status;
    map['latitude'] = _latitude;
    map['logitude'] = _logitude;
    map['end_page'] = _endPage;
    map['temp'] = _temp;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
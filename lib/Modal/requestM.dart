/// error : true
/// message : "Request List"
/// data : {"requests":[{"id":744,"request_by":942,"request_to":941,"referral_code":null,"status":"0","created_at":"2023-03-10T05:11:50.000000Z","updated_at":"2023-03-10T05:11:50.000000Z","username":"cbbcb","user_profile":"public/uploads/1678425104.jpg"}]}

class RequestM {
  RequestM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  RequestM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
RequestM copyWith({  bool? error,
  String? message,
  Data? data,
}) => RequestM(  error: error ?? _error,
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

/// requests : [{"id":744,"request_by":942,"request_to":941,"referral_code":null,"status":"0","created_at":"2023-03-10T05:11:50.000000Z","updated_at":"2023-03-10T05:11:50.000000Z","username":"cbbcb","user_profile":"public/uploads/1678425104.jpg"}]

class Data {
  Data({
      List<Requests>? requests,}){
    _requests = requests;
}

  Data.fromJson(dynamic json) {
    if (json['requests'] != null) {
      _requests = [];
      json['requests'].forEach((v) {
        _requests?.add(Requests.fromJson(v));
      });
    }
  }
  List<Requests>? _requests;
Data copyWith({  List<Requests>? requests,
}) => Data(  requests: requests ?? _requests,
);
  List<Requests>? get requests => _requests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_requests != null) {
      map['requests'] = _requests?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 744
/// request_by : 942
/// request_to : 941
/// referral_code : null
/// status : "0"
/// created_at : "2023-03-10T05:11:50.000000Z"
/// updated_at : "2023-03-10T05:11:50.000000Z"
/// username : "cbbcb"
/// user_profile : "public/uploads/1678425104.jpg"

class Requests {
  Requests({
      num? id, 
      num? requestBy, 
      num? requestTo, 
      dynamic referralCode, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      String? username, 
      String? userProfile,}){
    _id = id;
    _requestBy = requestBy;
    _requestTo = requestTo;
    _referralCode = referralCode;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _username = username;
    _userProfile = userProfile;
}

  Requests.fromJson(dynamic json) {
    _id = json['id'];
    _requestBy = json['request_by'];
    _requestTo = json['request_to'];
    _referralCode = json['referral_code'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _username = json['username'];
    _userProfile = json['user_profile'];
  }
  num? _id;
  num? _requestBy;
  num? _requestTo;
  dynamic _referralCode;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _username;
  String? _userProfile;
Requests copyWith({  num? id,
  num? requestBy,
  num? requestTo,
  dynamic referralCode,
  String? status,
  String? createdAt,
  String? updatedAt,
  String? username,
  String? userProfile,
}) => Requests(  id: id ?? _id,
  requestBy: requestBy ?? _requestBy,
  requestTo: requestTo ?? _requestTo,
  referralCode: referralCode ?? _referralCode,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  username: username ?? _username,
  userProfile: userProfile ?? _userProfile,
);
  num? get id => _id;
  num? get requestBy => _requestBy;
  num? get requestTo => _requestTo;
  dynamic get referralCode => _referralCode;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get username => _username;
  String? get userProfile => _userProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['request_by'] = _requestBy;
    map['request_to'] = _requestTo;
    map['referral_code'] = _referralCode;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['username'] = _username;
    map['user_profile'] = _userProfile;
    return map;
  }

}
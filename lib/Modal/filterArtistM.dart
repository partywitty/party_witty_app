/// error : false
/// message : "get Filter artist Successfully."
/// data : [{"id":264,"username":"akash","contact_no":"9876543210","email":"aaa@gmail.com","password":"$2y$10$PeMCNxeb2CrCT8HeZ16lyO4o57naKdq7hnjDfQ0vLJ1Dg8bL1KTE2","gender":"male","role":"Artist","last_login":"2022-12-13 06:03:41","referral_code":"kHFVLO4jARh1rcd2","otp":0,"status":"1","latitude":null,"logitude":null,"end_page":"service_agreement","created_at":"2022-12-13T12:33:41.000000Z","updated_at":"2022-12-13T13:28:26.000000Z","artists_type_id":1,"artist_name":"Vocalist","subcategory_id":null,"subcategory_name":null,"genres_id":null,"genres_name":null,"venue_id":"1","venue_name":"Private","price":"1","intrument_id":1},{"id":127,"username":"test","contact_no":"9876543210","email":"test@gmail.com","password":"$2y$10$OjOGdDPHhhvc8dQn7gWbauWmVloXCbiHzWq40llfKdTy1wbSpIRMC","gender":"male","role":"Club","last_login":"2022-12-09 02:58:16","referral_code":"sCeYcsncXPSF9lG8","otp":1234,"status":"1","latitude":null,"logitude":null,"end_page":null,"created_at":"2022-12-09T09:28:16.000000Z","updated_at":"2022-12-14T12:09:02.000000Z","artists_type_id":1,"artist_name":"Vocalist","subcategory_id":"15,16,17","subcategory_name":"solo,duo,Trio","genres_id":"1,2,3,4","genres_name":"Sufi,sufi sitting kawwali,Western,Bollywood","venue_id":"2,1,3","venue_name":"Club,Private,Corporate","price":"300","intrument_id":1},{"id":111,"username":"Ritesh","contact_no":"8982766904","email":"ritesh@gmail.com","password":"$2y$10$WuoFCVEWnN1WuiYs8akTG.idGNDtu9/xOrYwi0JLvG3yLLNHxb96q","gender":"male","role":"Artist","last_login":"2022-12-07 05:50:05","referral_code":"WeJdBmiqfZTyfOtr","otp":1234,"status":"0","latitude":null,"logitude":null,"end_page":"address","created_at":"2022-12-07T12:20:05.000000Z","updated_at":"2022-12-13T14:49:23.000000Z","artists_type_id":1,"artist_name":"Vocalist","subcategory_id":null,"subcategory_name":null,"genres_id":"1,2","genres_name":"Sufi,sufi sitting kawwali","venue_id":"1,2,3","venue_name":"Private,Club,Corporate","price":"1000","intrument_id":4}]

class FilterArtistM {
  FilterArtistM({
      bool? error, 
      String? message, 
      List<filterData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  FilterArtistM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(filterData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<filterData>? _data;
FilterArtistM copyWith({  bool? error,
  String? message,
  List<filterData>? data,
}) => FilterArtistM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<filterData>? get data => _data;

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

/// id : 264
/// username : "akash"
/// contact_no : "9876543210"
/// email : "aaa@gmail.com"
/// password : "$2y$10$PeMCNxeb2CrCT8HeZ16lyO4o57naKdq7hnjDfQ0vLJ1Dg8bL1KTE2"
/// gender : "male"
/// role : "Artist"
/// last_login : "2022-12-13 06:03:41"
/// referral_code : "kHFVLO4jARh1rcd2"
/// otp : 0
/// status : "1"
/// latitude : null
/// logitude : null
/// end_page : "service_agreement"
/// created_at : "2022-12-13T12:33:41.000000Z"
/// updated_at : "2022-12-13T13:28:26.000000Z"
/// artists_type_id : 1
/// artist_name : "Vocalist"
/// subcategory_id : null
/// subcategory_name : null
/// genres_id : null
/// genres_name : null
/// venue_id : "1"
/// venue_name : "Private"
/// price : "1"
/// intrument_id : 1

class filterData {
  filterData({
      num? id, 
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
      String? createdAt, 
      String? updatedAt, 
      num? artistsTypeId, 
      String? artistName, 
      dynamic subcategoryId, 
      dynamic subcategoryName, 
      dynamic genresId, 
      dynamic genresName, 
      String? venueId, 
      String? venueName, 
      String? price, 
      num? intrumentId,}){
    _id = id;
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
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _artistsTypeId = artistsTypeId;
    _artistName = artistName;
    _subcategoryId = subcategoryId;
    _subcategoryName = subcategoryName;
    _genresId = genresId;
    _genresName = genresName;
    _venueId = venueId;
    _venueName = venueName;
    _price = price;
    _intrumentId = intrumentId;
}

  filterData.fromJson(dynamic json) {
    _id = json['id'];
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
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _artistsTypeId = json['artists_type_id'];
    _artistName = json['artist_name'];
    _subcategoryId = json['subcategory_id'];
    _subcategoryName = json['subcategory_name'];
    _genresId = json['genres_id'];
    _genresName = json['genres_name'];
    _venueId = json['venue_id'];
    _venueName = json['venue_name'];
    _price = json['price'];
    _intrumentId = json['intrument_id'];
  }
  num? _id;
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
  String? _createdAt;
  String? _updatedAt;
  num? _artistsTypeId;
  String? _artistName;
  dynamic _subcategoryId;
  dynamic _subcategoryName;
  dynamic _genresId;
  dynamic _genresName;
  String? _venueId;
  String? _venueName;
  String? _price;
  num? _intrumentId;
  filterData copyWith({  num? id,
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
  String? createdAt,
  String? updatedAt,
  num? artistsTypeId,
  String? artistName,
  dynamic subcategoryId,
  dynamic subcategoryName,
  dynamic genresId,
  dynamic genresName,
  String? venueId,
  String? venueName,
  String? price,
  num? intrumentId,
}) => filterData(  id: id ?? _id,
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
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  artistName: artistName ?? _artistName,
  subcategoryId: subcategoryId ?? _subcategoryId,
  subcategoryName: subcategoryName ?? _subcategoryName,
  genresId: genresId ?? _genresId,
  genresName: genresName ?? _genresName,
  venueId: venueId ?? _venueId,
  venueName: venueName ?? _venueName,
  price: price ?? _price,
  intrumentId: intrumentId ?? _intrumentId,
);
  num? get id => _id;
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
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get artistsTypeId => _artistsTypeId;
  String? get artistName => _artistName;
  dynamic get subcategoryId => _subcategoryId;
  dynamic get subcategoryName => _subcategoryName;
  dynamic get genresId => _genresId;
  dynamic get genresName => _genresName;
  String? get venueId => _venueId;
  String? get venueName => _venueName;
  String? get price => _price;
  num? get intrumentId => _intrumentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
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
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['artists_type_id'] = _artistsTypeId;
    map['artist_name'] = _artistName;
    map['subcategory_id'] = _subcategoryId;
    map['subcategory_name'] = _subcategoryName;
    map['genres_id'] = _genresId;
    map['genres_name'] = _genresName;
    map['venue_id'] = _venueId;
    map['venue_name'] = _venueName;
    map['price'] = _price;
    map['intrument_id'] = _intrumentId;
    return map;
  }

}
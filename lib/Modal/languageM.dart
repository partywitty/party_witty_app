/// error : false
/// message : "Get Language Successfully."
/// data : [{"id":1,"language":"Hindi","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":2,"language":"English","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":3,"language":"Marathi","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":4,"language":"Gujarati","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":5,"language":"Bangla","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":6,"language":"Malayalam","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":7,"language":"Punjabi","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":8,"language":"Tamil","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":9,"language":"Telugu","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":10,"language":"Sindhi","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"},{"id":11,"language":"Urdu","created_at":"2022-12-12T10:00:53.000000Z","updated_at":"2022-12-12T10:00:53.000000Z"}]

class LanguageM {
  LanguageM({
      bool? error, 
      String? message, 
      List<lanData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  LanguageM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(lanData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<lanData>? _data;
LanguageM copyWith({  bool? error,
  String? message,
  List<lanData>? data,
}) => LanguageM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<lanData>? get data => _data;

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
/// language : "Hindi"
/// created_at : "2022-12-12T10:00:53.000000Z"
/// updated_at : "2022-12-12T10:00:53.000000Z"

class lanData {
  lanData({
      num? id, 
      String? language, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _language = language;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  lanData.fromJson(dynamic json) {
    _id = json['id'];
    _language = json['language'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _language;
  String? _createdAt;
  String? _updatedAt;
  lanData copyWith({  num? id,
  String? language,
  String? createdAt,
  String? updatedAt,
}) => lanData(  id: id ?? _id,
  language: language ?? _language,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get language => _language;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['language'] = _language;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
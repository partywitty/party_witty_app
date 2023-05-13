
class UploadImageM {
  UploadImageM({
      bool? error, 
      String? message, 
      List<uploadData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  UploadImageM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(uploadData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<uploadData>? _data;
UploadImageM copyWith({  bool? error,
  String? message,
  List<uploadData>? data,
}) => UploadImageM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<uploadData>? get data => _data;

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

class uploadData {
  uploadData({
      num? id, 
      num? userId, 
      String? filePath, 
      String? location, 
      String? caption, 
      String? withPhoto, 
      String? type, 
      String? isDelete, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
    _isDelete = isDelete;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  uploadData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
    _isDelete = json['is_delete'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _filePath;
  String? _location;
  String? _caption;
  String? _withPhoto;
  String? _type;
  String? _isDelete;
  String? _createdAt;
  String? _updatedAt;
  uploadData copyWith({  num? id,
  num? userId,
  String? filePath,
  String? location,
  String? caption,
  String? withPhoto,
  String? type,
  String? isDelete,
  String? createdAt,
  String? updatedAt,
}) => uploadData(  id: id ?? _id,
  userId: userId ?? _userId,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
  isDelete: isDelete ?? _isDelete,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get filePath => _filePath;
  String? get location => _location;
  String? get caption => _caption;
  String? get withPhoto => _withPhoto;
  String? get type => _type;
  String? get isDelete => _isDelete;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    map['is_delete'] = _isDelete;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
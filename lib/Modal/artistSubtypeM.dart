/// error : false
/// message : "Type Of Artist Subcategory"
/// data : {"subcategory":[{"id":1,"artists_type_id":2,"name":"Percussion","num_of_intrument":null,"image":"","status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":2,"artists_type_id":2,"name":"Darbuka","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":3,"artists_type_id":2,"name":"Bass Guitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":4,"artists_type_id":2,"name":"Drummer","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":5,"artists_type_id":2,"name":"Violinist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":6,"artists_type_id":2,"name":"Keyboardist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":7,"artists_type_id":2,"name":"Cajon","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":8,"artists_type_id":2,"name":"Tabla","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":9,"artists_type_id":2,"name":"Harmonium","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":10,"artists_type_id":2,"name":"Flute","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":11,"artists_type_id":2,"name":"sexophone","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":12,"artists_type_id":2,"name":"Sitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":13,"artists_type_id":2,"name":"Acoustic Guitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":14,"artists_type_id":2,"name":"Lead Guitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"}],"selected":[{"sub_category_id":"15","sub_category_name":"solo"},{"sub_category_id":"16","sub_category_name":"duo"}]}

class ArtistSubtypeM {
  ArtistSubtypeM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  ArtistSubtypeM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
ArtistSubtypeM copyWith({  bool? error,
  String? message,
  Data? data,
}) => ArtistSubtypeM(  error: error ?? _error,
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

/// subcategory : [{"id":1,"artists_type_id":2,"name":"Percussion","num_of_intrument":null,"image":"","status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":2,"artists_type_id":2,"name":"Darbuka","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":3,"artists_type_id":2,"name":"Bass Guitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":4,"artists_type_id":2,"name":"Drummer","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":5,"artists_type_id":2,"name":"Violinist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":6,"artists_type_id":2,"name":"Keyboardist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":7,"artists_type_id":2,"name":"Cajon","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":8,"artists_type_id":2,"name":"Tabla","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":9,"artists_type_id":2,"name":"Harmonium","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":10,"artists_type_id":2,"name":"Flute","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":11,"artists_type_id":2,"name":"sexophone","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":12,"artists_type_id":2,"name":"Sitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":13,"artists_type_id":2,"name":"Acoustic Guitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"},{"id":14,"artists_type_id":2,"name":"Lead Guitarist","num_of_intrument":null,"image":null,"status":"1","created_at":"2022-11-24T10:57:30.000000Z","updated_at":"2022-11-24T10:57:30.000000Z"}]
/// selected : [{"sub_category_id":"15","sub_category_name":"solo"},{"sub_category_id":"16","sub_category_name":"duo"}]

class Data {
  Data({
      List<Subcategory>? subcategory, 
      List<Selected>? selected,}){
    _subcategory = subcategory;
    _selected = selected;
}

  Data.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      _subcategory = [];
      json['subcategory'].forEach((v) {
        _subcategory?.add(Subcategory.fromJson(v));
      });
    }
    if (json['selected'] != null) {
      _selected = [];
      json['selected'].forEach((v) {
        _selected?.add(Selected.fromJson(v));
      });
    }
  }
  List<Subcategory>? _subcategory;
  List<Selected>? _selected;
Data copyWith({  List<Subcategory>? subcategory,
  List<Selected>? selected,
}) => Data(  subcategory: subcategory ?? _subcategory,
  selected: selected ?? _selected,
);
  List<Subcategory>? get subcategory => _subcategory;
  List<Selected>? get selected => _selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_subcategory != null) {
      map['subcategory'] = _subcategory?.map((v) => v.toJson()).toList();
    }
    if (_selected != null) {
      map['selected'] = _selected?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// sub_category_id : "15"
/// sub_category_name : "solo"

class Selected {
  Selected({
      String? subCategoryId, 
      String? subCategoryName,}){
    _subCategoryId = subCategoryId;
    _subCategoryName = subCategoryName;
}

  Selected.fromJson(dynamic json) {
    _subCategoryId = json['sub_category_id'];
    _subCategoryName = json['sub_category_name'];
  }
  String? _subCategoryId;
  String? _subCategoryName;
Selected copyWith({  String? subCategoryId,
  String? subCategoryName,
}) => Selected(  subCategoryId: subCategoryId ?? _subCategoryId,
  subCategoryName: subCategoryName ?? _subCategoryName,
);
  String? get subCategoryId => _subCategoryId;
  String? get subCategoryName => _subCategoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_category_id'] = _subCategoryId;
    map['sub_category_name'] = _subCategoryName;
    return map;
  }

}

/// id : 1
/// artists_type_id : 2
/// name : "Percussion"
/// num_of_intrument : null
/// image : ""
/// status : "1"
/// created_at : "2022-11-24T10:57:30.000000Z"
/// updated_at : "2022-11-24T10:57:30.000000Z"

class Subcategory {
  Subcategory({
      num? id, 
      num? artistsTypeId, 
      String? name, 
      dynamic numOfIntrument, 
      String? image, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _artistsTypeId = artistsTypeId;
    _name = name;
    _numOfIntrument = numOfIntrument;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Subcategory.fromJson(dynamic json) {
    _id = json['id'];
    _artistsTypeId = json['artists_type_id'];
    _name = json['name'];
    _numOfIntrument = json['num_of_intrument'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _artistsTypeId;
  String? _name;
  dynamic _numOfIntrument;
  String? _image;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
Subcategory copyWith({  num? id,
  num? artistsTypeId,
  String? name,
  dynamic numOfIntrument,
  String? image,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Subcategory(  id: id ?? _id,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  name: name ?? _name,
  numOfIntrument: numOfIntrument ?? _numOfIntrument,
  image: image ?? _image,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get artistsTypeId => _artistsTypeId;
  String? get name => _name;
  dynamic get numOfIntrument => _numOfIntrument;
  String? get image => _image;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['artists_type_id'] = _artistsTypeId;
    map['name'] = _name;
    map['num_of_intrument'] = _numOfIntrument;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
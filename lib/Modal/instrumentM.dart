/// error : false
/// message : "Get Subcategory Successfully."
/// data : {"instruments":[{"id":6,"subcategory_id":16,"name":"Violin","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":7,"subcategory_id":16,"name":"Guitar","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":8,"subcategory_id":16,"name":"Triangle","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":9,"subcategory_id":16,"name":"Trumpet","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":10,"subcategory_id":16,"name":"Saxophone","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":11,"subcategory_id":16,"name":"Mouth organ\r\n","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":12,"subcategory_id":16,"name":"Cello","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":13,"subcategory_id":16,"name":"Xylophone","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":14,"subcategory_id":16,"name":"Clap box","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":15,"subcategory_id":16,"name":"Electric guitar","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"}],"selected_instruments":null,"subcategory_id":16,"title":"duo With What Instrument"}

class InstrumentM {
  InstrumentM({
      bool? error, 
      String? message,
    soloData? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  InstrumentM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? soloData.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  soloData? _data;
InstrumentM copyWith({  bool? error,
  String? message,
  soloData? data,
}) => InstrumentM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  soloData? get data => _data;

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

/// instruments : [{"id":6,"subcategory_id":16,"name":"Violin","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":7,"subcategory_id":16,"name":"Guitar","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":8,"subcategory_id":16,"name":"Triangle","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":9,"subcategory_id":16,"name":"Trumpet","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":10,"subcategory_id":16,"name":"Saxophone","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":11,"subcategory_id":16,"name":"Mouth organ\r\n","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":12,"subcategory_id":16,"name":"Cello","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":13,"subcategory_id":16,"name":"Xylophone","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":14,"subcategory_id":16,"name":"Clap box","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"},{"id":15,"subcategory_id":16,"name":"Electric guitar","image":null,"created_at":"2022-12-07T05:25:44.000000Z","updated_at":"2022-12-07T05:25:44.000000Z"}]
/// selected_instruments : null
/// subcategory_id : 16
/// title : "duo With What Instrument"

class soloData {
  soloData({
      List<Instruments>? instruments, 
      dynamic selectedInstruments, 
      num? subcategoryId, 
      String? title,}){
    _instruments = instruments;
    _selectedInstruments = selectedInstruments;
    _subcategoryId = subcategoryId;
    _title = title;
}

  soloData.fromJson(dynamic json) {
    if (json['instruments'] != null) {
      _instruments = [];
      json['instruments'].forEach((v) {
        _instruments?.add(Instruments.fromJson(v));
      });
    }
    _selectedInstruments = json['selected_instruments'];
    _subcategoryId = json['subcategory_id'];
    _title = json['title'];
  }
  List<Instruments>? _instruments;
  dynamic _selectedInstruments;
  num? _subcategoryId;
  String? _title;
  soloData copyWith({  List<Instruments>? instruments,
  dynamic selectedInstruments,
  num? subcategoryId,
  String? title,
}) => soloData(  instruments: instruments ?? _instruments,
  selectedInstruments: selectedInstruments ?? _selectedInstruments,
  subcategoryId: subcategoryId ?? _subcategoryId,
  title: title ?? _title,
);
  List<Instruments>? get instruments => _instruments;
  dynamic get selectedInstruments => _selectedInstruments;
  num? get subcategoryId => _subcategoryId;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_instruments != null) {
      map['instruments'] = _instruments?.map((v) => v.toJson()).toList();
    }
    map['selected_instruments'] = _selectedInstruments;
    map['subcategory_id'] = _subcategoryId;
    map['title'] = _title;
    return map;
  }

}

/// id : 6
/// subcategory_id : 16
/// name : "Violin"
/// image : null
/// created_at : "2022-12-07T05:25:44.000000Z"
/// updated_at : "2022-12-07T05:25:44.000000Z"

class Instruments {
  Instruments({
      num? id, 
      num? subcategoryId, 
      String? name, 
      dynamic image, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _subcategoryId = subcategoryId;
    _name = name;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Instruments.fromJson(dynamic json) {
    _id = json['id'];
    _subcategoryId = json['subcategory_id'];
    _name = json['name'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _subcategoryId;
  String? _name;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
Instruments copyWith({  num? id,
  num? subcategoryId,
  String? name,
  dynamic image,
  String? createdAt,
  String? updatedAt,
}) => Instruments(  id: id ?? _id,
  subcategoryId: subcategoryId ?? _subcategoryId,
  name: name ?? _name,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get subcategoryId => _subcategoryId;
  String? get name => _name;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['subcategory_id'] = _subcategoryId;
    map['name'] = _name;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
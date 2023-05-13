/// error : false
/// message : "Type Of Genres"
/// data : {"genres":[{"id":1,"name":"Sufi","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":2,"name":"sufi sit down kawwali","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":3,"name":"Western","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":4,"name":"Bollywood","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":5,"name":"Rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":6,"name":"Retro pop","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":7,"name":"Rhythm & Blues","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":8,"name":"Heavy Metal","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":9,"name":"Folk","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":10,"name":"Punk Rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":11,"name":"Indi rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":12,"name":"Funk","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":13,"name":"Pop rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":14,"name":"Jazz","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":15,"name":"Latin","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":16,"name":"Hard rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":17,"name":"gazal","image":null,"status":"1","created_at":"2022-12-13T14:01:14.000000Z","updated_at":"2022-12-13T14:01:14.000000Z"},{"id":18,"name":"Devotional","image":null,"status":"1","created_at":"2022-12-13T14:02:27.000000Z","updated_at":"2022-12-13T14:02:27.000000Z"},{"id":19,"name":"Other","image":null,"status":"1","created_at":"2022-12-13T13:59:10.000000Z","updated_at":"2022-12-13T13:59:10.000000Z"}],"selected":[{"genres_id":"1","genres_name":"Sufi"},{"genres_id":"4","genres_name":"Bollywood"},{"genres_id":"5","genres_name":"Rock"},{"genres_id":"6","genres_name":"Retro pop"},{"genres_id":"10","genres_name":"Punk Rock"},{"genres_id":"11","genres_name":"Indi rock"},{"genres_id":"13","genres_name":"Pop rock"},{"genres_id":"12","genres_name":"Funk"},{"genres_id":"7","genres_name":"Rhythm & Blues"}]}

class GenreM {
  GenreM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GenreM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
GenreM copyWith({  bool? error,
  String? message,
  Data? data,
}) => GenreM(  error: error ?? _error,
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

/// genres : [{"id":1,"name":"Sufi","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":2,"name":"sufi sit down kawwali","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":3,"name":"Western","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":4,"name":"Bollywood","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":5,"name":"Rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":6,"name":"Retro pop","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":7,"name":"Rhythm & Blues","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":8,"name":"Heavy Metal","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":9,"name":"Folk","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":10,"name":"Punk Rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":11,"name":"Indi rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":12,"name":"Funk","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":13,"name":"Pop rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":14,"name":"Jazz","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":15,"name":"Latin","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":16,"name":"Hard rock","image":null,"status":"1","created_at":"2022-11-24T11:02:08.000000Z","updated_at":"2022-11-24T11:02:08.000000Z"},{"id":17,"name":"gazal","image":null,"status":"1","created_at":"2022-12-13T14:01:14.000000Z","updated_at":"2022-12-13T14:01:14.000000Z"},{"id":18,"name":"Devotional","image":null,"status":"1","created_at":"2022-12-13T14:02:27.000000Z","updated_at":"2022-12-13T14:02:27.000000Z"},{"id":19,"name":"Other","image":null,"status":"1","created_at":"2022-12-13T13:59:10.000000Z","updated_at":"2022-12-13T13:59:10.000000Z"}]
/// selected : [{"genres_id":"1","genres_name":"Sufi"},{"genres_id":"4","genres_name":"Bollywood"},{"genres_id":"5","genres_name":"Rock"},{"genres_id":"6","genres_name":"Retro pop"},{"genres_id":"10","genres_name":"Punk Rock"},{"genres_id":"11","genres_name":"Indi rock"},{"genres_id":"13","genres_name":"Pop rock"},{"genres_id":"12","genres_name":"Funk"},{"genres_id":"7","genres_name":"Rhythm & Blues"}]

class Data {
  Data({
      List<Genres>? genres, 
      List<Selected>? selected,}){
    _genres = genres;
    _selected = selected;
}

  Data.fromJson(dynamic json) {
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    if (json['selected'] != null) {
      _selected = [];
      json['selected'].forEach((v) {
        _selected?.add(Selected.fromJson(v));
      });
    }
  }
  List<Genres>? _genres;
  List<Selected>? _selected;
Data copyWith({  List<Genres>? genres,
  List<Selected>? selected,
}) => Data(  genres: genres ?? _genres,
  selected: selected ?? _selected,
);
  List<Genres>? get genres => _genres;
  List<Selected>? get selected => _selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    if (_selected != null) {
      map['selected'] = _selected?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// genres_id : "1"
/// genres_name : "Sufi"

class Selected {
  Selected({
      String? genresId, 
      String? genresName,}){
    _genresId = genresId;
    _genresName = genresName;
}

  Selected.fromJson(dynamic json) {
    _genresId = json['genres_id'];
    _genresName = json['genres_name'];
  }
  String? _genresId;
  String? _genresName;
Selected copyWith({  String? genresId,
  String? genresName,
}) => Selected(  genresId: genresId ?? _genresId,
  genresName: genresName ?? _genresName,
);
  String? get genresId => _genresId;
  String? get genresName => _genresName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['genres_id'] = _genresId;
    map['genres_name'] = _genresName;
    return map;
  }

}

/// id : 1
/// name : "Sufi"
/// image : null
/// status : "1"
/// created_at : "2022-11-24T11:02:08.000000Z"
/// updated_at : "2022-11-24T11:02:08.000000Z"

class Genres {
  Genres({
      num? id, 
      String? name, 
      dynamic image, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _image = image;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Genres.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
Genres copyWith({  num? id,
  String? name,
  dynamic image,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => Genres(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
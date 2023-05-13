/// error : false
/// message : "new venue add."
/// data : {"venue":[{"venue_id":1,"venue_name":"Private"},{"venue_id":2,"venue_name":"Club"}],"stage":{"status":"1","id":16,"artists_type_id":1,"name":"duo","num_of_intrument":"2","image":null,"created_at":"2022-12-06T11:49:48.000000Z","updated_at":"2022-12-06T11:49:48.000000Z"}}

class EditVenueM {
  EditVenueM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  EditVenueM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
EditVenueM copyWith({  bool? error,
  String? message,
  Data? data,
}) => EditVenueM(  error: error ?? _error,
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

/// venue : [{"venue_id":1,"venue_name":"Private"},{"venue_id":2,"venue_name":"Club"}]
/// stage : {"status":"1","id":16,"artists_type_id":1,"name":"duo","num_of_intrument":"2","image":null,"created_at":"2022-12-06T11:49:48.000000Z","updated_at":"2022-12-06T11:49:48.000000Z"}

class Data {
  Data({
      List<Venue>? venue, 
      Stage? stage,}){
    _venue = venue;
    _stage = stage;
}

  Data.fromJson(dynamic json) {
    if (json['venue'] != null) {
      _venue = [];
      json['venue'].forEach((v) {
        _venue?.add(Venue.fromJson(v));
      });
    }
    _stage = json['stage'] != null ? Stage.fromJson(json['stage']) : null;
  }
  List<Venue>? _venue;
  Stage? _stage;
Data copyWith({  List<Venue>? venue,
  Stage? stage,
}) => Data(  venue: venue ?? _venue,
  stage: stage ?? _stage,
);
  List<Venue>? get venue => _venue;
  Stage? get stage => _stage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_venue != null) {
      map['venue'] = _venue?.map((v) => v.toJson()).toList();
    }
    if (_stage != null) {
      map['stage'] = _stage?.toJson();
    }
    return map;
  }

}

/// status : "1"
/// id : 16
/// artists_type_id : 1
/// name : "duo"
/// num_of_intrument : "2"
/// image : null
/// created_at : "2022-12-06T11:49:48.000000Z"
/// updated_at : "2022-12-06T11:49:48.000000Z"

class Stage {
  Stage({
      String? status, 
      num? id, 
      num? artistsTypeId, 
      String? name, 
      String? numOfIntrument, 
      dynamic image, 
      String? createdAt, 
      String? updatedAt,}){
    _status = status;
    _id = id;
    _artistsTypeId = artistsTypeId;
    _name = name;
    _numOfIntrument = numOfIntrument;
    _image = image;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Stage.fromJson(dynamic json) {
    _status = json['status'];
    _id = json['id'];
    _artistsTypeId = json['artists_type_id'];
    _name = json['name'];
    _numOfIntrument = json['num_of_intrument'];
    _image = json['image'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _status;
  num? _id;
  num? _artistsTypeId;
  String? _name;
  String? _numOfIntrument;
  dynamic _image;
  String? _createdAt;
  String? _updatedAt;
Stage copyWith({  String? status,
  num? id,
  num? artistsTypeId,
  String? name,
  String? numOfIntrument,
  dynamic image,
  String? createdAt,
  String? updatedAt,
}) => Stage(  status: status ?? _status,
  id: id ?? _id,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  name: name ?? _name,
  numOfIntrument: numOfIntrument ?? _numOfIntrument,
  image: image ?? _image,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get status => _status;
  num? get id => _id;
  num? get artistsTypeId => _artistsTypeId;
  String? get name => _name;
  String? get numOfIntrument => _numOfIntrument;
  dynamic get image => _image;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['id'] = _id;
    map['artists_type_id'] = _artistsTypeId;
    map['name'] = _name;
    map['num_of_intrument'] = _numOfIntrument;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// venue_id : 1
/// venue_name : "Private"

class Venue {
  Venue({
      num? venueId, 
      String? venueName,}){
    _venueId = venueId;
    _venueName = venueName;
}

  Venue.fromJson(dynamic json) {
    _venueId = json['venue_id'];
    _venueName = json['venue_name'];
  }
  num? _venueId;
  String? _venueName;
Venue copyWith({  num? venueId,
  String? venueName,
}) => Venue(  venueId: venueId ?? _venueId,
  venueName: venueName ?? _venueName,
);
  num? get venueId => _venueId;
  String? get venueName => _venueName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['venue_id'] = _venueId;
    map['venue_name'] = _venueName;
    return map;
  }

}
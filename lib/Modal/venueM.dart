/// error : false
/// message : "Type Of Venue"
/// data : {"genres":[{"id":1,"name":"Private","image":null,"status":"1","created_at":"2022-11-24T11:48:18.000000Z","updated_at":"2022-11-24T11:48:18.000000Z"},{"id":2,"name":"Club","image":null,"status":"1","created_at":"2022-11-24T11:48:18.000000Z","updated_at":"2022-11-24T11:48:18.000000Z"},{"id":3,"name":"Corporate","image":null,"status":"1","created_at":"2022-12-03T06:59:33.000000Z","updated_at":"2022-12-03T06:59:33.000000Z"}],"selected":[{"venue_id":"1","venue_name":"Private"},{"venue_id":"2","venue_name":"Club"},{"venue_id":"3","venue_name":"Corporate"}]}

class VenueM {
  VenueM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  VenueM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
VenueM copyWith({  bool? error,
  String? message,
  Data? data,
}) => VenueM(  error: error ?? _error,
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

/// genres : [{"id":1,"name":"Private","image":null,"status":"1","created_at":"2022-11-24T11:48:18.000000Z","updated_at":"2022-11-24T11:48:18.000000Z"},{"id":2,"name":"Club","image":null,"status":"1","created_at":"2022-11-24T11:48:18.000000Z","updated_at":"2022-11-24T11:48:18.000000Z"},{"id":3,"name":"Corporate","image":null,"status":"1","created_at":"2022-12-03T06:59:33.000000Z","updated_at":"2022-12-03T06:59:33.000000Z"}]
/// selected : [{"venue_id":"1","venue_name":"Private"},{"venue_id":"2","venue_name":"Club"},{"venue_id":"3","venue_name":"Corporate"}]

class Data {
  Data({
      List<venueData>? genres,
      List<SelectedVenue>? selected,}){
    _genres = genres;
    _selected = selected;
}

  Data.fromJson(dynamic json) {
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(venueData.fromJson(v));
      });
    }
    if (json['selected'] != null) {
      _selected = [];
      json['selected'].forEach((v) {
        _selected?.add(SelectedVenue.fromJson(v));
      });
    }
  }
  List<venueData>? _genres;
  List<SelectedVenue>? _selected;
Data copyWith({  List<venueData>? genres,
  List<SelectedVenue>? selected,
}) => Data(  genres: genres ?? _genres,
  selected: selected ?? _selected,
);
  List<venueData>? get genres => _genres;
  List<SelectedVenue>? get selected => _selected;

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

/// venue_id : "1"
/// venue_name : "Private"

class SelectedVenue {
  SelectedVenue({
      String? venueId, 
      String? venueName,}){
    _venueId = venueId;
    _venueName = venueName;
}

  SelectedVenue.fromJson(dynamic json) {
    _venueId = json['venue_id'];
    _venueName = json['venue_name'];
  }
  String? _venueId;
  String? _venueName;
  SelectedVenue copyWith({  String? venueId,
  String? venueName,
}) => SelectedVenue(  venueId: venueId ?? _venueId,
  venueName: venueName ?? _venueName,
);
  String? get venueId => _venueId;
  String? get venueName => _venueName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['venue_id'] = _venueId;
    map['venue_name'] = _venueName;
    return map;
  }

}

/// id : 1
/// name : "Private"
/// image : null
/// status : "1"
/// created_at : "2022-11-24T11:48:18.000000Z"
/// updated_at : "2022-11-24T11:48:18.000000Z"

class venueData {
  venueData({
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

  venueData.fromJson(dynamic json) {
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
  venueData copyWith({  num? id,
  String? name,
  dynamic image,
  String? status,
  String? createdAt,
  String? updatedAt,
}) => venueData(  id: id ?? _id,
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
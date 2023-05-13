/// error : false
/// message : "User Profile."
/// data : {"id":12,"user_id":1,"artists_type_id":1,"artist_name":"music","subcategory_id":"1,2","subcategory_name":"Percussion,Darbuka","genres_id":"1,3","genres_name":"Sufi,Western","stage_complisation_id":null,"stage_complisation_name":null,"venue_id":"2","venue_name":"Marriage","introduction":"gsdgdgdg","intagram_link":"http://partywitty.com/development/intafollow","intagram_follower":"5k","facebook_link":"http://partywitty.com/development/facebook_data","facebook_follower":"2.6k","created_at":"2022-12-02T07:28:24.000000Z","updated_at":"2022-12-02T13:46:37.000000Z"}

class GetartistDetailM {
  GetartistDetailM({
      bool? error, 
      String? message,
    artistFill? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetartistDetailM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? artistFill.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  artistFill? _data;
GetartistDetailM copyWith({  bool? error,
  String? message,
  artistFill? data,
}) => GetartistDetailM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  artistFill? get data => _data;

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

/// id : 12
/// user_id : 1
/// artists_type_id : 1
/// artist_name : "music"
/// subcategory_id : "1,2"
/// subcategory_name : "Percussion,Darbuka"
/// genres_id : "1,3"
/// genres_name : "Sufi,Western"
/// stage_complisation_id : null
/// stage_complisation_name : null
/// venue_id : "2"
/// venue_name : "Marriage"
/// introduction : "gsdgdgdg"
/// intagram_link : "http://partywitty.com/development/intafollow"
/// intagram_follower : "5k"
/// facebook_link : "http://partywitty.com/development/facebook_data"
/// facebook_follower : "2.6k"
/// created_at : "2022-12-02T07:28:24.000000Z"
/// updated_at : "2022-12-02T13:46:37.000000Z"

class artistFill {
  artistFill({
      num? id, 
      num? userId, 
      num? artistsTypeId, 
      String? artistName, 
      String? subcategoryId, 
      String? subcategoryName, 
      String? genresId, 
      String? genresName, 
      dynamic stageComplisationId, 
      dynamic stageComplisationName, 
      String? venueId, 
      String? venueName, 
      String? introduction, 
      String? intagramLink, 
      String? intagramFollower, 
      String? facebookLink, 
      String? facebookFollower, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _artistsTypeId = artistsTypeId;
    _artistName = artistName;
    _subcategoryId = subcategoryId;
    _subcategoryName = subcategoryName;
    _genresId = genresId;
    _genresName = genresName;
    _stageComplisationId = stageComplisationId;
    _stageComplisationName = stageComplisationName;
    _venueId = venueId;
    _venueName = venueName;
    _introduction = introduction;
    _intagramLink = intagramLink;
    _intagramFollower = intagramFollower;
    _facebookLink = facebookLink;
    _facebookFollower = facebookFollower;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  artistFill.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _artistsTypeId = json['artists_type_id'];
    _artistName = json['artist_name'];
    _subcategoryId = json['subcategory_id'];
    _subcategoryName = json['subcategory_name'];
    _genresId = json['genres_id'];
    _genresName = json['genres_name'];
    _stageComplisationId = json['stage_complisation_id'];
    _stageComplisationName = json['stage_complisation_name'];
    _venueId = json['venue_id'];
    _venueName = json['venue_name'];
    _introduction = json['introduction'];
    _intagramLink = json['intagram_link'];
    _intagramFollower = json['intagram_follower'];
    _facebookLink = json['facebook_link'];
    _facebookFollower = json['facebook_follower'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  num? _artistsTypeId;
  String? _artistName;
  String? _subcategoryId;
  String? _subcategoryName;
  String? _genresId;
  String? _genresName;
  dynamic _stageComplisationId;
  dynamic _stageComplisationName;
  String? _venueId;
  String? _venueName;
  String? _introduction;
  String? _intagramLink;
  String? _intagramFollower;
  String? _facebookLink;
  String? _facebookFollower;
  String? _createdAt;
  String? _updatedAt;
  artistFill copyWith({  num? id,
  num? userId,
  num? artistsTypeId,
  String? artistName,
  String? subcategoryId,
  String? subcategoryName,
  String? genresId,
  String? genresName,
  dynamic stageComplisationId,
  dynamic stageComplisationName,
  String? venueId,
  String? venueName,
  String? introduction,
  String? intagramLink,
  String? intagramFollower,
  String? facebookLink,
  String? facebookFollower,
  String? createdAt,
  String? updatedAt,
}) => artistFill(  id: id ?? _id,
  userId: userId ?? _userId,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  artistName: artistName ?? _artistName,
  subcategoryId: subcategoryId ?? _subcategoryId,
  subcategoryName: subcategoryName ?? _subcategoryName,
  genresId: genresId ?? _genresId,
  genresName: genresName ?? _genresName,
  stageComplisationId: stageComplisationId ?? _stageComplisationId,
  stageComplisationName: stageComplisationName ?? _stageComplisationName,
  venueId: venueId ?? _venueId,
  venueName: venueName ?? _venueName,
  introduction: introduction ?? _introduction,
  intagramLink: intagramLink ?? _intagramLink,
  intagramFollower: intagramFollower ?? _intagramFollower,
  facebookLink: facebookLink ?? _facebookLink,
  facebookFollower: facebookFollower ?? _facebookFollower,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get artistsTypeId => _artistsTypeId;
  String? get artistName => _artistName;
  String? get subcategoryId => _subcategoryId;
  String? get subcategoryName => _subcategoryName;
  String? get genresId => _genresId;
  String? get genresName => _genresName;
  dynamic get stageComplisationId => _stageComplisationId;
  dynamic get stageComplisationName => _stageComplisationName;
  String? get venueId => _venueId;
  String? get venueName => _venueName;
  String? get introduction => _introduction;
  String? get intagramLink => _intagramLink;
  String? get intagramFollower => _intagramFollower;
  String? get facebookLink => _facebookLink;
  String? get facebookFollower => _facebookFollower;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['artists_type_id'] = _artistsTypeId;
    map['artist_name'] = _artistName;
    map['subcategory_id'] = _subcategoryId;
    map['subcategory_name'] = _subcategoryName;
    map['genres_id'] = _genresId;
    map['genres_name'] = _genresName;
    map['stage_complisation_id'] = _stageComplisationId;
    map['stage_complisation_name'] = _stageComplisationName;
    map['venue_id'] = _venueId;
    map['venue_name'] = _venueName;
    map['introduction'] = _introduction;
    map['intagram_link'] = _intagramLink;
    map['intagram_follower'] = _intagramFollower;
    map['facebook_link'] = _facebookLink;
    map['facebook_follower'] = _facebookFollower;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
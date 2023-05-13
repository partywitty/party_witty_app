
class GetBookingDetailsM {
  GetBookingDetailsM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  GetBookingDetailsM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
GetBookingDetailsM copyWith({  bool? error,
  String? message,
  Data? data,
}) => GetBookingDetailsM(  error: error ?? _error,
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


class Data {
  Data({
      num? id, 
      num? artistId, 
      num? clubId, 
      String? bookDate, 
      String? bookSlot, 
      String? showStartTime, 
      String? showEndTime, 
      String? soundCheckTime, 
      num? noOfBreak, 
      String? formation, 
      String? genres, 
      num? mainCourse, 
      num? starter, 
      num? nonAlcoholicBeverages, 
      num? alcoholicBeverages, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _artistId = artistId;
    _clubId = clubId;
    _bookDate = bookDate;
    _bookSlot = bookSlot;
    _showStartTime = showStartTime;
    _showEndTime = showEndTime;
    _soundCheckTime = soundCheckTime;
    _noOfBreak = noOfBreak;
    _formation = formation;
    _genres = genres;
    _mainCourse = mainCourse;
    _starter = starter;
    _nonAlcoholicBeverages = nonAlcoholicBeverages;
    _alcoholicBeverages = alcoholicBeverages;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _artistId = json['artist_id'];
    _clubId = json['club_id'];
    _bookDate = json['book_date'];
    _bookSlot = json['book_slot'];
    _showStartTime = json['show_start_time'];
    _showEndTime = json['show_end_time'];
    _soundCheckTime = json['sound_check_time'];
    _noOfBreak = json['no_of_break'];
    _formation = json['formation'];
    _genres = json['genres'];
    _mainCourse = json['main_course'];
    _starter = json['starter'];
    _nonAlcoholicBeverages = json['non_alcoholic_beverages'];
    _alcoholicBeverages = json['alcoholic_beverages'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _artistId;
  num? _clubId;
  String? _bookDate;
  String? _bookSlot;
  String? _showStartTime;
  String? _showEndTime;
  String? _soundCheckTime;
  num? _noOfBreak;
  String? _formation;
  String? _genres;
  num? _mainCourse;
  num? _starter;
  num? _nonAlcoholicBeverages;
  num? _alcoholicBeverages;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  num? artistId,
  num? clubId,
  String? bookDate,
  String? bookSlot,
  String? showStartTime,
  String? showEndTime,
  String? soundCheckTime,
  num? noOfBreak,
  String? formation,
  String? genres,
  num? mainCourse,
  num? starter,
  num? nonAlcoholicBeverages,
  num? alcoholicBeverages,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  artistId: artistId ?? _artistId,
  clubId: clubId ?? _clubId,
  bookDate: bookDate ?? _bookDate,
  bookSlot: bookSlot ?? _bookSlot,
  showStartTime: showStartTime ?? _showStartTime,
  showEndTime: showEndTime ?? _showEndTime,
  soundCheckTime: soundCheckTime ?? _soundCheckTime,
  noOfBreak: noOfBreak ?? _noOfBreak,
  formation: formation ?? _formation,
  genres: genres ?? _genres,
  mainCourse: mainCourse ?? _mainCourse,
  starter: starter ?? _starter,
  nonAlcoholicBeverages: nonAlcoholicBeverages ?? _nonAlcoholicBeverages,
  alcoholicBeverages: alcoholicBeverages ?? _alcoholicBeverages,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get artistId => _artistId;
  num? get clubId => _clubId;
  String? get bookDate => _bookDate;
  String? get bookSlot => _bookSlot;
  String? get showStartTime => _showStartTime;
  String? get showEndTime => _showEndTime;
  String? get soundCheckTime => _soundCheckTime;
  num? get noOfBreak => _noOfBreak;
  String? get formation => _formation;
  String? get genres => _genres;
  num? get mainCourse => _mainCourse;
  num? get starter => _starter;
  num? get nonAlcoholicBeverages => _nonAlcoholicBeverages;
  num? get alcoholicBeverages => _alcoholicBeverages;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['artist_id'] = _artistId;
    map['club_id'] = _clubId;
    map['book_date'] = _bookDate;
    map['book_slot'] = _bookSlot;
    map['show_start_time'] = _showStartTime;
    map['show_end_time'] = _showEndTime;
    map['sound_check_time'] = _soundCheckTime;
    map['no_of_break'] = _noOfBreak;
    map['formation'] = _formation;
    map['genres'] = _genres;
    map['main_course'] = _mainCourse;
    map['starter'] = _starter;
    map['non_alcoholic_beverages'] = _nonAlcoholicBeverages;
    map['alcoholic_beverages'] = _alcoholicBeverages;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
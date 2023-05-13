/// error : false
/// message : "Get Event Successfully."
/// data : [{"id":1,"user_id":1,"event_name":"new year","event_type_id":1,"start_date":"2022-12-31","end_date":"2023-12-01","photo":"public/event_photo/1671102479.png","video":"public/event_video/1671102479.png","entry_fees":500,"artist_type":"party","artist_name":"test","created_at":"2022-12-15T11:07:59.000000Z","updated_at":"2022-12-15T11:07:59.000000Z"}]

class EventM {
  EventM({
      bool? error, 
      String? message, 
      List<EventData>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  EventM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(EventData.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<EventData>? _data;
EventM copyWith({  bool? error,
  String? message,
  List<EventData>? data,
}) => EventM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<EventData>? get data => _data;

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
/// user_id : 1
/// event_name : "new year"
/// event_type_id : 1
/// start_date : "2022-12-31"
/// end_date : "2023-12-01"
/// photo : "public/event_photo/1671102479.png"
/// video : "public/event_video/1671102479.png"
/// entry_fees : 500
/// artist_type : "party"
/// artist_name : "test"
/// created_at : "2022-12-15T11:07:59.000000Z"
/// updated_at : "2022-12-15T11:07:59.000000Z"

class EventData {
  EventData({
      num? id, 
      num? userId, 
      String? eventName, 
      num? eventTypeId, 
      String? startDate, 
      String? endDate, 
      String? photo, 
      String? video, 
      num? entryFees, 
      String? artistType, 
      String? artistName, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _eventName = eventName;
    _eventTypeId = eventTypeId;
    _startDate = startDate;
    _endDate = endDate;
    _photo = photo;
    _video = video;
    _entryFees = entryFees;
    _artistType = artistType;
    _artistName = artistName;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  EventData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _eventName = json['event_name'];
    _eventTypeId = json['event_type_id'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _photo = json['photo'];
    _video = json['video'];
    _entryFees = json['entry_fees'];
    _artistType = json['artist_type'];
    _artistName = json['artist_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _eventName;
  num? _eventTypeId;
  String? _startDate;
  String? _endDate;
  String? _photo;
  String? _video;
  num? _entryFees;
  String? _artistType;
  String? _artistName;
  String? _createdAt;
  String? _updatedAt;
  EventData copyWith({  num? id,
  num? userId,
  String? eventName,
  num? eventTypeId,
  String? startDate,
  String? endDate,
  String? photo,
  String? video,
  num? entryFees,
  String? artistType,
  String? artistName,
  String? createdAt,
  String? updatedAt,
}) => EventData(  id: id ?? _id,
  userId: userId ?? _userId,
  eventName: eventName ?? _eventName,
  eventTypeId: eventTypeId ?? _eventTypeId,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  photo: photo ?? _photo,
  video: video ?? _video,
  entryFees: entryFees ?? _entryFees,
  artistType: artistType ?? _artistType,
  artistName: artistName ?? _artistName,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get eventName => _eventName;
  num? get eventTypeId => _eventTypeId;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get photo => _photo;
  String? get video => _video;
  num? get entryFees => _entryFees;
  String? get artistType => _artistType;
  String? get artistName => _artistName;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['event_name'] = _eventName;
    map['event_type_id'] = _eventTypeId;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['photo'] = _photo;
    map['video'] = _video;
    map['entry_fees'] = _entryFees;
    map['artist_type'] = _artistType;
    map['artist_name'] = _artistName;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
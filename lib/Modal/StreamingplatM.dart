
class StreamingplatM {
  StreamingplatM({
      bool? error, 
      String? message,
    streamData? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  StreamingplatM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? streamData.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  streamData? _data;
StreamingplatM copyWith({  bool? error,
  String? message,
  streamData? data,
}) => StreamingplatM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  streamData? get data => _data;

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

class streamData {
  streamData({
      num? id, 
      num? userId, 
      dynamic filePath, 
      dynamic perfomedAt, 
      String? spotifyUrl, 
      String? amazonPrime, 
      String? jioSavan, 
      String? appleMusic, 
      String? tidel, 
      String? deezer, 
      String? pandoora, 
      String? qubon, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _filePath = filePath;
    _perfomedAt = perfomedAt;
    _spotifyUrl = spotifyUrl;
    _amazonPrime = amazonPrime;
    _jioSavan = jioSavan;
    _appleMusic = appleMusic;
    _tidel = tidel;
    _deezer = deezer;
    _pandoora = pandoora;
    _qubon = qubon;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  streamData.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _filePath = json['file_path'];
    _perfomedAt = json['perfomed_at'];
    _spotifyUrl = json['spotify_url'];
    _amazonPrime = json['amazon_prime'];
    _jioSavan = json['jio_savan'];
    _appleMusic = json['apple_music'];
    _tidel = json['tidel'];
    _deezer = json['deezer'];
    _pandoora = json['pandoora'];
    _qubon = json['qubon'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  dynamic _filePath;
  dynamic _perfomedAt;
  String? _spotifyUrl;
  String? _amazonPrime;
  String? _jioSavan;
  String? _appleMusic;
  String? _tidel;
  String? _deezer;
  String? _pandoora;
  String? _qubon;
  String? _createdAt;
  String? _updatedAt;
  streamData copyWith({  num? id,
  num? userId,
  dynamic filePath,
  dynamic perfomedAt,
  String? spotifyUrl,
  String? amazonPrime,
  String? jioSavan,
  String? appleMusic,
  String? tidel,
  String? deezer,
  String? pandoora,
  String? qubon,
  String? createdAt,
  String? updatedAt,
}) => streamData(  id: id ?? _id,
  userId: userId ?? _userId,
  filePath: filePath ?? _filePath,
  perfomedAt: perfomedAt ?? _perfomedAt,
  spotifyUrl: spotifyUrl ?? _spotifyUrl,
  amazonPrime: amazonPrime ?? _amazonPrime,
  jioSavan: jioSavan ?? _jioSavan,
  appleMusic: appleMusic ?? _appleMusic,
  tidel: tidel ?? _tidel,
  deezer: deezer ?? _deezer,
  pandoora: pandoora ?? _pandoora,
  qubon: qubon ?? _qubon,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  dynamic get filePath => _filePath;
  dynamic get perfomedAt => _perfomedAt;
  String? get spotifyUrl => _spotifyUrl;
  String? get amazonPrime => _amazonPrime;
  String? get jioSavan => _jioSavan;
  String? get appleMusic => _appleMusic;
  String? get tidel => _tidel;
  String? get deezer => _deezer;
  String? get pandoora => _pandoora;
  String? get qubon => _qubon;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['file_path'] = _filePath;
    map['perfomed_at'] = _perfomedAt;
    map['spotify_url'] = _spotifyUrl;
    map['amazon_prime'] = _amazonPrime;
    map['jio_savan'] = _jioSavan;
    map['apple_music'] = _appleMusic;
    map['tidel'] = _tidel;
    map['deezer'] = _deezer;
    map['pandoora'] = _pandoora;
    map['qubon'] = _qubon;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
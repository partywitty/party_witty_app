
class InstaDetailsM {
  InstaDetailsM({
      bool? error, 
      String? message,
    instaData? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  InstaDetailsM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? instaData.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  instaData? _data;
InstaDetailsM copyWith({  bool? error,
  String? message,
  instaData? data,
}) => InstaDetailsM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  instaData? get data => _data;

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


class instaData {
  instaData({
      String? intagramLink, 
      String? intagramFollower, 
      String? facebookLink, 
      String? facebookFollower,}){
    _intagramLink = intagramLink;
    _intagramFollower = intagramFollower;
    _facebookLink = facebookLink;
    _facebookFollower = facebookFollower;
}

  instaData.fromJson(dynamic json) {
    _intagramLink = json['intagram_link'];
    _intagramFollower = json['intagram_follower'];
    _facebookLink = json['facebook_link'];
    _facebookFollower = json['facebook_follower'];
  }
  String? _intagramLink;
  String? _intagramFollower;
  String? _facebookLink;
  String? _facebookFollower;
  instaData copyWith({  String? intagramLink,
  String? intagramFollower,
  String? facebookLink,
  String? facebookFollower,
}) => instaData(  intagramLink: intagramLink ?? _intagramLink,
  intagramFollower: intagramFollower ?? _intagramFollower,
  facebookLink: facebookLink ?? _facebookLink,
  facebookFollower: facebookFollower ?? _facebookFollower,
);
  String? get intagramLink => _intagramLink;
  String? get intagramFollower => _intagramFollower;
  String? get facebookLink => _facebookLink;
  String? get facebookFollower => _facebookFollower;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['intagram_link'] = _intagramLink;
    map['intagram_follower'] = _intagramFollower;
    map['facebook_link'] = _facebookLink;
    map['facebook_follower'] = _facebookFollower;
    return map;
  }

}

class ArtistProfileDetails {
  ArtistProfileDetails({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  ArtistProfileDetails.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
ArtistProfileDetails copyWith({  bool? error,
  String? message,
  Data? data,
}) => ArtistProfileDetails(  error: error ?? _error,
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
      User? user, 
      Profiles? profiles, 
      List<Otherprofiles>? otherprofiles, 
      CoverPhoto? coverPhoto, 
      ProfilePhoto? profilePhoto, 
      List<PhotographsProfile>? photographs,
      List<VideoProfile>? video,
      List<WithCelebs>? withCelebs, 
      List<PhotoWithBrands>? photoWithBrands, 
      List<VideoWithBrand>? videoWithBrand, 
      List<PhotoWithBands>? photoWithBands, 
      List<VideoWithBands>? videoWithBands, 
      List<PhotoWithClub>? photoWithClub, 
      List<VideoWithClub>? videoWithClub, 
      List<AudioCoverSong>? audioCoverSong, 
      List<VideoCoverSong>? videoCoverSong, 
      List<OriganalVideoSong>? origanalVideoSong, 
      List<OrignalAudioSong>? orignalAudioSong, 
      Address? address, 
      Bank? bank, 
      List<dynamic>? orignalSong, 
      List<CityPrice>? cityPrice, 
      List<Subcategories>? subcategories, 
      List<Languages>? languages, 
      List<GenresProfile>? genres,
      List<Venue>? venue, 
      ManagerDetail? managerDetail, 
      List<BudgetsProfile>? budgets,}){
    _user = user;
    _profiles = profiles;
    _otherprofiles = otherprofiles;
    _coverPhoto = coverPhoto;
    _profilePhoto = profilePhoto;
    _photographs = photographs;
    _video = video;
    _withCelebs = withCelebs;
    _photoWithBrands = photoWithBrands;
    _videoWithBrand = videoWithBrand;
    _photoWithBands = photoWithBands;
    _videoWithBands = videoWithBands;
    _photoWithClub = photoWithClub;
    _videoWithClub = videoWithClub;
    _audioCoverSong = audioCoverSong;
    _videoCoverSong = videoCoverSong;
    _origanalVideoSong = origanalVideoSong;
    _orignalAudioSong = orignalAudioSong;
    _address = address;
    _bank = bank;
    _orignalSong = orignalSong;
    _cityPrice = cityPrice;
    _subcategories = subcategories;
    _languages = languages;
    _genres = genres;
    _venue = venue;
    _managerDetail = managerDetail;
    _budgets = budgets;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _profiles = json['profiles'] != null ? Profiles.fromJson(json['profiles']) : null;
    if (json['otherprofiles'] != null) {
      _otherprofiles = [];
      json['otherprofiles'].forEach((v) {
        _otherprofiles?.add(Otherprofiles.fromJson(v));
      });
    }
    _coverPhoto = json['cover_photo'] != null ? CoverPhoto.fromJson(json['cover_photo']) : null;
    _profilePhoto = json['profile_photo'] != null ? ProfilePhoto.fromJson(json['profile_photo']) : null;
    if (json['photographs'] != null) {
      _photographs = [];
      json['photographs'].forEach((v) {
        _photographs?.add(PhotographsProfile.fromJson(v));
      });
    }
    if (json['video'] != null) {
      _video = [];
      json['video'].forEach((v) {
        _video?.add(VideoProfile.fromJson(v));
      });
    }
    if (json['with_celebs'] != null) {
      _withCelebs = [];
      json['with_celebs'].forEach((v) {
        _withCelebs?.add(WithCelebs.fromJson(v));
      });
    }
    if (json['photo_with_brands'] != null) {
      _photoWithBrands = [];
      json['photo_with_brands'].forEach((v) {
        _photoWithBrands?.add(PhotoWithBrands.fromJson(v));
      });
    }
    if (json['video_with_brand'] != null) {
      _videoWithBrand = [];
      json['video_with_brand'].forEach((v) {
        _videoWithBrand?.add(VideoWithBrand.fromJson(v));
      });
    }
    if (json['photo_with_bands'] != null) {
      _photoWithBands = [];
      json['photo_with_bands'].forEach((v) {
        _photoWithBands?.add(PhotoWithBands.fromJson(v));
      });
    }
    if (json['video_with_bands'] != null) {
      _videoWithBands = [];
      json['video_with_bands'].forEach((v) {
        _videoWithBands?.add(VideoWithBands.fromJson(v));
      });
    }
    if (json['photo_with_club'] != null) {
      _photoWithClub = [];
      json['photo_with_club'].forEach((v) {
        _photoWithClub?.add(PhotoWithClub.fromJson(v));
      });
    }
    if (json['video_with_club'] != null) {
      _videoWithClub = [];
      json['video_with_club'].forEach((v) {
        _videoWithClub?.add(VideoWithClub.fromJson(v));
      });
    }
    if (json['audio_cover_song'] != null) {
      _audioCoverSong = [];
      json['audio_cover_song'].forEach((v) {
        _audioCoverSong?.add(AudioCoverSong.fromJson(v));
      });
    }
    if (json['video_cover_song'] != null) {
      _videoCoverSong = [];
      json['video_cover_song'].forEach((v) {
        _videoCoverSong?.add(VideoCoverSong.fromJson(v));
      });
    }
    if (json['origanal_video_song'] != null) {
      _origanalVideoSong = [];
      json['origanal_video_song'].forEach((v) {
        _origanalVideoSong?.add(OriganalVideoSong.fromJson(v));
      });
    }
    if (json['orignal_audio_song'] != null) {
      _orignalAudioSong = [];
      json['orignal_audio_song'].forEach((v) {
        _orignalAudioSong?.add(OrignalAudioSong.fromJson(v));
      });
    }
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    if (json['OrignalSong'] != null) {
      _orignalSong = [];
      json['OrignalSong'].forEach((v) {
        _orignalSong?.add(v);
      });
    }
    if (json['CityPrice'] != null) {
      _cityPrice = [];
      json['CityPrice'].forEach((v) {
        _cityPrice?.add(CityPrice.fromJson(v));
      });
    }
    if (json['Subcategories'] != null) {
      _subcategories = [];
      json['Subcategories'].forEach((v) {
        _subcategories?.add(Subcategories.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      _languages = [];
      json['languages'].forEach((v) {
        _languages?.add(Languages.fromJson(v));
      });
    }
    if (json['Genres'] != null) {
      _genres = [];
      json['Genres'].forEach((v) {
        _genres?.add(GenresProfile.fromJson(v));
      });
    }
    if (json['Venue'] != null) {
      _venue = [];
      json['Venue'].forEach((v) {
        _venue?.add(Venue.fromJson(v));
      });
    }
    _managerDetail = json['ManagerDetail'] != null ? ManagerDetail.fromJson(json['ManagerDetail']) : null;
    if (json['budgets'] != null) {
      _budgets = [];
      json['budgets'].forEach((v) {
        _budgets?.add(BudgetsProfile.fromJson(v));
      });
    }
  }
  User? _user;
  Profiles? _profiles;
  List<Otherprofiles>? _otherprofiles;
  CoverPhoto? _coverPhoto;
  ProfilePhoto? _profilePhoto;
  List<PhotographsProfile>? _photographs;
  List<VideoProfile>? _video;
  List<WithCelebs>? _withCelebs;
  List<PhotoWithBrands>? _photoWithBrands;
  List<VideoWithBrand>? _videoWithBrand;
  List<PhotoWithBands>? _photoWithBands;
  List<VideoWithBands>? _videoWithBands;
  List<PhotoWithClub>? _photoWithClub;
  List<VideoWithClub>? _videoWithClub;
  List<AudioCoverSong>? _audioCoverSong;
  List<VideoCoverSong>? _videoCoverSong;
  List<OriganalVideoSong>? _origanalVideoSong;
  List<OrignalAudioSong>? _orignalAudioSong;
  Address? _address;
  Bank? _bank;
  List<dynamic>? _orignalSong;
  List<CityPrice>? _cityPrice;
  List<Subcategories>? _subcategories;
  List<Languages>? _languages;
  List<GenresProfile>? _genres;
  List<Venue>? _venue;
  ManagerDetail? _managerDetail;
  List<BudgetsProfile>? _budgets;
Data copyWith({  User? user,
  Profiles? profiles,
  List<Otherprofiles>? otherprofiles,
  CoverPhoto? coverPhoto,
  ProfilePhoto? profilePhoto,
  List<PhotographsProfile>? photographs,
  List<VideoProfile>? video,
  List<WithCelebs>? withCelebs,
  List<PhotoWithBrands>? photoWithBrands,
  List<VideoWithBrand>? videoWithBrand,
  List<PhotoWithBands>? photoWithBands,
  List<VideoWithBands>? videoWithBands,
  List<PhotoWithClub>? photoWithClub,
  List<VideoWithClub>? videoWithClub,
  List<AudioCoverSong>? audioCoverSong,
  List<VideoCoverSong>? videoCoverSong,
  List<OriganalVideoSong>? origanalVideoSong,
  List<OrignalAudioSong>? orignalAudioSong,
  Address? address,
  Bank? bank,
  List<dynamic>? orignalSong,
  List<CityPrice>? cityPrice,
  List<Subcategories>? subcategories,
  List<Languages>? languages,
  List<GenresProfile>? genres,
  List<Venue>? venue,
  ManagerDetail? managerDetail,
  List<BudgetsProfile>? budgets,
}) => Data(  user: user ?? _user,
  profiles: profiles ?? _profiles,
  otherprofiles: otherprofiles ?? _otherprofiles,
  coverPhoto: coverPhoto ?? _coverPhoto,
  profilePhoto: profilePhoto ?? _profilePhoto,
  photographs: photographs ?? _photographs,
  video: video ?? _video,
  withCelebs: withCelebs ?? _withCelebs,
  photoWithBrands: photoWithBrands ?? _photoWithBrands,
  videoWithBrand: videoWithBrand ?? _videoWithBrand,
  photoWithBands: photoWithBands ?? _photoWithBands,
  videoWithBands: videoWithBands ?? _videoWithBands,
  photoWithClub: photoWithClub ?? _photoWithClub,
  videoWithClub: videoWithClub ?? _videoWithClub,
  audioCoverSong: audioCoverSong ?? _audioCoverSong,
  videoCoverSong: videoCoverSong ?? _videoCoverSong,
  origanalVideoSong: origanalVideoSong ?? _origanalVideoSong,
  orignalAudioSong: orignalAudioSong ?? _orignalAudioSong,
  address: address ?? _address,
  bank: bank ?? _bank,
  orignalSong: orignalSong ?? _orignalSong,
  cityPrice: cityPrice ?? _cityPrice,
  subcategories: subcategories ?? _subcategories,
  languages: languages ?? _languages,
  genres: genres ?? _genres,
  venue: venue ?? _venue,
  managerDetail: managerDetail ?? _managerDetail,
  budgets: budgets ?? _budgets,
);
  User? get user => _user;
  Profiles? get profiles => _profiles;
  List<Otherprofiles>? get otherprofiles => _otherprofiles;
  CoverPhoto? get coverPhoto => _coverPhoto;
  ProfilePhoto? get profilePhoto => _profilePhoto;
  List<PhotographsProfile>? get photographs => _photographs;
  List<VideoProfile>? get video => _video;
  List<WithCelebs>? get withCelebs => _withCelebs;
  List<PhotoWithBrands>? get photoWithBrands => _photoWithBrands;
  List<VideoWithBrand>? get videoWithBrand => _videoWithBrand;
  List<PhotoWithBands>? get photoWithBands => _photoWithBands;
  List<VideoWithBands>? get videoWithBands => _videoWithBands;
  List<PhotoWithClub>? get photoWithClub => _photoWithClub;
  List<VideoWithClub>? get videoWithClub => _videoWithClub;
  List<AudioCoverSong>? get audioCoverSong => _audioCoverSong;
  List<VideoCoverSong>? get videoCoverSong => _videoCoverSong;
  List<OriganalVideoSong>? get origanalVideoSong => _origanalVideoSong;
  List<OrignalAudioSong>? get orignalAudioSong => _orignalAudioSong;
  Address? get address => _address;
  Bank? get bank => _bank;
  List<dynamic>? get orignalSong => _orignalSong;
  List<CityPrice>? get cityPrice => _cityPrice;
  List<Subcategories>? get subcategories => _subcategories;
  List<Languages>? get languages => _languages;
  List<GenresProfile>? get genres => _genres;
  List<Venue>? get venue => _venue;
  ManagerDetail? get managerDetail => _managerDetail;
  List<BudgetsProfile>? get budgets => _budgets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_profiles != null) {
      map['profiles'] = _profiles?.toJson();
    }
    if (_otherprofiles != null) {
      map['otherprofiles'] = _otherprofiles?.map((v) => v.toJson()).toList();
    }
    if (_coverPhoto != null) {
      map['cover_photo'] = _coverPhoto?.toJson();
    }
    if (_profilePhoto != null) {
      map['profile_photo'] = _profilePhoto?.toJson();
    }
    if (_photographs != null) {
      map['photographs'] = _photographs?.map((v) => v.toJson()).toList();
    }
    if (_video != null) {
      map['video'] = _video?.map((v) => v.toJson()).toList();
    }
    if (_withCelebs != null) {
      map['with_celebs'] = _withCelebs?.map((v) => v.toJson()).toList();
    }
    if (_photoWithBrands != null) {
      map['photo_with_brands'] = _photoWithBrands?.map((v) => v.toJson()).toList();
    }
    if (_videoWithBrand != null) {
      map['video_with_brand'] = _videoWithBrand?.map((v) => v.toJson()).toList();
    }
    if (_photoWithBands != null) {
      map['photo_with_bands'] = _photoWithBands?.map((v) => v.toJson()).toList();
    }
    if (_videoWithBands != null) {
      map['video_with_bands'] = _videoWithBands?.map((v) => v.toJson()).toList();
    }
    if (_photoWithClub != null) {
      map['photo_with_club'] = _photoWithClub?.map((v) => v.toJson()).toList();
    }
    if (_videoWithClub != null) {
      map['video_with_club'] = _videoWithClub?.map((v) => v.toJson()).toList();
    }
    if (_audioCoverSong != null) {
      map['audio_cover_song'] = _audioCoverSong?.map((v) => v.toJson()).toList();
    }
    if (_videoCoverSong != null) {
      map['video_cover_song'] = _videoCoverSong?.map((v) => v.toJson()).toList();
    }
    if (_origanalVideoSong != null) {
      map['origanal_video_song'] = _origanalVideoSong?.map((v) => v.toJson()).toList();
    }
    if (_orignalAudioSong != null) {
      map['orignal_audio_song'] = _orignalAudioSong?.map((v) => v.toJson()).toList();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_bank != null) {
      map['bank'] = _bank?.toJson();
    }
    if (_orignalSong != null) {
      map['OrignalSong'] = _orignalSong?.map((v) => v.toJson()).toList();
    }
    if (_cityPrice != null) {
      map['CityPrice'] = _cityPrice?.map((v) => v.toJson()).toList();
    }
    if (_subcategories != null) {
      map['Subcategories'] = _subcategories?.map((v) => v.toJson()).toList();
    }
    if (_languages != null) {
      map['languages'] = _languages?.map((v) => v.toJson()).toList();
    }
    if (_genres != null) {
      map['Genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    if (_venue != null) {
      map['Venue'] = _venue?.map((v) => v.toJson()).toList();
    }
    if (_managerDetail != null) {
      map['ManagerDetail'] = _managerDetail?.toJson();
    }
    if (_budgets != null) {
      map['budgets'] = _budgets?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class BudgetsProfile {
  BudgetsProfile({
      num? id, 
      String? price, 
      String? intrumentIds, 
      String? venueName, 
      String? subcategoryName, 
      String? intrumentName,}){
    _id = id;
    _price = price;
    _intrumentIds = intrumentIds;
    _venueName = venueName;
    _subcategoryName = subcategoryName;
    _intrumentName = intrumentName;
}

  BudgetsProfile.fromJson(dynamic json) {
    _id = json['id'];
    _price = json['price'];
    _intrumentIds = json['intrument_ids'];
    _venueName = json['venue_name'];
    _subcategoryName = json['subcategory_name'];
    _intrumentName = json['intrument_name'];
  }
  num? _id;
  String? _price;
  String? _intrumentIds;
  String? _venueName;
  String? _subcategoryName;
  String? _intrumentName;
  BudgetsProfile copyWith({  num? id,
  String? price,
  String? intrumentIds,
  String? venueName,
  String? subcategoryName,
  String? intrumentName,
}) => BudgetsProfile(  id: id ?? _id,
  price: price ?? _price,
  intrumentIds: intrumentIds ?? _intrumentIds,
  venueName: venueName ?? _venueName,
  subcategoryName: subcategoryName ?? _subcategoryName,
  intrumentName: intrumentName ?? _intrumentName,
);
  num? get id => _id;
  String? get price => _price;
  String? get intrumentIds => _intrumentIds;
  String? get venueName => _venueName;
  String? get subcategoryName => _subcategoryName;
  String? get intrumentName => _intrumentName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['price'] = _price;
    map['intrument_ids'] = _intrumentIds;
    map['venue_name'] = _venueName;
    map['subcategory_name'] = _subcategoryName;
    map['intrument_name'] = _intrumentName;
    return map;
  }

}

class ManagerDetail {
  ManagerDetail({
      num? id, 
      String? signature, 
      String? name, 
      String? contactNo,}){
    _id = id;
    _signature = signature;
    _name = name;
    _contactNo = contactNo;
}

  ManagerDetail.fromJson(dynamic json) {
    _id = json['id'];
    _signature = json['signature'];
    _name = json['name'];
    _contactNo = json['contact_no'];
  }
  num? _id;
  String? _signature;
  String? _name;
  String? _contactNo;
ManagerDetail copyWith({  num? id,
  String? signature,
  String? name,
  String? contactNo,
}) => ManagerDetail(  id: id ?? _id,
  signature: signature ?? _signature,
  name: name ?? _name,
  contactNo: contactNo ?? _contactNo,
);
  num? get id => _id;
  String? get signature => _signature;
  String? get name => _name;
  String? get contactNo => _contactNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['signature'] = _signature;
    map['name'] = _name;
    map['contact_no'] = _contactNo;
    return map;
  }

}

class Venue {
  Venue({
      num? id, 
      String? name, 
      dynamic image,}){
    _id = id;
    _name = name;
    _image = image;
}

  Venue.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  dynamic _image;
Venue copyWith({  num? id,
  String? name,
  dynamic image,
}) => Venue(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}

class GenresProfile {
  GenresProfile({
      num? id, 
      String? name, 
      dynamic image,}){
    _id = id;
    _name = name;
    _image = image;
}

  GenresProfile.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  GenresProfile copyWith({  num? id,
  String? name,
  dynamic image,
}) => GenresProfile(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}

class Languages {
  Languages({
      num? id, 
      String? language,}){
    _id = id;
    _language = language;
}

  Languages.fromJson(dynamic json) {
    _id = json['id'];
    _language = json['language'];
  }
  num? _id;
  String? _language;
Languages copyWith({  num? id,
  String? language,
}) => Languages(  id: id ?? _id,
  language: language ?? _language,
);
  num? get id => _id;
  String? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['language'] = _language;
    return map;
  }

}

class Subcategories {
  Subcategories({
      num? subcategoryId, 
      String? name,}){
    _subcategoryId = subcategoryId;
    _name = name;
}

  Subcategories.fromJson(dynamic json) {
    _subcategoryId = json['subcategory_id'];
    _name = json['name'];
  }
  num? _subcategoryId;
  String? _name;
Subcategories copyWith({  num? subcategoryId,
  String? name,
}) => Subcategories(  subcategoryId: subcategoryId ?? _subcategoryId,
  name: name ?? _name,
);
  num? get subcategoryId => _subcategoryId;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subcategory_id'] = _subcategoryId;
    map['name'] = _name;
    return map;
  }

}

class CityPrice {
  CityPrice({
      num? id, 
      String? cityId, 
      String? price, 
      String? cityName,}){
    _id = id;
    _cityId = cityId;
    _price = price;
    _cityName = cityName;
}

  CityPrice.fromJson(dynamic json) {
    _id = json['id'];
    _cityId = json['city_id'];
    _price = json['price'];
    _cityName = json['city_name'];
  }
  num? _id;
  String? _cityId;
  String? _price;
  String? _cityName;
CityPrice copyWith({  num? id,
  String? cityId,
  String? price,
  String? cityName,
}) => CityPrice(  id: id ?? _id,
  cityId: cityId ?? _cityId,
  price: price ?? _price,
  cityName: cityName ?? _cityName,
);
  num? get id => _id;
  String? get cityId => _cityId;
  String? get price => _price;
  String? get cityName => _cityName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['city_id'] = _cityId;
    map['price'] = _price;
    map['city_name'] = _cityName;
    return map;
  }

}

class Bank {
  Bank({
      num? id, 
      String? bankname, 
      String? ifsccode, 
      String? branch, 
      String? acountNumber, 
      String? panName, 
      String? panNumber, 
      String? cancelChaque,}){
    _id = id;
    _bankname = bankname;
    _ifsccode = ifsccode;
    _branch = branch;
    _acountNumber = acountNumber;
    _panName = panName;
    _panNumber = panNumber;
    _cancelChaque = cancelChaque;
}

  Bank.fromJson(dynamic json) {
    _id = json['id'];
    _bankname = json['bankname'];
    _ifsccode = json['ifsccode'];
    _branch = json['branch'];
    _acountNumber = json['acount_number'];
    _panName = json['pan_name'];
    _panNumber = json['pan_number'];
    _cancelChaque = json['cancel_chaque'];
  }
  num? _id;
  String? _bankname;
  String? _ifsccode;
  String? _branch;
  String? _acountNumber;
  String? _panName;
  String? _panNumber;
  String? _cancelChaque;
Bank copyWith({  num? id,
  String? bankname,
  String? ifsccode,
  String? branch,
  String? acountNumber,
  String? panName,
  String? panNumber,
  String? cancelChaque,
}) => Bank(  id: id ?? _id,
  bankname: bankname ?? _bankname,
  ifsccode: ifsccode ?? _ifsccode,
  branch: branch ?? _branch,
  acountNumber: acountNumber ?? _acountNumber,
  panName: panName ?? _panName,
  panNumber: panNumber ?? _panNumber,
  cancelChaque: cancelChaque ?? _cancelChaque,
);
  num? get id => _id;
  String? get bankname => _bankname;
  String? get ifsccode => _ifsccode;
  String? get branch => _branch;
  String? get acountNumber => _acountNumber;
  String? get panName => _panName;
  String? get panNumber => _panNumber;
  String? get cancelChaque => _cancelChaque;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bankname'] = _bankname;
    map['ifsccode'] = _ifsccode;
    map['branch'] = _branch;
    map['acount_number'] = _acountNumber;
    map['pan_name'] = _panName;
    map['pan_number'] = _panNumber;
    map['cancel_chaque'] = _cancelChaque;
    return map;
  }

}

class Address {
  Address({
      num? id, 
      String? flatNo, 
      String? landmark, 
      String? state, 
      String? city, 
      String? pincode, 
      String? idProof, 
      dynamic addressProof, 
      String? aadharNumber,}){
    _id = id;
    _flatNo = flatNo;
    _landmark = landmark;
    _state = state;
    _city = city;
    _pincode = pincode;
    _idProof = idProof;
    _addressProof = addressProof;
    _aadharNumber = aadharNumber;
}

  Address.fromJson(dynamic json) {
    _id = json['id'];
    _flatNo = json['flat_no'];
    _landmark = json['landmark'];
    _state = json['state'];
    _city = json['city'];
    _pincode = json['pincode'];
    _idProof = json['id_proof'];
    _addressProof = json['address_proof'];
    _aadharNumber = json['aadhar_number'];
  }
  num? _id;
  String? _flatNo;
  String? _landmark;
  String? _state;
  String? _city;
  String? _pincode;
  String? _idProof;
  dynamic _addressProof;
  String? _aadharNumber;
Address copyWith({  num? id,
  String? flatNo,
  String? landmark,
  String? state,
  String? city,
  String? pincode,
  String? idProof,
  dynamic addressProof,
  String? aadharNumber,
}) => Address(  id: id ?? _id,
  flatNo: flatNo ?? _flatNo,
  landmark: landmark ?? _landmark,
  state: state ?? _state,
  city: city ?? _city,
  pincode: pincode ?? _pincode,
  idProof: idProof ?? _idProof,
  addressProof: addressProof ?? _addressProof,
  aadharNumber: aadharNumber ?? _aadharNumber,
);
  num? get id => _id;
  String? get flatNo => _flatNo;
  String? get landmark => _landmark;
  String? get state => _state;
  String? get city => _city;
  String? get pincode => _pincode;
  String? get idProof => _idProof;
  dynamic get addressProof => _addressProof;
  String? get aadharNumber => _aadharNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['flat_no'] = _flatNo;
    map['landmark'] = _landmark;
    map['state'] = _state;
    map['city'] = _city;
    map['pincode'] = _pincode;
    map['id_proof'] = _idProof;
    map['address_proof'] = _addressProof;
    map['aadhar_number'] = _aadharNumber;
    return map;
  }

}

class OrignalAudioSong {
  OrignalAudioSong({
      num? id, 
      String? filePath, 
      String? location, 
      String? caption, 
      String? withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  OrignalAudioSong.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  String? _caption;
  String? _withPhoto;
  String? _type;
OrignalAudioSong copyWith({  num? id,
  String? filePath,
  String? location,
  String? caption,
  String? withPhoto,
  String? type,
}) => OrignalAudioSong(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  String? get caption => _caption;
  String? get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class OriganalVideoSong {
  OriganalVideoSong({
      num? id, 
      String? filePath, 
      dynamic location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  OriganalVideoSong.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  dynamic _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
OriganalVideoSong copyWith({  num? id,
  String? filePath,
  dynamic location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => OriganalVideoSong(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  dynamic get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class VideoCoverSong {
  VideoCoverSong({
      num? id, 
      String? filePath, 
      dynamic location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  VideoCoverSong.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  dynamic _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
VideoCoverSong copyWith({  num? id,
  String? filePath,
  dynamic location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => VideoCoverSong(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  dynamic get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class AudioCoverSong {
  AudioCoverSong({
      num? id, 
      String? filePath, 
      dynamic location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  AudioCoverSong.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  dynamic _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
AudioCoverSong copyWith({  num? id,
  String? filePath,
  dynamic location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => AudioCoverSong(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  dynamic get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class VideoWithClub {
  VideoWithClub({
      num? id, 
      String? filePath, 
      dynamic location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  VideoWithClub.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  dynamic _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
VideoWithClub copyWith({  num? id,
  String? filePath,
  dynamic location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => VideoWithClub(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  dynamic get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class PhotoWithClub {
  PhotoWithClub({
      num? id, 
      String? filePath, 
      String? location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  PhotoWithClub.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
PhotoWithClub copyWith({  num? id,
  String? filePath,
  String? location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => PhotoWithClub(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class VideoWithBands {
  VideoWithBands({
      num? id, 
      String? filePath, 
      dynamic location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  VideoWithBands.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  dynamic _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
VideoWithBands copyWith({  num? id,
  String? filePath,
  dynamic location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => VideoWithBands(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  dynamic get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class PhotoWithBands {
  PhotoWithBands({
      num? id, 
      String? filePath, 
      String? location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  PhotoWithBands.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
PhotoWithBands copyWith({  num? id,
  String? filePath,
  String? location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => PhotoWithBands(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class VideoWithBrand {
  VideoWithBrand({
      num? id, 
      String? filePath, 
      String? location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  VideoWithBrand.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
VideoWithBrand copyWith({  num? id,
  String? filePath,
  String? location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => VideoWithBrand(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class PhotoWithBrands {
  PhotoWithBrands({
      num? id, 
      String? filePath, 
      String? location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  PhotoWithBrands.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
PhotoWithBrands copyWith({  num? id,
  String? filePath,
  String? location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => PhotoWithBrands(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class WithCelebs {
  WithCelebs({
      num? id, 
      String? filePath, 
      String? location, 
      String? caption, 
      String? withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  WithCelebs.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  String? _caption;
  String? _withPhoto;
  String? _type;
WithCelebs copyWith({  num? id,
  String? filePath,
  String? location,
  String? caption,
  String? withPhoto,
  String? type,
}) => WithCelebs(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  String? get caption => _caption;
  String? get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class VideoProfile {
  VideoProfile({
      num? id, 
      String? filePath, 
      dynamic location, 
      dynamic caption, 
      String? withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  VideoProfile.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  dynamic _location;
  dynamic _caption;
  String? _withPhoto;
  String? _type;
  VideoProfile copyWith({  num? id,
  String? filePath,
  dynamic location,
  dynamic caption,
  String? withPhoto,
  String? type,
}) => VideoProfile(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  dynamic get location => _location;
  dynamic get caption => _caption;
  String? get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class PhotographsProfile {
  PhotographsProfile({
      num? id, 
      String? filePath, 
      dynamic location, 
      dynamic caption, 
      String? withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  PhotographsProfile.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  dynamic _location;
  dynamic _caption;
  String? _withPhoto;
  String? _type;
  PhotographsProfile copyWith({  num? id,
  String? filePath,
  dynamic location,
  dynamic caption,
  String? withPhoto,
  String? type,
}) => PhotographsProfile(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  dynamic get location => _location;
  dynamic get caption => _caption;
  String? get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class ProfilePhoto {
  ProfilePhoto({
      num? id, 
      String? filePath, 
      String? location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  ProfilePhoto.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
ProfilePhoto copyWith({  num? id,
  String? filePath,
  String? location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => ProfilePhoto(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class CoverPhoto {
  CoverPhoto({
      num? id, 
      String? filePath, 
      String? location, 
      dynamic caption, 
      dynamic withPhoto, 
      String? type,}){
    _id = id;
    _filePath = filePath;
    _location = location;
    _caption = caption;
    _withPhoto = withPhoto;
    _type = type;
}

  CoverPhoto.fromJson(dynamic json) {
    _id = json['id'];
    _filePath = json['file_path'];
    _location = json['location'];
    _caption = json['caption'];
    _withPhoto = json['with_photo'];
    _type = json['type'];
  }
  num? _id;
  String? _filePath;
  String? _location;
  dynamic _caption;
  dynamic _withPhoto;
  String? _type;
CoverPhoto copyWith({  num? id,
  String? filePath,
  String? location,
  dynamic caption,
  dynamic withPhoto,
  String? type,
}) => CoverPhoto(  id: id ?? _id,
  filePath: filePath ?? _filePath,
  location: location ?? _location,
  caption: caption ?? _caption,
  withPhoto: withPhoto ?? _withPhoto,
  type: type ?? _type,
);
  num? get id => _id;
  String? get filePath => _filePath;
  String? get location => _location;
  dynamic get caption => _caption;
  dynamic get withPhoto => _withPhoto;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['file_path'] = _filePath;
    map['location'] = _location;
    map['caption'] = _caption;
    map['with_photo'] = _withPhoto;
    map['type'] = _type;
    return map;
  }

}

class Otherprofiles {
  Otherprofiles({
      num? profileId, 
      String? categoryName,}){
    _profileId = profileId;
    _categoryName = categoryName;
}

  Otherprofiles.fromJson(dynamic json) {
    _profileId = json['profile_id'];
    _categoryName = json['category_name'];
  }
  num? _profileId;
  String? _categoryName;
Otherprofiles copyWith({  num? profileId,
  String? categoryName,
}) => Otherprofiles(  profileId: profileId ?? _profileId,
  categoryName: categoryName ?? _categoryName,
);
  num? get profileId => _profileId;
  String? get categoryName => _categoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_id'] = _profileId;
    map['category_name'] = _categoryName;
    return map;
  }

}

class Profiles {
  Profiles({
      num? profileId, 
      num? artistsTypeId, 
      String? subcategoryId, 
      String? genresId, 
      String? venueId, 
      String? languageIds, 
      String? introduction, 
      String? intagramLink, 
      dynamic intagramFollower, 
      String? facebookLink, 
      String? facebookFollower,}){
    _profileId = profileId;
    _artistsTypeId = artistsTypeId;
    _subcategoryId = subcategoryId;
    _genresId = genresId;
    _venueId = venueId;
    _languageIds = languageIds;
    _introduction = introduction;
    _intagramLink = intagramLink;
    _intagramFollower = intagramFollower;
    _facebookLink = facebookLink;
    _facebookFollower = facebookFollower;
}

  Profiles.fromJson(dynamic json) {
    _profileId = json['profile_id'];
    _artistsTypeId = json['artists_type_id'];
    _subcategoryId = json['subcategory_id'];
    _genresId = json['genres_id'];
    _venueId = json['venue_id'];
    _languageIds = json['language_ids'];
    _introduction = json['introduction'];
    _intagramLink = json['intagram_link'];
    _intagramFollower = json['intagram_follower'];
    _facebookLink = json['facebook_link'];
    _facebookFollower = json['facebook_follower'];
  }
  num? _profileId;
  num? _artistsTypeId;
  String? _subcategoryId;
  String? _genresId;
  String? _venueId;
  String? _languageIds;
  String? _introduction;
  String? _intagramLink;
  dynamic _intagramFollower;
  String? _facebookLink;
  String? _facebookFollower;
Profiles copyWith({  num? profileId,
  num? artistsTypeId,
  String? subcategoryId,
  String? genresId,
  String? venueId,
  String? languageIds,
  String? introduction,
  String? intagramLink,
  dynamic intagramFollower,
  String? facebookLink,
  String? facebookFollower,
}) => Profiles(  profileId: profileId ?? _profileId,
  artistsTypeId: artistsTypeId ?? _artistsTypeId,
  subcategoryId: subcategoryId ?? _subcategoryId,
  genresId: genresId ?? _genresId,
  venueId: venueId ?? _venueId,
  languageIds: languageIds ?? _languageIds,
  introduction: introduction ?? _introduction,
  intagramLink: intagramLink ?? _intagramLink,
  intagramFollower: intagramFollower ?? _intagramFollower,
  facebookLink: facebookLink ?? _facebookLink,
  facebookFollower: facebookFollower ?? _facebookFollower,
);
  num? get profileId => _profileId;
  num? get artistsTypeId => _artistsTypeId;
  String? get subcategoryId => _subcategoryId;
  String? get genresId => _genresId;
  String? get venueId => _venueId;
  String? get languageIds => _languageIds;
  String? get introduction => _introduction;
  String? get intagramLink => _intagramLink;
  dynamic get intagramFollower => _intagramFollower;
  String? get facebookLink => _facebookLink;
  String? get facebookFollower => _facebookFollower;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_id'] = _profileId;
    map['artists_type_id'] = _artistsTypeId;
    map['subcategory_id'] = _subcategoryId;
    map['genres_id'] = _genresId;
    map['venue_id'] = _venueId;
    map['language_ids'] = _languageIds;
    map['introduction'] = _introduction;
    map['intagram_link'] = _intagramLink;
    map['intagram_follower'] = _intagramFollower;
    map['facebook_link'] = _facebookLink;
    map['facebook_follower'] = _facebookFollower;
    return map;
  }

}

class User {
  User({
      num? id, 
      String? username, 
      String? contactNo, 
      String? email,}){
    _id = id;
    _username = username;
    _contactNo = contactNo;
    _email = email;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _contactNo = json['contact_no'];
    _email = json['email'];
  }
  num? _id;
  String? _username;
  String? _contactNo;
  String? _email;
User copyWith({  num? id,
  String? username,
  String? contactNo,
  String? email,
}) => User(  id: id ?? _id,
  username: username ?? _username,
  contactNo: contactNo ?? _contactNo,
  email: email ?? _email,
);
  num? get id => _id;
  String? get username => _username;
  String? get contactNo => _contactNo;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['contact_no'] = _contactNo;
    map['email'] = _email;
    return map;
  }

}
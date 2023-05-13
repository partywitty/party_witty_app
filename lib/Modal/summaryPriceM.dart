
class SummaryPriceM {
  SummaryPriceM({
      bool? error, 
      String? message, 
      List<summaryPrice>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  SummaryPriceM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(summaryPrice.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<summaryPrice>? _data;
SummaryPriceM copyWith({  bool? error,
  String? message,
  List<summaryPrice>? data,
}) => SummaryPriceM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<summaryPrice>? get data => _data;

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

class summaryPrice {
  summaryPrice({
      num? id, 
      num? userId, 
      num? subcategoryId, 
      num? venueId, 
      String? intrumentIds, 
      String? name, 
      String? price, 
      String? status, 
      String? temp, 
      String? createdAt, 
      String? updatedAt, 
      String? venueName, 
      String? subcategoryName, 
      String? intrumentName,}){
    _id = id;
    _userId = userId;
    _subcategoryId = subcategoryId;
    _venueId = venueId;
    _intrumentIds = intrumentIds;
    _name = name;
    _price = price;
    _status = status;
    _temp = temp;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _venueName = venueName;
    _subcategoryName = subcategoryName;
    _intrumentName = intrumentName;
}

  summaryPrice.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _subcategoryId = json['subcategory_id'];
    _venueId = json['venue_id'];
    _intrumentIds = json['intrument_ids'];
    _name = json['name'];
    _price = json['price'];
    _status = json['status'];
    _temp = json['temp'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _venueName = json['venue_name'];
    _subcategoryName = json['subcategory_name'];
    _intrumentName = json['intrument_name'];
  }
  num? _id;
  num? _userId;
  num? _subcategoryId;
  num? _venueId;
  String? _intrumentIds;
  String? _name;
  String? _price;
  String? _status;
  String? _temp;
  String? _createdAt;
  String? _updatedAt;
  String? _venueName;
  String? _subcategoryName;
  String? _intrumentName;
  summaryPrice copyWith({  num? id,
  num? userId,
  num? subcategoryId,
  num? venueId,
  String? intrumentIds,
  String? name,
  String? price,
  String? status,
  String? temp,
  String? createdAt,
  String? updatedAt,
  String? venueName,
  String? subcategoryName,
  String? intrumentName,
}) => summaryPrice(  id: id ?? _id,
  userId: userId ?? _userId,
  subcategoryId: subcategoryId ?? _subcategoryId,
  venueId: venueId ?? _venueId,
  intrumentIds: intrumentIds ?? _intrumentIds,
  name: name ?? _name,
  price: price ?? _price,
  status: status ?? _status,
  temp: temp ?? _temp,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  venueName: venueName ?? _venueName,
  subcategoryName: subcategoryName ?? _subcategoryName,
  intrumentName: intrumentName ?? _intrumentName,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get subcategoryId => _subcategoryId;
  num? get venueId => _venueId;
  String? get intrumentIds => _intrumentIds;
  String? get name => _name;
  String? get price => _price;
  String? get status => _status;
  String? get temp => _temp;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get venueName => _venueName;
  String? get subcategoryName => _subcategoryName;
  String? get intrumentName => _intrumentName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['subcategory_id'] = _subcategoryId;
    map['venue_id'] = _venueId;
    map['intrument_ids'] = _intrumentIds;
    map['name'] = _name;
    map['price'] = _price;
    map['status'] = _status;
    map['temp'] = _temp;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['venue_name'] = _venueName;
    map['subcategory_name'] = _subcategoryName;
    map['intrument_name'] = _intrumentName;
    return map;
  }

}
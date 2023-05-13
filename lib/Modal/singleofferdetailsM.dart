/// error : false
/// message : "Get Offer Successfully."
/// data : {"id":1,"user_id":1,"name":"event name","start_date":"2022-12-01","end_date":"1","valid_on":"mon,wed, fri","start_time":"09:00","end_time":"17:20","allow_persons":"200","mrp":5000,"offer_price":3000,"deal_type":"For Couple","created_at":"2022-12-14T07:00:31.000000Z","updated_at":"2022-12-14T07:00:31.000000Z"}

class SingleofferdetailsM {
  SingleofferdetailsM({
      bool? error, 
      String? message,
    Detailsdata? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  SingleofferdetailsM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Detailsdata.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Detailsdata? _data;
SingleofferdetailsM copyWith({  bool? error,
  String? message,
  Detailsdata? data,
}) => SingleofferdetailsM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  Detailsdata? get data => _data;

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

/// id : 1
/// user_id : 1
/// name : "event name"
/// start_date : "2022-12-01"
/// end_date : "1"
/// valid_on : "mon,wed, fri"
/// start_time : "09:00"
/// end_time : "17:20"
/// allow_persons : "200"
/// mrp : 5000
/// offer_price : 3000
/// deal_type : "For Couple"
/// created_at : "2022-12-14T07:00:31.000000Z"
/// updated_at : "2022-12-14T07:00:31.000000Z"

class Detailsdata {
  Detailsdata({
      num? id, 
      num? userId, 
      String? name, 
      String? startDate, 
      String? endDate, 
      String? validOn, 
      String? startTime, 
      String? endTime, 
      String? allowPersons, 
      num? mrp, 
      num? offerPrice, 
      String? dealType, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _name = name;
    _startDate = startDate;
    _endDate = endDate;
    _validOn = validOn;
    _startTime = startTime;
    _endTime = endTime;
    _allowPersons = allowPersons;
    _mrp = mrp;
    _offerPrice = offerPrice;
    _dealType = dealType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Detailsdata.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _name = json['name'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _validOn = json['valid_on'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _allowPersons = json['allow_persons'];
    _mrp = json['mrp'];
    _offerPrice = json['offer_price'];
    _dealType = json['deal_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _userId;
  String? _name;
  String? _startDate;
  String? _endDate;
  String? _validOn;
  String? _startTime;
  String? _endTime;
  String? _allowPersons;
  num? _mrp;
  num? _offerPrice;
  String? _dealType;
  String? _createdAt;
  String? _updatedAt;
  Detailsdata copyWith({  num? id,
  num? userId,
  String? name,
  String? startDate,
  String? endDate,
  String? validOn,
  String? startTime,
  String? endTime,
  String? allowPersons,
  num? mrp,
  num? offerPrice,
  String? dealType,
  String? createdAt,
  String? updatedAt,
}) => Detailsdata(  id: id ?? _id,
  userId: userId ?? _userId,
  name: name ?? _name,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  validOn: validOn ?? _validOn,
  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  allowPersons: allowPersons ?? _allowPersons,
  mrp: mrp ?? _mrp,
  offerPrice: offerPrice ?? _offerPrice,
  dealType: dealType ?? _dealType,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get userId => _userId;
  String? get name => _name;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get validOn => _validOn;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get allowPersons => _allowPersons;
  num? get mrp => _mrp;
  num? get offerPrice => _offerPrice;
  String? get dealType => _dealType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['name'] = _name;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['valid_on'] = _validOn;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['allow_persons'] = _allowPersons;
    map['mrp'] = _mrp;
    map['offer_price'] = _offerPrice;
    map['deal_type'] = _dealType;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}
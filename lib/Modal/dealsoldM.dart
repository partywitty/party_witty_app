/// error : false
/// message : "Get Offers List Successfully."
/// data : {"offer":{"id":1,"offer_category_ids":"1","offer_name":"NEW YEAR'S EVE PARTY 2023 @ SMAAASH, NOIDA ","small_description":"Smaaash welcomes you to 2023 with Smaaashing New Year Party 31st NYE celebration with Electrifying Live DJ, Unlimited Drinks & Food\n\n                <p><b>Note:-</b> Kids below 5 years of age entry is free</p>","type":"<span class=\"text-warning\">GOLD</span>","club_id":89,"start_time":"08:00","end_time":"23:59","break_start_time":"","breack_end_time":"","start_date":"2022-12-31","end_date":"2023-01-01","days":"Sat, Sun","product_id":"","thamnail_photo":"public/offer_thamnail/IMG-20221221-WA0027.jpg","cover_photo":"public/offer_cover/20221222_165210_0004.png","term_condition":"<div class=\"row\">\n                    <div class=\"col-md-12\">\n                        <h5><b>Inclusion:</b></h5>\n                        <p class=\"intsruction mt-2\"><b>*Unlimited IMFL Importedt Liquor- Wishkey- Black Label/ Chivas Regal/Ballentine’s Beer- Corona/Ultra/Birra Gin- Bombay Saphire Vodka- Absolute/Belvedre.</b>\n                            </p>\n                        <ul class=\"modal--ul mt-2\">\n                            <li>Unlimited Juices  </li>\n                            <li>Unlimited Mocktails  </li>\n                            <li>Unlimited Soft Drinks  </li>\n                            <li>Unlimited Starters </li>\n                            <li>Unlimited Buffet </li>\n                        </ul>\n                    </div>\n                    <div class=\"col-md-12\">\n                        <h5><b>Terms & Conditions:</b></h5>\n                        <p class=\"intsruction mt-2\"><b>*Ticket/s once sold cannot be exchanged or refunded</b></p>\n                        <ul class=\"modal--ul mt-2\">\n                            <li>Unlawful resale of a ticket would lead to cancellation without any refund</li>\n                            <li>Rights of admission reserved. </li>\n                            <li>These terms & conditions are subject to change at the discreation of organizer.</li>\n                        </ul>\n                    </div>\n                </div>","stage_mrp":2699,"stage_sell":2699,"couple_mrp":4699,"couple_sell":4699,"valid_for_kid":"yes","kids_mrp":1000,"kids_sell":1000,"kids_term_condition":"Inclusions :- \n•Unlimited Arcade games\n•Unlimited Starters\n•Unlimited Buffet","inclusion":"<p><strong><span style=\"font-size: 18px;\">Unlimited IMFL</span></strong></p>\n                <p><span style=\"font-size: 18px;\"><br></span><strong>Wishkey</strong>- Black Dog/100\n                    Pipers/<br>Teacher&rsquo;s Highland/Vat69<br><strong>Beer</strong>-\n                    Kingfisher/Birra<br><strong>Vodka</strong>- Smirnoff/Magic Moment verve<br><strong>Rum</strong>-\n                    Bacardi White/Old Monk.</p><p><strong><br>&bull;Unlimited Juices<br>&bull;Unlimited Mocktails<br>&bull;Unlimited Soft\n                        Drinks<br>&bull;Unlimited Starters<br>&bull;Unlimited Buffet </strong></p>","deal_type":"For Couple","created_at":"2022-12-20T09:00:52.000000Z","updated_at":"2022-12-20T09:00:52.000000Z","address":"\t\nNoida Pub Exchange, Mall of India, Sector 18, Noida"},"offersbook":[{"id":1,"offer_id":1,"guast_id":0,"contact_number":"9876543210","name":"test","email":"test@gmail.com","total_amount":12187,"razorpay_payment_id":"pay_KvJyqk4jdWJ3Jb","created_at":"2022-12-23T10:38:05.000000Z","updated_at":"2022-12-23T10:38:05.000000Z","CoupleCount":2,"couple_male":[{"id":2,"offers_book_id":1,"name":"test1","contact":"9876543201","age":"22","type":"couple_male","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}],"couple_female":[{"id":3,"offers_book_id":1,"name":"test2","contact":"9876543212","age":"23","type":"couple_female","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}],"stagCount":1,"stag_detail":[{"id":1,"offers_book_id":1,"name":"test","contact":"9876543210","age":"21","type":"stage","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}],"kidsCount":1,"kids_detail":[{"id":4,"offers_book_id":1,"name":"test3","contact":"9876543214","age":"24","type":"kids","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}]}]}

class DealsoldM {
  DealsoldM({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  DealsoldM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
DealsoldM copyWith({  bool? error,
  String? message,
  Data? data,
}) => DealsoldM(  error: error ?? _error,
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

/// offer : {"id":1,"offer_category_ids":"1","offer_name":"NEW YEAR'S EVE PARTY 2023 @ SMAAASH, NOIDA ","small_description":"Smaaash welcomes you to 2023 with Smaaashing New Year Party 31st NYE celebration with Electrifying Live DJ, Unlimited Drinks & Food\n\n                <p><b>Note:-</b> Kids below 5 years of age entry is free</p>","type":"<span class=\"text-warning\">GOLD</span>","club_id":89,"start_time":"08:00","end_time":"23:59","break_start_time":"","breack_end_time":"","start_date":"2022-12-31","end_date":"2023-01-01","days":"Sat, Sun","product_id":"","thamnail_photo":"public/offer_thamnail/IMG-20221221-WA0027.jpg","cover_photo":"public/offer_cover/20221222_165210_0004.png","term_condition":"<div class=\"row\">\n                    <div class=\"col-md-12\">\n                        <h5><b>Inclusion:</b></h5>\n                        <p class=\"intsruction mt-2\"><b>*Unlimited IMFL Importedt Liquor- Wishkey- Black Label/ Chivas Regal/Ballentine’s Beer- Corona/Ultra/Birra Gin- Bombay Saphire Vodka- Absolute/Belvedre.</b>\n                            </p>\n                        <ul class=\"modal--ul mt-2\">\n                            <li>Unlimited Juices  </li>\n                            <li>Unlimited Mocktails  </li>\n                            <li>Unlimited Soft Drinks  </li>\n                            <li>Unlimited Starters </li>\n                            <li>Unlimited Buffet </li>\n                        </ul>\n                    </div>\n                    <div class=\"col-md-12\">\n                        <h5><b>Terms & Conditions:</b></h5>\n                        <p class=\"intsruction mt-2\"><b>*Ticket/s once sold cannot be exchanged or refunded</b></p>\n                        <ul class=\"modal--ul mt-2\">\n                            <li>Unlawful resale of a ticket would lead to cancellation without any refund</li>\n                            <li>Rights of admission reserved. </li>\n                            <li>These terms & conditions are subject to change at the discreation of organizer.</li>\n                        </ul>\n                    </div>\n                </div>","stage_mrp":2699,"stage_sell":2699,"couple_mrp":4699,"couple_sell":4699,"valid_for_kid":"yes","kids_mrp":1000,"kids_sell":1000,"kids_term_condition":"Inclusions :- \n•Unlimited Arcade games\n•Unlimited Starters\n•Unlimited Buffet","inclusion":"<p><strong><span style=\"font-size: 18px;\">Unlimited IMFL</span></strong></p>\n                <p><span style=\"font-size: 18px;\"><br></span><strong>Wishkey</strong>- Black Dog/100\n                    Pipers/<br>Teacher&rsquo;s Highland/Vat69<br><strong>Beer</strong>-\n                    Kingfisher/Birra<br><strong>Vodka</strong>- Smirnoff/Magic Moment verve<br><strong>Rum</strong>-\n                    Bacardi White/Old Monk.</p><p><strong><br>&bull;Unlimited Juices<br>&bull;Unlimited Mocktails<br>&bull;Unlimited Soft\n                        Drinks<br>&bull;Unlimited Starters<br>&bull;Unlimited Buffet </strong></p>","deal_type":"For Couple","created_at":"2022-12-20T09:00:52.000000Z","updated_at":"2022-12-20T09:00:52.000000Z","address":"\t\nNoida Pub Exchange, Mall of India, Sector 18, Noida"}
/// offersbook : [{"id":1,"offer_id":1,"guast_id":0,"contact_number":"9876543210","name":"test","email":"test@gmail.com","total_amount":12187,"razorpay_payment_id":"pay_KvJyqk4jdWJ3Jb","created_at":"2022-12-23T10:38:05.000000Z","updated_at":"2022-12-23T10:38:05.000000Z","CoupleCount":2,"couple_male":[{"id":2,"offers_book_id":1,"name":"test1","contact":"9876543201","age":"22","type":"couple_male","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}],"couple_female":[{"id":3,"offers_book_id":1,"name":"test2","contact":"9876543212","age":"23","type":"couple_female","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}],"stagCount":1,"stag_detail":[{"id":1,"offers_book_id":1,"name":"test","contact":"9876543210","age":"21","type":"stage","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}],"kidsCount":1,"kids_detail":[{"id":4,"offers_book_id":1,"name":"test3","contact":"9876543214","age":"24","type":"kids","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}]}]

class Data {
  Data({
      Offer? offer, 
      List<Offersbook>? offersbook,}){
    _offer = offer;
    _offersbook = offersbook;
}

  Data.fromJson(dynamic json) {
    _offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
    if (json['offersbook'] != null) {
      _offersbook = [];
      json['offersbook'].forEach((v) {
        _offersbook?.add(Offersbook.fromJson(v));
      });
    }
  }
  Offer? _offer;
  List<Offersbook>? _offersbook;
Data copyWith({  Offer? offer,
  List<Offersbook>? offersbook,
}) => Data(  offer: offer ?? _offer,
  offersbook: offersbook ?? _offersbook,
);
  Offer? get offer => _offer;
  List<Offersbook>? get offersbook => _offersbook;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_offer != null) {
      map['offer'] = _offer?.toJson();
    }
    if (_offersbook != null) {
      map['offersbook'] = _offersbook?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// offer_id : 1
/// guast_id : 0
/// contact_number : "9876543210"
/// name : "test"
/// email : "test@gmail.com"
/// total_amount : 12187
/// razorpay_payment_id : "pay_KvJyqk4jdWJ3Jb"
/// created_at : "2022-12-23T10:38:05.000000Z"
/// updated_at : "2022-12-23T10:38:05.000000Z"
/// CoupleCount : 2
/// couple_male : [{"id":2,"offers_book_id":1,"name":"test1","contact":"9876543201","age":"22","type":"couple_male","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}]
/// couple_female : [{"id":3,"offers_book_id":1,"name":"test2","contact":"9876543212","age":"23","type":"couple_female","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}]
/// stagCount : 1
/// stag_detail : [{"id":1,"offers_book_id":1,"name":"test","contact":"9876543210","age":"21","type":"stage","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}]
/// kidsCount : 1
/// kids_detail : [{"id":4,"offers_book_id":1,"name":"test3","contact":"9876543214","age":"24","type":"kids","created_at":"2022-12-21T10:21:03.000000Z","updated_at":"2022-12-21T10:21:03.000000Z"}]

class Offersbook {
  Offersbook({
      num? id, 
      num? offerId, 
      num? guastId, 
      String? contactNumber, 
      String? name, 
      String? email, 
      num? totalAmount, 
      String? razorpayPaymentId, 
      String? createdAt, 
      String? updatedAt, 
      num? coupleCount, 
      List<CoupleMale>? coupleMale, 
      List<CoupleFemale>? coupleFemale, 
      num? stagCount, 
      List<StagDetail>? stagDetail, 
      num? kidsCount, 
      List<KidsDetail>? kidsDetail,}){
    _id = id;
    _offerId = offerId;
    _guastId = guastId;
    _contactNumber = contactNumber;
    _name = name;
    _email = email;
    _totalAmount = totalAmount;
    _razorpayPaymentId = razorpayPaymentId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _coupleCount = coupleCount;
    _coupleMale = coupleMale;
    _coupleFemale = coupleFemale;
    _stagCount = stagCount;
    _stagDetail = stagDetail;
    _kidsCount = kidsCount;
    _kidsDetail = kidsDetail;
}

  Offersbook.fromJson(dynamic json) {
    _id = json['id'];
    _offerId = json['offer_id'];
    _guastId = json['guast_id'];
    _contactNumber = json['contact_number'];
    _name = json['name'];
    _email = json['email'];
    _totalAmount = json['total_amount'];
    _razorpayPaymentId = json['razorpay_payment_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _coupleCount = json['CoupleCount'];
    if (json['couple_male'] != null) {
      _coupleMale = [];
      json['couple_male'].forEach((v) {
        _coupleMale?.add(CoupleMale.fromJson(v));
      });
    }
    if (json['couple_female'] != null) {
      _coupleFemale = [];
      json['couple_female'].forEach((v) {
        _coupleFemale?.add(CoupleFemale.fromJson(v));
      });
    }
    _stagCount = json['stagCount'];
    if (json['stag_detail'] != null) {
      _stagDetail = [];
      json['stag_detail'].forEach((v) {
        _stagDetail?.add(StagDetail.fromJson(v));
      });
    }
    _kidsCount = json['kidsCount'];
    if (json['kids_detail'] != null) {
      _kidsDetail = [];
      json['kids_detail'].forEach((v) {
        _kidsDetail?.add(KidsDetail.fromJson(v));
      });
    }
  }
  num? _id;
  num? _offerId;
  num? _guastId;
  String? _contactNumber;
  String? _name;
  String? _email;
  num? _totalAmount;
  String? _razorpayPaymentId;
  String? _createdAt;
  String? _updatedAt;
  num? _coupleCount;
  List<CoupleMale>? _coupleMale;
  List<CoupleFemale>? _coupleFemale;
  num? _stagCount;
  List<StagDetail>? _stagDetail;
  num? _kidsCount;
  List<KidsDetail>? _kidsDetail;
Offersbook copyWith({  num? id,
  num? offerId,
  num? guastId,
  String? contactNumber,
  String? name,
  String? email,
  num? totalAmount,
  String? razorpayPaymentId,
  String? createdAt,
  String? updatedAt,
  num? coupleCount,
  List<CoupleMale>? coupleMale,
  List<CoupleFemale>? coupleFemale,
  num? stagCount,
  List<StagDetail>? stagDetail,
  num? kidsCount,
  List<KidsDetail>? kidsDetail,
}) => Offersbook(  id: id ?? _id,
  offerId: offerId ?? _offerId,
  guastId: guastId ?? _guastId,
  contactNumber: contactNumber ?? _contactNumber,
  name: name ?? _name,
  email: email ?? _email,
  totalAmount: totalAmount ?? _totalAmount,
  razorpayPaymentId: razorpayPaymentId ?? _razorpayPaymentId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  coupleCount: coupleCount ?? _coupleCount,
  coupleMale: coupleMale ?? _coupleMale,
  coupleFemale: coupleFemale ?? _coupleFemale,
  stagCount: stagCount ?? _stagCount,
  stagDetail: stagDetail ?? _stagDetail,
  kidsCount: kidsCount ?? _kidsCount,
  kidsDetail: kidsDetail ?? _kidsDetail,
);
  num? get id => _id;
  num? get offerId => _offerId;
  num? get guastId => _guastId;
  String? get contactNumber => _contactNumber;
  String? get name => _name;
  String? get email => _email;
  num? get totalAmount => _totalAmount;
  String? get razorpayPaymentId => _razorpayPaymentId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get coupleCount => _coupleCount;
  List<CoupleMale>? get coupleMale => _coupleMale;
  List<CoupleFemale>? get coupleFemale => _coupleFemale;
  num? get stagCount => _stagCount;
  List<StagDetail>? get stagDetail => _stagDetail;
  num? get kidsCount => _kidsCount;
  List<KidsDetail>? get kidsDetail => _kidsDetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['offer_id'] = _offerId;
    map['guast_id'] = _guastId;
    map['contact_number'] = _contactNumber;
    map['name'] = _name;
    map['email'] = _email;
    map['total_amount'] = _totalAmount;
    map['razorpay_payment_id'] = _razorpayPaymentId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['CoupleCount'] = _coupleCount;
    if (_coupleMale != null) {
      map['couple_male'] = _coupleMale?.map((v) => v.toJson()).toList();
    }
    if (_coupleFemale != null) {
      map['couple_female'] = _coupleFemale?.map((v) => v.toJson()).toList();
    }
    map['stagCount'] = _stagCount;
    if (_stagDetail != null) {
      map['stag_detail'] = _stagDetail?.map((v) => v.toJson()).toList();
    }
    map['kidsCount'] = _kidsCount;
    if (_kidsDetail != null) {
      map['kids_detail'] = _kidsDetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// offers_book_id : 1
/// name : "test3"
/// contact : "9876543214"
/// age : "24"
/// type : "kids"
/// created_at : "2022-12-21T10:21:03.000000Z"
/// updated_at : "2022-12-21T10:21:03.000000Z"

class KidsDetail {
  KidsDetail({
      num? id, 
      num? offersBookId, 
      String? name, 
      String? contact, 
      String? age, 
      String? type, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _offersBookId = offersBookId;
    _name = name;
    _contact = contact;
    _age = age;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  KidsDetail.fromJson(dynamic json) {
    _id = json['id'];
    _offersBookId = json['offers_book_id'];
    _name = json['name'];
    _contact = json['contact'];
    _age = json['age'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _offersBookId;
  String? _name;
  String? _contact;
  String? _age;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
KidsDetail copyWith({  num? id,
  num? offersBookId,
  String? name,
  String? contact,
  String? age,
  String? type,
  String? createdAt,
  String? updatedAt,
}) => KidsDetail(  id: id ?? _id,
  offersBookId: offersBookId ?? _offersBookId,
  name: name ?? _name,
  contact: contact ?? _contact,
  age: age ?? _age,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get offersBookId => _offersBookId;
  String? get name => _name;
  String? get contact => _contact;
  String? get age => _age;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['offers_book_id'] = _offersBookId;
    map['name'] = _name;
    map['contact'] = _contact;
    map['age'] = _age;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// offers_book_id : 1
/// name : "test"
/// contact : "9876543210"
/// age : "21"
/// type : "stage"
/// created_at : "2022-12-21T10:21:03.000000Z"
/// updated_at : "2022-12-21T10:21:03.000000Z"

class StagDetail {
  StagDetail({
      num? id, 
      num? offersBookId, 
      String? name, 
      String? contact, 
      String? age, 
      String? type, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _offersBookId = offersBookId;
    _name = name;
    _contact = contact;
    _age = age;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  StagDetail.fromJson(dynamic json) {
    _id = json['id'];
    _offersBookId = json['offers_book_id'];
    _name = json['name'];
    _contact = json['contact'];
    _age = json['age'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _offersBookId;
  String? _name;
  String? _contact;
  String? _age;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
StagDetail copyWith({  num? id,
  num? offersBookId,
  String? name,
  String? contact,
  String? age,
  String? type,
  String? createdAt,
  String? updatedAt,
}) => StagDetail(  id: id ?? _id,
  offersBookId: offersBookId ?? _offersBookId,
  name: name ?? _name,
  contact: contact ?? _contact,
  age: age ?? _age,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get offersBookId => _offersBookId;
  String? get name => _name;
  String? get contact => _contact;
  String? get age => _age;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['offers_book_id'] = _offersBookId;
    map['name'] = _name;
    map['contact'] = _contact;
    map['age'] = _age;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 3
/// offers_book_id : 1
/// name : "test2"
/// contact : "9876543212"
/// age : "23"
/// type : "couple_female"
/// created_at : "2022-12-21T10:21:03.000000Z"
/// updated_at : "2022-12-21T10:21:03.000000Z"

class CoupleFemale {
  CoupleFemale({
      num? id, 
      num? offersBookId, 
      String? name, 
      String? contact, 
      String? age, 
      String? type, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _offersBookId = offersBookId;
    _name = name;
    _contact = contact;
    _age = age;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CoupleFemale.fromJson(dynamic json) {
    _id = json['id'];
    _offersBookId = json['offers_book_id'];
    _name = json['name'];
    _contact = json['contact'];
    _age = json['age'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _offersBookId;
  String? _name;
  String? _contact;
  String? _age;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
CoupleFemale copyWith({  num? id,
  num? offersBookId,
  String? name,
  String? contact,
  String? age,
  String? type,
  String? createdAt,
  String? updatedAt,
}) => CoupleFemale(  id: id ?? _id,
  offersBookId: offersBookId ?? _offersBookId,
  name: name ?? _name,
  contact: contact ?? _contact,
  age: age ?? _age,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get offersBookId => _offersBookId;
  String? get name => _name;
  String? get contact => _contact;
  String? get age => _age;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['offers_book_id'] = _offersBookId;
    map['name'] = _name;
    map['contact'] = _contact;
    map['age'] = _age;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 2
/// offers_book_id : 1
/// name : "test1"
/// contact : "9876543201"
/// age : "22"
/// type : "couple_male"
/// created_at : "2022-12-21T10:21:03.000000Z"
/// updated_at : "2022-12-21T10:21:03.000000Z"

class CoupleMale {
  CoupleMale({
      num? id, 
      num? offersBookId, 
      String? name, 
      String? contact, 
      String? age, 
      String? type, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _offersBookId = offersBookId;
    _name = name;
    _contact = contact;
    _age = age;
    _type = type;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  CoupleMale.fromJson(dynamic json) {
    _id = json['id'];
    _offersBookId = json['offers_book_id'];
    _name = json['name'];
    _contact = json['contact'];
    _age = json['age'];
    _type = json['type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  num? _offersBookId;
  String? _name;
  String? _contact;
  String? _age;
  String? _type;
  String? _createdAt;
  String? _updatedAt;
CoupleMale copyWith({  num? id,
  num? offersBookId,
  String? name,
  String? contact,
  String? age,
  String? type,
  String? createdAt,
  String? updatedAt,
}) => CoupleMale(  id: id ?? _id,
  offersBookId: offersBookId ?? _offersBookId,
  name: name ?? _name,
  contact: contact ?? _contact,
  age: age ?? _age,
  type: type ?? _type,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  num? get offersBookId => _offersBookId;
  String? get name => _name;
  String? get contact => _contact;
  String? get age => _age;
  String? get type => _type;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['offers_book_id'] = _offersBookId;
    map['name'] = _name;
    map['contact'] = _contact;
    map['age'] = _age;
    map['type'] = _type;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 1
/// offer_category_ids : "1"
/// offer_name : "NEW YEAR'S EVE PARTY 2023 @ SMAAASH, NOIDA "
/// small_description : "Smaaash welcomes you to 2023 with Smaaashing New Year Party 31st NYE celebration with Electrifying Live DJ, Unlimited Drinks & Food\n\n                <p><b>Note:-</b> Kids below 5 years of age entry is free</p>"
/// type : "<span class=\"text-warning\">GOLD</span>"
/// club_id : 89
/// start_time : "08:00"
/// end_time : "23:59"
/// break_start_time : ""
/// breack_end_time : ""
/// start_date : "2022-12-31"
/// end_date : "2023-01-01"
/// days : "Sat, Sun"
/// product_id : ""
/// thamnail_photo : "public/offer_thamnail/IMG-20221221-WA0027.jpg"
/// cover_photo : "public/offer_cover/20221222_165210_0004.png"
/// term_condition : "<div class=\"row\">\n                    <div class=\"col-md-12\">\n                        <h5><b>Inclusion:</b></h5>\n                        <p class=\"intsruction mt-2\"><b>*Unlimited IMFL Importedt Liquor- Wishkey- Black Label/ Chivas Regal/Ballentine’s Beer- Corona/Ultra/Birra Gin- Bombay Saphire Vodka- Absolute/Belvedre.</b>\n                            </p>\n                        <ul class=\"modal--ul mt-2\">\n                            <li>Unlimited Juices  </li>\n                            <li>Unlimited Mocktails  </li>\n                            <li>Unlimited Soft Drinks  </li>\n                            <li>Unlimited Starters </li>\n                            <li>Unlimited Buffet </li>\n                        </ul>\n                    </div>\n                    <div class=\"col-md-12\">\n                        <h5><b>Terms & Conditions:</b></h5>\n                        <p class=\"intsruction mt-2\"><b>*Ticket/s once sold cannot be exchanged or refunded</b></p>\n                        <ul class=\"modal--ul mt-2\">\n                            <li>Unlawful resale of a ticket would lead to cancellation without any refund</li>\n                            <li>Rights of admission reserved. </li>\n                            <li>These terms & conditions are subject to change at the discreation of organizer.</li>\n                        </ul>\n                    </div>\n                </div>"
/// stage_mrp : 2699
/// stage_sell : 2699
/// couple_mrp : 4699
/// couple_sell : 4699
/// valid_for_kid : "yes"
/// kids_mrp : 1000
/// kids_sell : 1000
/// kids_term_condition : "Inclusions :- \n•Unlimited Arcade games\n•Unlimited Starters\n•Unlimited Buffet"
/// inclusion : "<p><strong><span style=\"font-size: 18px;\">Unlimited IMFL</span></strong></p>\n                <p><span style=\"font-size: 18px;\"><br></span><strong>Wishkey</strong>- Black Dog/100\n                    Pipers/<br>Teacher&rsquo;s Highland/Vat69<br><strong>Beer</strong>-\n                    Kingfisher/Birra<br><strong>Vodka</strong>- Smirnoff/Magic Moment verve<br><strong>Rum</strong>-\n                    Bacardi White/Old Monk.</p><p><strong><br>&bull;Unlimited Juices<br>&bull;Unlimited Mocktails<br>&bull;Unlimited Soft\n                        Drinks<br>&bull;Unlimited Starters<br>&bull;Unlimited Buffet </strong></p>"
/// deal_type : "For Couple"
/// created_at : "2022-12-20T09:00:52.000000Z"
/// updated_at : "2022-12-20T09:00:52.000000Z"
/// address : "\t\nNoida Pub Exchange, Mall of India, Sector 18, Noida"

class Offer {
  Offer({
      num? id, 
      String? offerCategoryIds, 
      String? offerName, 
      String? smallDescription, 
      String? type, 
      num? clubId, 
      String? startTime, 
      String? endTime, 
      String? breakStartTime, 
      String? breackEndTime, 
      String? startDate, 
      String? endDate, 
      String? days, 
      String? productId, 
      String? thamnailPhoto, 
      String? coverPhoto, 
      String? termCondition, 
      num? stageMrp, 
      num? stageSell, 
      num? coupleMrp, 
      num? coupleSell, 
      String? validForKid, 
      num? kidsMrp, 
      num? kidsSell, 
      String? kidsTermCondition, 
      String? inclusion, 
      String? dealType, 
      String? createdAt, 
      String? updatedAt, 
      String? address,}){
    _id = id;
    _offerCategoryIds = offerCategoryIds;
    _offerName = offerName;
    _smallDescription = smallDescription;
    _type = type;
    _clubId = clubId;
    _startTime = startTime;
    _endTime = endTime;
    _breakStartTime = breakStartTime;
    _breackEndTime = breackEndTime;
    _startDate = startDate;
    _endDate = endDate;
    _days = days;
    _productId = productId;
    _thamnailPhoto = thamnailPhoto;
    _coverPhoto = coverPhoto;
    _termCondition = termCondition;
    _stageMrp = stageMrp;
    _stageSell = stageSell;
    _coupleMrp = coupleMrp;
    _coupleSell = coupleSell;
    _validForKid = validForKid;
    _kidsMrp = kidsMrp;
    _kidsSell = kidsSell;
    _kidsTermCondition = kidsTermCondition;
    _inclusion = inclusion;
    _dealType = dealType;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _address = address;
}

  Offer.fromJson(dynamic json) {
    _id = json['id'];
    _offerCategoryIds = json['offer_category_ids'];
    _offerName = json['offer_name'];
    _smallDescription = json['small_description'];
    _type = json['type'];
    _clubId = json['club_id'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _breakStartTime = json['break_start_time'];
    _breackEndTime = json['breack_end_time'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _days = json['days'];
    _productId = json['product_id'];
    _thamnailPhoto = json['thamnail_photo'];
    _coverPhoto = json['cover_photo'];
    _termCondition = json['term_condition'];
    _stageMrp = json['stage_mrp'];
    _stageSell = json['stage_sell'];
    _coupleMrp = json['couple_mrp'];
    _coupleSell = json['couple_sell'];
    _validForKid = json['valid_for_kid'];
    _kidsMrp = json['kids_mrp'];
    _kidsSell = json['kids_sell'];
    _kidsTermCondition = json['kids_term_condition'];
    _inclusion = json['inclusion'];
    _dealType = json['deal_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _address = json['address'];
  }
  num? _id;
  String? _offerCategoryIds;
  String? _offerName;
  String? _smallDescription;
  String? _type;
  num? _clubId;
  String? _startTime;
  String? _endTime;
  String? _breakStartTime;
  String? _breackEndTime;
  String? _startDate;
  String? _endDate;
  String? _days;
  String? _productId;
  String? _thamnailPhoto;
  String? _coverPhoto;
  String? _termCondition;
  num? _stageMrp;
  num? _stageSell;
  num? _coupleMrp;
  num? _coupleSell;
  String? _validForKid;
  num? _kidsMrp;
  num? _kidsSell;
  String? _kidsTermCondition;
  String? _inclusion;
  String? _dealType;
  String? _createdAt;
  String? _updatedAt;
  String? _address;
Offer copyWith({  num? id,
  String? offerCategoryIds,
  String? offerName,
  String? smallDescription,
  String? type,
  num? clubId,
  String? startTime,
  String? endTime,
  String? breakStartTime,
  String? breackEndTime,
  String? startDate,
  String? endDate,
  String? days,
  String? productId,
  String? thamnailPhoto,
  String? coverPhoto,
  String? termCondition,
  num? stageMrp,
  num? stageSell,
  num? coupleMrp,
  num? coupleSell,
  String? validForKid,
  num? kidsMrp,
  num? kidsSell,
  String? kidsTermCondition,
  String? inclusion,
  String? dealType,
  String? createdAt,
  String? updatedAt,
  String? address,
}) => Offer(  id: id ?? _id,
  offerCategoryIds: offerCategoryIds ?? _offerCategoryIds,
  offerName: offerName ?? _offerName,
  smallDescription: smallDescription ?? _smallDescription,
  type: type ?? _type,
  clubId: clubId ?? _clubId,
  startTime: startTime ?? _startTime,
  endTime: endTime ?? _endTime,
  breakStartTime: breakStartTime ?? _breakStartTime,
  breackEndTime: breackEndTime ?? _breackEndTime,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  days: days ?? _days,
  productId: productId ?? _productId,
  thamnailPhoto: thamnailPhoto ?? _thamnailPhoto,
  coverPhoto: coverPhoto ?? _coverPhoto,
  termCondition: termCondition ?? _termCondition,
  stageMrp: stageMrp ?? _stageMrp,
  stageSell: stageSell ?? _stageSell,
  coupleMrp: coupleMrp ?? _coupleMrp,
  coupleSell: coupleSell ?? _coupleSell,
  validForKid: validForKid ?? _validForKid,
  kidsMrp: kidsMrp ?? _kidsMrp,
  kidsSell: kidsSell ?? _kidsSell,
  kidsTermCondition: kidsTermCondition ?? _kidsTermCondition,
  inclusion: inclusion ?? _inclusion,
  dealType: dealType ?? _dealType,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  address: address ?? _address,
);
  num? get id => _id;
  String? get offerCategoryIds => _offerCategoryIds;
  String? get offerName => _offerName;
  String? get smallDescription => _smallDescription;
  String? get type => _type;
  num? get clubId => _clubId;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get breakStartTime => _breakStartTime;
  String? get breackEndTime => _breackEndTime;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get days => _days;
  String? get productId => _productId;
  String? get thamnailPhoto => _thamnailPhoto;
  String? get coverPhoto => _coverPhoto;
  String? get termCondition => _termCondition;
  num? get stageMrp => _stageMrp;
  num? get stageSell => _stageSell;
  num? get coupleMrp => _coupleMrp;
  num? get coupleSell => _coupleSell;
  String? get validForKid => _validForKid;
  num? get kidsMrp => _kidsMrp;
  num? get kidsSell => _kidsSell;
  String? get kidsTermCondition => _kidsTermCondition;
  String? get inclusion => _inclusion;
  String? get dealType => _dealType;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['offer_category_ids'] = _offerCategoryIds;
    map['offer_name'] = _offerName;
    map['small_description'] = _smallDescription;
    map['type'] = _type;
    map['club_id'] = _clubId;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['break_start_time'] = _breakStartTime;
    map['breack_end_time'] = _breackEndTime;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['days'] = _days;
    map['product_id'] = _productId;
    map['thamnail_photo'] = _thamnailPhoto;
    map['cover_photo'] = _coverPhoto;
    map['term_condition'] = _termCondition;
    map['stage_mrp'] = _stageMrp;
    map['stage_sell'] = _stageSell;
    map['couple_mrp'] = _coupleMrp;
    map['couple_sell'] = _coupleSell;
    map['valid_for_kid'] = _validForKid;
    map['kids_mrp'] = _kidsMrp;
    map['kids_sell'] = _kidsSell;
    map['kids_term_condition'] = _kidsTermCondition;
    map['inclusion'] = _inclusion;
    map['deal_type'] = _dealType;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['address'] = _address;
    return map;
  }

}
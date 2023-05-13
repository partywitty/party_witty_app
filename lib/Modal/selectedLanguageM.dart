
class SelectedLanguageM {
  SelectedLanguageM({
      bool? error, 
      String? message, 
      List<languageSelected>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  SelectedLanguageM.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(languageSelected.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<languageSelected>? _data;
SelectedLanguageM copyWith({  bool? error,
  String? message,
  List<languageSelected>? data,
}) => SelectedLanguageM(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<languageSelected>? get data => _data;

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

class languageSelected {
  languageSelected({
      String? languageIds, 
      String? languages,}){
    _languageIds = languageIds;
    _languages = languages;
}

  languageSelected.fromJson(dynamic json) {
    _languageIds = json['language_ids'];
    _languages = json['languages'];
  }
  String? _languageIds;
  String? _languages;
  languageSelected copyWith({  String? languageIds,
  String? languages,
}) => languageSelected(  languageIds: languageIds ?? _languageIds,
  languages: languages ?? _languages,
);
  String? get languageIds => _languageIds;
  String? get languages => _languages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['language_ids'] = _languageIds;
    map['languages'] = _languages;
    return map;
  }

}
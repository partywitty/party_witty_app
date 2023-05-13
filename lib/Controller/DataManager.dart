
class DataManager {
  var _user_Id,_user_type,_email,_name,_endPage,_number,profileId;

  static final DataManager ourInstance = DataManager();

  static DataManager getInstance() {
    return ourInstance;
  }

  String getUserId() {
    return _user_Id;
  }
  setUserId(value) {
    _user_Id = value;
  }

  String getName() {
    return _name;
  }
  setName(value) {
    _name = value;
  }

  String getUserType() {
    return _user_type;
  }
  setUserType(value) {
    _user_type = value;
  }

  String getEndPage() {
    return _endPage;
  }
  setEndPage(value) {
    _endPage = value;
  }

  String getEmail() {
    return _email;
  }
  setEmail(value) {
    _email = value;
  }

  String getNumber() {
    return _number;
  }
  setNumber(value) {
    _number = value;
  }

  String getProfile() {
    return profileId;
  }
  setProfile(value) {
    profileId = value;
  }

}
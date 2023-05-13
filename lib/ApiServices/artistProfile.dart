import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Modal/primaryCityM.dart';
import '../Modal/primaryM.dart';
import 'api_link.dart';

class artistProfileApi {
  final _getUserDetail = GetUserDetail();
  Future<PrimaryM> getPrimaryView() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
    };
    print("--------------$body");
    final response = await http.post(
        Uri.parse(Api_link.viewPrimary),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return PrimaryM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<PrimaryCityM> getPrimaryCity() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
    };
    final response = await http.post(
        Uri.parse(Api_link.cityPrimary),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return PrimaryCityM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}
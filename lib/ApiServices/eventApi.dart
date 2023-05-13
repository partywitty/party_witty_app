import 'dart:convert';
import 'package:http/http.dart';
import '../Controller/SharePre.dart';
import '../Modal/eventM.dart';
import 'api_link.dart';

class Getevent_api {
  final _getUserDetail = GetUserDetail();

  Future<EventM> getevent_api(id) async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id": userId
    };
    final response = await post(Uri.parse(Api_link.GetEvents),
      body: data1,
    );
    var data = jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return EventM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

}
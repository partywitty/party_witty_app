import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Controller/SharePre.dart';
import 'api_link.dart';

class Photograph_Api{
  final _getUserDetail = GetUserDetail();
  Future photograph_api({photographer,availability,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      'user_id':userId,
      'photographer':photographer,
      'availability' : availability
    };
    print(body);
    final response = await http.post(Uri.parse(Api_link.SubmitClubeDetail),body:body);
    var model =jsonDecode(response.body);
    if(model['error']==false){
      CommonToast(context: context, title:model['message'], alignCenter: false);
    }else {
      CommonToast(context: context, title:model['message'], alignCenter: false);
    }
  }
}
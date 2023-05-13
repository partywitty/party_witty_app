import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Controller/SharePre.dart';
import 'api_link.dart';

class Sponser_Api{
  final _getUserDetail = GetUserDetail();
  Future sponser_api({sponsorship,sponsor_name,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      'user_id':userId,
      'sponsorship':sponsorship,
      'sponsor_name':sponsor_name??'',
    };
    print(body);
    final response = await http.post(Uri.parse(Api_link.SubmitClubeDetail),body:body);
    var model =jsonDecode(response.body);
    print('response${response.body}');
    print('body${body}');
    if(model['error']==false){
      print('guest$model');
      CommonToast(context: context, title:model['message'], alignCenter: false);
    }else {
      CommonToast(context: context, title:model['message'], alignCenter: false);
    }
  }
}

class Wantsponser_Api{
  final _getUserDetail = GetUserDetail();
  Future wantsponser_api({want_sponsorship,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      'user_id': userId,
      'want_sponsorship':want_sponsorship,
    };
    final response = await http.post(Uri.parse(Api_link.SubmitClubeDetail),body:body);
    var model =jsonDecode(response.body);
    print('response${response}');
    if(model['error']==false){
      print('guest$model');
      CommonToast(context: context, title:model['message'], alignCenter: false);
    }else {
      CommonToast(context: context, title:model['message'], alignCenter: false);
    }
  }
}

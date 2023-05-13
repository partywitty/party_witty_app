
import 'dart:convert';
import 'package:flutter_app/Controller/SharePre.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


import 'api_link.dart';

class Createvent_Api{

  final _getUserDetail=GetUserDetail();
  Future createvent({event_name,event_type_id,start_date,end_date,entry_fees,
    photo,video,artist_type,artist_name,BuildContext? context}) async{
    var userId = await _getUserDetail.getUserData('id');
try {
  var request = http.MultipartRequest('POST', Uri.parse(Api_link.AddEvent));
  request.fields.addAll({
    "user_id": 1.toString(),
    "event_name": event_name,
    "event_type_id": event_type_id,
    "start_date": start_date,
    "end_date": end_date,
    "entry_fees": entry_fees,
    "artist_type": artist_type,
    "artist_name": artist_name,
  });
  request.files.add(await http.MultipartFile.fromPath('photo', photo));
  request.files.add(await http.MultipartFile.fromPath('video', video));
  http.StreamedResponse response = await request.send();
  print('The requested fields are ${request.fields}');
  print('The response fields are ${response}');
  if (response.statusCode == 200) {
    print('------------------------------------------------success');
    var responseJson = await response.stream.bytesToString();
    var responseDecode = jsonDecode(responseJson);
    if (responseDecode['error']) {
      print('The image response is ${responseDecode}');
    } else {
      CommonToast(
          context: context, title: 'File upload successful', alignCenter: true);
      print('The image response else is ${responseDecode}');
    }
  }
  else {
    print(response.reasonPhrase);
  }
}catch(e){
  print(e);
}
  }

}
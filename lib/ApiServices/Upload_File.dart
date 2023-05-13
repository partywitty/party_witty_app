
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Modal/uploadImageM.dart';
import 'api_link.dart';
import 'package:http/http.dart' as http;

class fileUploadList {
  final _getUserDetail = GetUserDetail();
  Future<UploadImageM> uploadImageApi({type}) async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "type" : type,
      "profile" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.imageList),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return UploadImageM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future imageProgress({file}) async{
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
      request.files.add(await http.MultipartFile.fromPath('file_path', file));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print('------------------------------------------------success');
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          print('The image response is ${responseDecode}');

        }else{
          CommonToast(context: '', title: 'File upload successful', alignCenter: true);
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

  Future postImage({file,title,type,required BuildContext context}) async{
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.uploadfile));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'type': type,
        'perfomed_at': title,
      });
      request.files.add(await http.MultipartFile.fromPath('path', file));
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{
          CommonToast(context: context, title: 'File upload successful', alignCenter: true);
          SharePre.setEndPage(responseDecode['data']['endpage']);
          DataManager.getInstance().setEndPage(responseDecode['data']['endpage']);
          Navigator.pop(context);
          print(responseDecode);
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }

  }

  Future deleteMedia({
    required String mediaId,
    required BuildContext context,}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.deleteMedia));
      request.fields.addAll({
        'id': mediaId,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => budgetScreen(),));
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      print(e);
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/SharePre.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Controller/style.dart';
import '../Modal/getFloorM.dart';
import 'api_link.dart';

class ClubRegistration{
  final _getUserDetail = GetUserDetail();

  Future ClupAddress({clubname,address, landmark,state , city, pincode, I_am,contactNo,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var data = {
      'user_id':userId,
      'name_of_club': clubname,
      'address': address,
      'landmark': landmark,
      'state': state,
      'city': city,
      'pincode': pincode,
      'iam': I_am,
      'poc': contactNo,

    };
    print(data);
    print("working");
    final response = await http.post(
      Uri.parse(Api_link.submitClubAddress),
      body: data,
    );
    var model = jsonDecode(response.body);
    print('modaldata${model}');
    if (model['error'] == false) {
      print('model${data}');
      CommonToast(context: context, title: model["message"], alignCenter: false);
      return model;
    } else {
      CommonToast(context: context, title: model["message"], alignCenter: false);
      throw Exception('Failed to load post');
    }
  }

  Future guest_api({guest_form,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      'user_id':userId,
      'guest_form':guest_form,
    };
    print(body);
    final response = await http.post(Uri.parse(Api_link.SubmitClubeDetail),body:body);
    var model =jsonDecode(response.body);
    print('response${response}');
    if(model['error']==false){
      print('guest$model');
      print('working');
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }else {
      print(' not working');
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }
  }

  Future projector_api({live_match_season,projector_screen,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      'user_id':userId,
      'live_match_season':live_match_season,
      'projector_screen':projector_screen,
    };
    print(body);

    final response = await http.post(Uri.parse(Api_link.SubmitClubeDetail),body:body);
    var model =jsonDecode(response.body);
    print('response${response.body}');
    if(model['error']==false){
      print('guest$model');
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }else {
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }
  }

  Future Dj_avalabity_api({dj_avaibility,dance_floor,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      'user_id':userId,
      'dj_avaibility':dj_avaibility,
      'dance_floor':dance_floor,
    };
    print(body);
    final response = await http.post(Uri.parse(Api_link.SubmitClubeDetail),body:body);
    var model =jsonDecode(response.body);
    print('response${response.body}');
    if(model['error']==false){
      print('guest$model');
      print('working');
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }else {
      print(' not working');
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }
  }

  Future numberOfFlore({numberFlore,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      'user_id':userId,
      'no_of_floor':numberFlore,
    };
    print(body);
    final response = await http.post(Uri.parse(Api_link.SubmitClubeDetail),body:body);
    var model =jsonDecode(response.body);
    if(model['error']==false){
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }else {
      CommonToast(context: context, title: model["message"], alignCenter: false);
    }
  }

  Future<GetFloorM> getFloorApi({subArtist}) async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "club_id" : userId
    };
    final response = await post(Uri.parse(Api_link.getFloor),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return GetFloorM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}

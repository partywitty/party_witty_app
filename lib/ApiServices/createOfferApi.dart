import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/SharePre.dart';
import 'package:http/http.dart' as http;
import 'api_link.dart';
class Createoffer_Api{
  final _getUserDetail=GetUserDetail();
  Future createoffer({name,startdate,enddate,day ,starttime,endtime,people,mrp,price,deal_type,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    var data = {
      'user_id':1.toString(),
      'name': name,
      'start_date': startdate,
      'end_date': enddate,
      'valid_on': day,
      'start_time': starttime,
      'end_time': endtime,
      'allow_persons': people,
      'mrp': mrp,
      'offer_price': price,
      'deal_type': deal_type,
    };
    final response = await http.post(Uri.parse(Api_link.SubmitOffer),
      body: data,
    );
    print("create offer========${userId.toString}");
    var model = jsonDecode(response.body);
    print('modaldata${model}');

    if (model['error'] == false) {
      CommonToast(context: context, title:model['message'], alignCenter: false);
      return model;
    } else {
      CommonToast(context: context, title:model['message'], alignCenter: false);
      throw Exception('Failed to load post');
    }
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:flutter_app/Modal/eventM.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Modal/getproductM.dart';


class Getproduct_api {

  Future<GetproductM> getproduct_api(id)
  async {
    // var userId = await _getUserDetail.getUserData('id');
    var body = {
      "user_id": 1.toString()
    };
    final response = await post(Uri.parse(Api_link.GetProduct),
      body: body,
    );
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GetproductM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}

class Getevent_api {

  Future<EventM> getevent_api(id)
  async {
    // var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : 1.toString()
    };
    final response = await post(  Uri.parse(Api_link.GetEvents),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return EventM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }}



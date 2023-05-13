import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:flutter_app/Modal/eventM.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../Controller/SharePre.dart';
import '../Modal/dealsoldM.dart';
import '../Modal/getproductM.dart';


class DealSold_api {
  final _getUserDetail = GetUserDetail();
  Future<DealsoldM> getproduct_api(id)
  async {
     var userId = await _getUserDetail.getUserData('id');
    var body = {
      "offer_id": userId
    };
    final response = await post(Uri.parse(Api_link.OffersList),
      body: body,
    );
    var data = jsonDecode(response.body);
    print("data----$data");
    if (response.statusCode == 200) {
      return DealsoldM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}

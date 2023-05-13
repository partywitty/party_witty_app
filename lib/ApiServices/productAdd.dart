
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_link.dart';
class Addproduct_api {
  String? product_name;

  Future addproduct_api(
      {product_name, product_size, price, server_people,context}) async {
    var body = {
      'user_id': 1.toString(),
      'product_name': product_name,
      'server_people': server_people,
      'product_size': product_size,
      'price': price
    };
    print('body${body}');

    final response =
    await http.post(Uri.parse(Api_link.AddProducts), body: body);
    var model = jsonDecode(response.body);
    if (model['error'] == false) {
      CommonToast(context: context, title:model['message'], alignCenter: false);
    } else {
      CommonToast(context: context, title:model['message'], alignCenter: false);
      throw Exception('Failed to load post');
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:http/http.dart' as http;

class Updateproduct_api {
  String? product_name;

  Future updateproduct_api({ id,product_name, product_size, price, server_people,context}) async {
    var body = {
      "id":id.toString()  ,
      'user_id': 1.toString(),
      'product_name': product_name,
      'server_people': server_people,
      'product_size': product_size,
      'price': price
    };
    print('update body-----${body}');
    // var ecode = jsonEncode(body);
    final response =
    await http.post(Uri.parse(Api_link.UpdateProduct), body: body);
    var model = jsonDecode(response.body);
    print('update model-----${model}');
    if (model['error'] == false) {

      print("update working");
      CommonToast(context: context, title:model['message'], alignCenter: false);
    } else {
      CommonToast(context: context, title:model['message'], alignCenter: false);
      throw Exception('Failed to load post');
    }
  }
}

class RemoveProduct_api {
  String? product_name;

  Future removeProduct_api({ id,context}) async {
    var body = {
      "id":id.toString(),
    };
    print('update body-----${body}');
    // var ecode = jsonEncode(body);
    final response =
    await http.post(Uri.parse(Api_link.RemoveProduct), body: body);
    var model = jsonDecode(response.body);
    print('update model-----${model}');
    if (model['error'] == false) {
      CommonToast(context: context, title:model['message'], alignCenter: false);
    } else {
      CommonToast(context: context, title:model['message'], alignCenter: false);
      throw Exception('Failed to load post');
    }
  }
}
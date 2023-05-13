import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Auth/oto_page.dart';
import '../Controller/SharePre.dart';
import 'api_link.dart';

class Signup_api extends GetxController {
  RxBool isLoading = false.obs;
  String token = '';
  String userId = '';
  String endPage = '';
  final get_user_detail = GetUserDetail();

  Future<void> Signup_Api(
      {required String userName,
        required String contactNo,
        required String email,
        required String password,
        required String whatsApp,
        required String gender,
        required String fcmToken,
        required BuildContext context,
      }) async {
    try{
      //  String? token = await FirebaseMessaging.instance.getToken();
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.signup));
      request.fields.addAll({
        'password': password,
        'email':email,
        'gender':gender,
        'contact_no': contactNo,
        'username': userName,
        'watsapp_no': whatsApp,
        'fcm' :  fcmToken
      });
      http.StreamedResponse response = await request.send();
      print(request.files);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Email already exist', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Signup successful', alignCenter: true);
         Navigator.push(context, MaterialPageRoute(builder: (context) => Otp_page(),));
         userId = responseDecode["data"]["id"].toString();
          print("user id----------------------$userId");
          await get_user_detail.setUserData("id", userId);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      isLoading.value = false;
      CommonToast(context:context, title: 'Internal Server Error', alignCenter: true);
      print(e);
    }
  }
}
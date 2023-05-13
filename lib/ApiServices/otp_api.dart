import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Auth/serviceOtp.dart';
import '../Auth/setPassword.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Screens/bottomSheet.dart';
import 'api_link.dart';

class Otp_Api extends GetxController {
  final _getUserDetail = GetUserDetail();
  final get_user_detail = GetUserDetail();
  RxBool isLoading = false.obs;
  String token = '';
  String userId = '';
  String endPage = '';
  String role = '';

  Future<void> otp_api({otp,required BuildContext context}) async {
    try{
      var userIds = await _getUserDetail.getUserData('id');
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.otp_api));
      request.fields.addAll({
        'user_id': userIds,
        'otp': otp,
      });
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Incorrect OTP', alignCenter: true);
        } else {
          userId = responseDecode["data"]["id"].toString();
         role = responseDecode['data']['role'];
          if(SharePre.setUserType(responseDecode['data']['role']) == null){
            SharePre.setUserType("");
          }else{
            SharePre.setUserType(responseDecode['data']['role']);
          }
          SharePre.setName(responseDecode['data']['username']);
          SharePre.setEmail(responseDecode['data']['email']);
          SharePre.setNumber(responseDecode['data']['contact_no']);
          DataManager.getInstance().setName(responseDecode['data']['username']);
          DataManager.getInstance().setEmail(responseDecode['data']['email']);
          DataManager.getInstance().setNumber(responseDecode['data']['contact_no']);
          if(DataManager.getInstance().setUserType(responseDecode['data']['role']) == null){
            DataManager.getInstance().setUserType("");
          }else{
            DataManager.getInstance().setUserType(responseDecode['data']['role']);
          }
         await get_user_detail.setUserData("id", userId);
       //  await get_user_detail.setUserData("role", role);
         print("user id----------------------$userId");
        // print("role----------------------${role}");
          Navigator.pushNamed(context, '/artist');
       }
        isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("-----------otp api error----------");
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> forGetOtp({otp,userIds,required BuildContext context}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.otp_api));
      request.fields.addAll({
        'user_id': userIds,
        'otp': otp,
      });
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Incorrect OTP', alignCenter: true);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => setPassword(userId: responseDecode["data"]['id'].toString()),));
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      print("-----------otp api error----------");
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> serviceOtpVerify({otp,required BuildContext context}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.serviceVerifyOtp));
      request.fields.addAll({
        'user_id': userId,
        'otp': otp,
      });
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Incorrect OTP', alignCenter: true);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => bottomSheet(),));
          serviceDialog(context);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      print("-----------otp api error----------");
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> serviceDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF2D2B42),
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5.0,top: 5.0),
                              child: Icon(Icons.cancel_outlined,color: Colors.white,size: 24,),
                            )),
                      ],
                    ),
                    Image.asset('assests/img.png',fit: BoxFit.fill,height: 50,),
                    const Text("Thanks for completing the profile with partywitty, your profile is under review.",
                        style: signUpTitle,textAlign: TextAlign.center),
                    const SizedBox(),
                  ],
                ),
              );
            }),
          );
        }
    );
  }

  Future<void> emailVerify({required BuildContext context}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.agreementOtp));
      request.fields.addAll({
        'id': userId,
      });
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Incorrect Email', alignCenter: true);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => serviceOtp(),));
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> artist_role({required var role,required BuildContext context}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.setRole));
      request.fields.addAll({
        'user_id': userId,
        'role': role,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'something wrong', alignCenter: true);
        } else {
          SharePre.setUserType(responseDecode['data']['role'].toString());
          DataManager.getInstance().setUserType(responseDecode['data']['role'].toString());
        }
        print(responseDecode);
        print(responseDecode[role.toString()]);
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      CommonToast(context:context, title: 'Internal Server Error', alignCenter: true);
      print(e);
    }
  }
}
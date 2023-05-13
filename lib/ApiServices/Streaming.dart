
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Modal/StreamingplatM.dart';
import '../Modal/addressM.dart';
import '../Modal/bankDetailsM.dart';
import '../Modal/bankNameM.dart';
import '../ArtistRagistration/prefer_city.dart';
import '../Modal/getIntroM.dart';
import '../Modal/instaDetailsM.dart';
import '../Modal/managerDetailsM.dart';
import 'api_link.dart';

class StreamingApi extends GetxController {
  final _getUserDetail = GetUserDetail();
  Future stream_submit({
    required String spotify,
    required String amazon,
    required String jio,
    required String apple,
    required String tidel,
    required String deezer,
    required String pandoora,
    required String qubon,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.getStreaming));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'spotify_url':spotify,
        'amazon_prime':amazon,
        'jio_savan':jio,
        'apple_music':apple,
        'tidel':tidel,
        'deezer': deezer,
        'pandoora': pandoora,
        'qubon': qubon,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'User name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
        }
       // isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      //isLoading.value = false;
      CommonToast(context:'', title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  Future insta_submit({required String url,required String follower, required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.instaLink));
      request.fields.addAll({
        'user_id': userId,
        'intagram_link': url,
        'intagram_follower': follower,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'User id is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
        }
        // isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      //isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  Future facebook_submit({required String url,required String follower, required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.facebookLink));
      request.fields.addAll({
        'user_id': userId,
        'facebook_link': url,
        'facebook_follower': follower,
        'profile_id': DataManager.getInstance().getProfile().toString(),
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'User id is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
        }
        // isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      //isLoading.value = false;
      CommonToast(context:'', title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  Future address_submit({file,flat,landmark,state,city,pinCode,adhar,required BuildContext context}) async{
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.addressSubmit));
      request.fields.addAll({
        'user_id': userId,
        'profile_id' : DataManager.getInstance().getProfile().toString(),
        'flat_no': flat,
        'landmark': landmark,
        'state': state,
        'city': city,
        'pincode': pinCode,
        'aadhar_number': adhar,
      });
      request.files.add(await http.MultipartFile.fromPath('id_proof', file));
      print(file);
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'something wrong', alignCenter: false);
        }else{
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
          Get.to(const Prefer_city());
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Prefer_city(),));
        }
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: false);
      }
    }catch(e){
      print(e);
    }

  }

  Future bank_submit({file,bankName,branch,accountNo,ifsc,panNo,panName,required BuildContext context}) async{
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.bankSubmit));
      request.fields.addAll({
        'user_id': userId,
        'profile_id' : DataManager.getInstance().getProfile().toString(),
        'bankname': bankName,
        'branch': branch,
        'acount_number': accountNo,
        'ifsccode': ifsc,
        'pan_number': panNo,
        "pan_name" : panName
      });
      request.files.add(await http.MultipartFile.fromPath('cancel_chaque', file));
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'something wrong', alignCenter: false);
        }else{
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Prefer_city(),));
        }
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: false);
      }
    }catch(e){
      print(e);
    }

  }

  Future<BankDetailsM> getBankDetails() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
    };
    print("--------------$body");
    final response = await http.post(
        Uri.parse(Api_link.getBankDetails),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return BankDetailsM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<ManagerDetailsM> getManagerDetails() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
    };
    print("--------------$body");
    final response = await http.post(
        Uri.parse(Api_link.getManagerDetailsUrl),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return ManagerDetailsM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<StreamingplatM> getStreamingApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
    };
    print("--------------$body");
    final response = await http.post(
        Uri.parse(Api_link.getStreamingData),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return StreamingplatM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<InstaDetailsM> getInstaApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
    };
    print("--------------$body");
    final response = await http.post(
        Uri.parse(Api_link.getInstaData),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return InstaDetailsM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<GetIntroM> getIntroApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
    };
    final response = await http.post(
        Uri.parse(Api_link.getIntroUrl),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return GetIntroM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<AddressM> getAddressDetails() async {
    var userId = await _getUserDetail.getUserData('id');
    var body={
      "user_id": userId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
    };
    print("--------------$body");
    final response = await http.post(
        Uri.parse(Api_link.addressDetails),
        body: body
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return AddressM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<BankNameM> bankName() async {
    final response = await http.get(
      Uri.parse(Api_link.bankNames),
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return BankNameM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

}
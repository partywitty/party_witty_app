

// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import '../ApiServices/api_link.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';

class setPassword extends StatefulWidget {
  String userId;
  setPassword({Key? key,required this.userId}) : super(key: key);

  @override
  State<setPassword> createState() => _setPasswordState();
}

class _setPasswordState extends State<setPassword> {
  TextEditingController passController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 10.0,
              ),
              child: Text('New Password',style: textLabel),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
              controller: passController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.7),
                      borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 10.0,
              ),
              child: Text('Confirm Password',style: textLabel),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
              controller: confirmController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.7),
                      borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
              ),
            ),
            const SizedBox(height: 20.0,),

            Center(
              child: GestureDetector(
                onTap: (){
                  if(passController.text != confirmController.text || passController.text.isEmpty  || confirmController.text.isEmpty ){
                    CommonToast(context: context, title: 'Password not match', alignCenter: false);
                  }else{
                    changePassword(
                      confirm: confirmController.text,
                      context: context,
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset(0.1, 0.1),
                      end: FractionalOffset(0.7, 0.1),
                      colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: const Text('Submit', style: buttonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> changePassword({confirm,required BuildContext context}) async {
    final _getUserDetail = GetUserDetail();
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.changePass));
      request.fields.addAll({
        'user_id': widget.userId,
        'password': confirm,
      });
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Incorrect Password', alignCenter: false);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
          CommonToast(context: context, title: 'Password change successful', alignCenter: false);
        }
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
      print("-----------otp api error----------");
      print(e);
    }
  }
}

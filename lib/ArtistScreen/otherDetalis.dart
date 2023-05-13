
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Streaming.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class otherDetails extends StatefulWidget {
  const otherDetails({Key? key}) : super(key: key);

  @override
  State<otherDetails> createState() => _otherDetailsState();
}

class _otherDetailsState extends State<otherDetails> {
  final _getUserDetail = GetUserDetail();
  TextEditingController fbLinkController = TextEditingController();
  TextEditingController fbFollowController = TextEditingController();
  TextEditingController instaLinkController = TextEditingController();
  TextEditingController instaFollowController = TextEditingController();
  TextEditingController introMessageController = TextEditingController();

  load(){
    StreamingApi().getInstaApi().then((value)  {
      var data = value.data;
      setState((){
        data!.facebookLink == null ? fbLinkController.text : fbLinkController.text = data.facebookLink!;
        data.facebookFollower == null ? fbFollowController.text : fbFollowController.text = data.facebookFollower!;
        data.intagramLink == null ? instaLinkController.text : instaLinkController.text = data.intagramLink!;
        data.intagramFollower == null ? instaFollowController.text : instaFollowController.text = data.intagramFollower!;
      });
    });
    StreamingApi().getIntroApi().then((value) {
      var intro = value.data;
      setState((){
        intro!.introduction == null ? introMessageController.text : introMessageController.text = intro.introduction!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Text("Facebook Details",style: GoogleFonts.poppins(textStyle: textLabel),),
          const SizedBox(height: 10),
          TextFormField(
            controller: fbLinkController,
            autofocus: false,
            style:textFill,
            decoration: inputDecoration(context, hint: "Facebook link"),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: fbFollowController,
            autofocus: false,
            style: textFill,
            decoration: inputDecoration(context, hint: "Followers"),
          ),
          const SizedBox(height: 10),
          Text("Instagram Details",style: GoogleFonts.poppins(textStyle: textLabel),),
          const SizedBox(height: 10),
          TextFormField(
            controller: instaLinkController,
            autofocus: false,
            style: textFill,
            decoration: inputDecoration(context, hint: "Instagram link"),
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: instaFollowController,
            autofocus: false,
            style:textFill,
            decoration: inputDecoration(context, hint: "Followers"),
          ),
          const SizedBox(height: 10),
          Text("Intro Message",style: GoogleFonts.poppins(textStyle: textLabel),),
          const SizedBox(height: 10),
          TextFormField(
            controller: introMessageController,
            autofocus: false,
            style: textFill,
            maxLines: 5,
            maxLength: 150,
            decoration: inputDecoration(context, hint: "Message"),
          ),

          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              facebookSubmit(
                context: context,
                faceLink: fbLinkController.text,
                faceFollower: fbFollowController.text,
                instaLink: instaLinkController.text,
                instaFollow: instaFollowController.text
              ).whenComplete(() {
                load();
              });
              introSubmit(
                context: context,
                description: introMessageController.text
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('Update',style: GoogleFonts.poppins(textStyle: buttonText)),
            ),
          ),
        ],
      ),
    );
  }
  Future facebookSubmit({required String faceLink,required String faceFollower,instaLink,instaFollow, required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.facebookLink));
      request.fields.addAll({
        'user_id': userId,
        'facebook_link': faceLink,
        'facebook_follower': faceFollower,
        'intagram_link': instaLink,
        'intagram_follower': instaFollow,
        'end_page' : "not update",
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
        }print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
      }}catch(e){
      print("-----------------------error");
      print(e);
    }
  }

  Future<void> introSubmit({required String description,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.introSubmit));
      request.fields.addAll({
        'user_id': userId,
        'introduction':description,
        'end_page' : "nothing"
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'description is required', alignCenter: false);
        } else {
        //  CommonToast(context: context, title: 'Introduction Submitted Successfully', alignCenter: false);
        }
      //  isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
     // isLoading.value = false;
      CommonToast(context:context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }
}

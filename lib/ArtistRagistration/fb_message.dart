import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import 'package:http/http.dart' as http;
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'bank_page.dart';
import 'prefer_city.dart';

class FaceBook extends StatefulWidget {
  const FaceBook({Key? key}) : super(key: key);

  @override
  State<FaceBook> createState() => _FaceBookState();
}

class _FaceBookState extends State<FaceBook> {

  TextEditingController fbLink = TextEditingController();
  TextEditingController follower = TextEditingController();
  TextEditingController instaLink = TextEditingController();
  TextEditingController instaFollower = TextEditingController();

  final _getUserDetail = GetUserDetail();
  var statusCheck;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height * 0.8,
                child: Image.asset(
                  'assests/A_img.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 15),
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    width: width,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Facebook Page Likes with URL",style: GoogleFonts.poppins(textStyle: textLabel),),
                          const SizedBox(height: 20,),
                          TextFormField(
                             controller: fbLink,
                              autofocus: false,
                              style:textFill,
                            decoration: inputDecoration(context, hint: "Facebook link"),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                            controller: follower,
                              autofocus: false,
                              style: textFill,
                            decoration: inputDecoration(context, hint: "Followers"),
                          ),
                          const SizedBox(height: 20,),

                          Text("Insta Followers with URL",style: GoogleFonts.poppins(textStyle: textLabel),),
                          const SizedBox(height: 20,),
                          TextFormField(
                              controller: instaLink,
                              autofocus: false,
                              style: textFill,
                            decoration: inputDecoration(context, hint: "Instagram link"),
                          ),
                          const SizedBox(height: 20,),
                          TextFormField(
                              controller: instaFollower,
                              autofocus: false,
                              style:textFill,
                            decoration: inputDecoration(context, hint: "Followers"),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  facebookSubmit(
                                    context: context,
                                    faceLink: fbLink.text,
                                    faceFollower: follower.text,
                                    instaLink: instaLink.text,
                                    instaFollow: instaFollower.text
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(Bank_page());
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: Text('Skip',style: GoogleFonts.poppins(textStyle: buttonText)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
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
          Get.to(const Bank_page());
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
        }print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
      }}catch(e){
      print("-----------------------error");
      print(e);
    }
  }
}


// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:octo_image/octo_image.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Modal/uploadImageM.dart';
import 'artistRedDrawer.dart';

class artistHomeScreen extends StatefulWidget {
  const artistHomeScreen({Key? key}) : super(key: key);

  @override
  State<artistHomeScreen> createState() => _artistHomeScreenState();
}

class _artistHomeScreenState extends State<artistHomeScreen> {
  final double _height = Get.height, _width = Get.width;
  final _getUserDetail = GetUserDetail();
  bool loader = false;
  var dataImage;
  List<uploadData> profilePhoto = [];
  load(){
    setState(() {
      profilePercentage(context: context).then((value) {
        setState(() {
          loader = true;
        });
      });
    });
    fileUploadList().uploadImageApi(type: "1").then((value) {
      setState(() {
        //profilePhoto = value.data!;
        dataImage = value.data![0].filePath;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  var totalPercentage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191a),
      drawer: loader == false ?
      const CircularProgressIndicator() :
      ArtistRedDrawer().getDrawer(context,totalPercentage),
      appBar: AppBar(
          backgroundColor: appBarColor,
          actions: const [
            Icon(Icons.search,size: 24,color: Colors.white),
            SizedBox(width: 10),
            Icon(Icons.notifications_none,color: Colors.white,size: 24,),
            SizedBox(width: 10),
            Icon(Icons.account_balance_wallet_outlined,color: Colors.white,size: 24),
            SizedBox(width: 10),
          ],
        ),
      body: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        itemCount: 2,
        itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
          decoration: BoxDecoration(
            color: drawerColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: OctoImage.fromSet(
                      fit: BoxFit.fill,
                      image: const NetworkImage(
                          "https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png" ),
                      octoSet: OctoSet.circleAvatar(
                          backgroundColor: appColor,
                          text: Text("M",style: GoogleFonts.poppins(color: Colors.white,fontSize: 50))
                      )
                  ),
                ),
                title: Text("Malvika",style: GoogleFonts.poppins(textStyle: cardTitle)),
                subtitle: Text("20 hour ago",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                trailing: Column(
                  children: [
                    const Icon(Icons.favorite,color: Colors.red,size: 24),
                    Text("1.2k",style: GoogleFonts.poppins(textStyle: cardSubTitle),)
                  ],
                ),
              ),
              Stack(
                children: [
                  Image.asset("assests/profile1.png",width: _width,fit: BoxFit.fill),
                  Positioned(
                      child: Row(
                        children: [
                          Icon(Icons.share,size: 24,color: Colors.white),
                        ],
                      ))
                ],
              ),
            ],
          ),
        );
      },),
    );
  }
  Future<void> profilePercentage({required BuildContext context}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.profilePercentage));
      request.fields.addAll({
        'user_id': userId,
        'profile_id' : DataManager.getInstance().getProfile().toString()
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Venue Name is required', alignCenter: false);
          return  responseDecode['data'];
        } else {
          setState(() {
            totalPercentage =  responseDecode['data'];
            print(totalPercentage);
          });
          return  responseDecode['data'];

        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
      // isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }
}

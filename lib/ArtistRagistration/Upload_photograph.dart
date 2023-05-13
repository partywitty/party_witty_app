
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/photo_with_caption.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class Upload_photograph extends StatefulWidget {
  const Upload_photograph({Key? key}) : super(key: key);

  @override
  State<Upload_photograph> createState() => _Upload_photographState();
}

class _Upload_photographState extends State<Upload_photograph> {
  String? profileUpload;
  late File proImage;

  String? coverUpload;
  late File covImage;
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Loading().onDone();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Upload Photographs",style: GoogleFonts.poppins(textStyle: appBarText)),
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: (){
        //     Navigator.pop(context);
        //   },
        //     child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 24)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0),
          Text("Upload Cover Photo",style: GoogleFonts.poppins(textStyle :bigTitle)),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    final result = await FilePicker.platform.pickFiles(type: FileType.image);
                    covImage=File(result!.files.single.path!);
                    setState(() {
                      coverUpload=result.files.single.path;
                    }
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 1.5,
                              width: 32,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 32,
                              width: 1.5,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0,),
              Container(
                alignment: Alignment.center,
                height: 70,
                width: 70,
                decoration: coverUpload==null ?
                BoxDecoration(
                  //border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),):
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                  image: DecorationImage(
                    image: Image.file(covImage).image,fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10.0),
          Text("Upload Profile Photo",style: GoogleFonts.poppins(textStyle :bigTitle)),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    final result = await FilePicker.platform.pickFiles(type: FileType.image);
                    proImage=File(result!.files.single.path!);
                    setState(() {
                      profileUpload=result.files.single.path;
                    }
                    );
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 1.5,
                              width: 32,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 32,
                              width: 1.5,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20.0,),
              Container(
                alignment: Alignment.center,
                height: 70,
                width: 70,
                decoration: profileUpload==null ?
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15)):
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey),
                  image: DecorationImage(
                    image: Image.file(proImage).image,fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 60,
        alignment: Alignment.bottomCenter,
        child: isLoading ?
        const Center(child: CircularProgressIndicator(color: appColor,)) :
        GestureDetector(
          onTap: () {
            setState(() {
              isLoading = true;
            });
            if(coverUpload == null || profileUpload == null){
              CommonToast(context: context, title: 'Please upload cover and profile photo', alignCenter: false);
              setState(() {
                isLoading = false;
              });
            }else {
              Loading().onLoading();
              saveProfileApi(
                context: context,
                profile: proImage.path,
                cover: covImage.path,
              ).whenComplete(() => {
                Loading().onDone(),
              });
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: boxDecoration(),
            child: const Text('Submit',style: buttonText),
          ),
        ),
      ),
    );
  }
  Future saveProfileApi({profile,cover,required BuildContext context}) async{
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.profileImage));
      request.fields.addAll({
        'user_id': userId,
        "profile_id": DataManager.getInstance().getProfile().toString(),
      });
      request.files.add(await http.MultipartFile.fromPath('profile', profile));
      request.files.add(await http.MultipartFile.fromPath('cover', cover));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{
          Get.to(const captionPhotos());
        //  Get.to(captionPhotos());
          setState(() {
            isLoading = false;
          });
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        setState(() {
          isLoading = false;
        });
        Loading().onError(msg: "Server error");
      }
    }catch(e){
      print(e);
      Loading().onError(msg: "Server error");
    }

  }
}

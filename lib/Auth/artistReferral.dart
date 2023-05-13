
// ignore_for_file: camel_case_types, must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../ArtistRagistration/Artist_type.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../ClubRagistration/address_page.dart';
import '../Modal/AritistM.dart';

class artistReferral extends StatefulWidget {
  var type;
  artistReferral({Key? key,this.type}) : super(key: key);

  @override
  State<artistReferral> createState() => _artistReferralState();
}

class _artistReferralState extends State<artistReferral> {
  final double _height = Get.height, _width = Get.width;
  TextEditingController reffral = TextEditingController();
  final _getUserDetail = GetUserDetail();
  String? coverUpload;
  late File covImage;
  List<Artists> getArtistLists = [];
  String? status;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load(){
    GetArtistList().getArtist().then((value) {
      setState(() {
        status = value.data!.isProfile;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: axisDirectionToAxis(
            AxisDirection.down,
          ),
          child: SizedBox(
            width: width,
            height: height/1,
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height*0.7,
                  child: Image.asset(
                    'assests/A_img.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   child: IconButton(
                //     color: Colors.white,
                //     icon: const Icon(Icons.arrow_back_ios),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //   ),
                // ),
                Positioned(
                    bottom: 0,
                    child: Container(
                       height: height/2.5,
                      width: width,
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("  Enter Referral Code", style: GoogleFonts.poppins(textStyle: headingTitle)),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: reffral,
                                autofocus: false,
                                style: textFill,
                                decoration: inputDecoration(
                                  context,
                                  hint: "Enter referral code"
                                ),
                            ),
                            const SizedBox(height: 20),
                            widget.type == "Club" ?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // Get.to(Artist_type());
                                    referralApi(referralCode: reffral.text,context: context).then((value) {}).then((value) {});
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 140,
                                    height: 50.0,
                                    decoration: boxDecoration(),
                                    child: const Text('Submit',style: buttonText),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(Address_page());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 140,
                                    height: 50.0,
                                    decoration: boxDecoration(),
                                    child: const Text('Skip',style: buttonText),
                                  ),
                                ),
                              ],
                            ) :
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  // Get.to(Artist_type());
                                  referralApi(referralCode: reffral.text,context: context).then((value) {}).then((value) {});
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
                            const SizedBox(height: 15),
                            widget.type == "Club" ?
                            Center(
                              child: Text(
                                "Do you have a referral code ?",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Colors.white),
                              ),
                            ) :
                            InkWell(
                              onTap: (){
                                if(status == "1"){
                                  Navigator.pushNamed(context, '/artist_list');
                                }else {
                                   uploadDialog(context);
                                }
                              },
                              child: Center(
                                child: Text("Seeking for the referral code ?",style: GoogleFonts.poppins(textStyle: textLabel),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future referralApi({required String referralCode,required BuildContext context}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.Referral));
      request.fields.addAll({
        'user_id': userId,
        'referral_code': referralCode,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Incorrect Referral Code.', alignCenter: false);
        } else {
          widget.type == "Club" ?
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Address_page(),),(route)=> false) :
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Artist_type(),),(route)=> false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      CommonToast(context:'', title: 'Internal server error', alignCenter: true);
      print(e);
    }
  }

  Future<void> uploadDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF2D2B42),
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(
                builder: (context, StateSetter setState) {
              return Container(
                alignment: Alignment.center,
                height: _height*0.30,
                //width: 200,
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
                            child: const Icon(Icons.clear,color: Colors.white,size: 24,))
                      ],
                    ),
                    const Text("Upload the picture that will be shown referral code request",style: cardTitle,textAlign: TextAlign.center),
                    const SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            focusColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap:()async{
                              final result = await FilePicker.platform.pickFiles(type: FileType.image);
                              covImage=File(result!.files.single.path!);
                              setState(() {
                                coverUpload=result.files.single.path;
                                print('rajjgkjkj----------------$coverUpload');
                              }
                              );
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF434445),
                                  borderRadius: BorderRadius.circular(100)),
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
                            borderRadius: BorderRadius.circular(100),):
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: Image.file(covImage).image,fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          uploadProfile(
                            context: context,
                            file: covImage.path,
                            type: "15"
                          ).whenComplete(() {
                            load();
                          });
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
                    const SizedBox(height: 10.0),
                  ],
                ),
              );
            }),
          );
        }
    );
  }

  Future uploadProfile({file,type,required BuildContext context}) async{
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'type': type,
        'location': "",
        'caption': "",
        'with_photo': "",
      });
      request.files.add(await http.MultipartFile.fromPath('single_file', file));
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{
          CommonToast(context: context, title: 'File upload successful', alignCenter: true);
          Navigator.pop(context);
         // Navigator.pushNamed(context, '/artist_list');
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        print(response.reasonPhrase);
        setState(() {
         // isLoading = false;
        });
      }
    }catch(e){
      print(e);
    }

  }
}

// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../ArtistRagistration/upload_video.dart';

class allImageUpload extends StatefulWidget {
  const allImageUpload({Key? key}) : super(key: key);

  @override
  State<allImageUpload> createState() => _allImageUploadState();
}

class _allImageUploadState extends State<allImageUpload> {

  String? profileUpload;
  late File proImage;

  String? coverUpload;
  late File covImage;

  String? backUpload;
  late File backImage;

  List<File> _imageFileCropped = [];
  List<XFile> _imageFile = [];
  final ImagePicker _picker = ImagePicker();

  Widget buildGridView() {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      crossAxisCount: 3,
      children: List.generate(_imageFileCropped.length, (index) {
        File asset = _imageFileCropped[index];
        return Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: asset.path.split(".").last =="jpg" || asset.path.split(".").last =="png" || asset.path.split(".").last =="jpeg"?
                Image.file(File('${asset.path}'),width: 70,height: 70,fit: BoxFit.fill,):
                Center(child: Text(asset.path.split("/").last))
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: InkWell(
                  onTap: (){
                    setState(() {
                      _imageFileCropped.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.highlight_remove,size: 20,color: Colors.red,)),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
        children: [
          const Text("Upload Profile",style: bigTitle),
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
                        color: Color(0xFF434445),
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 1.5,
                              width: 32,
                              color: appColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 32,
                              width: 1.5,
                              color: appColor,
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
                  border: Border.all(color: appColor),
                  borderRadius: BorderRadius.circular(15),
                  // image: const DecorationImage(
                  //     image: AssetImage("assests/boy_img.png"),fit: BoxFit.cover
                  // ),
                ):
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: appColor),
                  image: DecorationImage(
                    image: Image.file(proImage).image,fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20.0),
          const Text("Upload Cover",style: bigTitle),
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
                        color: Color(0xFF434445),
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 1.5,
                              width: 32,
                              color: appColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 32,
                              width: 1.5,
                              color: appColor,
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
                  border: Border.all(color: appColor),
                  borderRadius: BorderRadius.circular(15),
                  // image: const DecorationImage(
                  //     image: AssetImage("assests/boy_img.png"),fit: BoxFit.cover
                  // ),
                ):
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: appColor),
                  image: DecorationImage(
                    image: Image.file(covImage).image,fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),


          const SizedBox(height: 20.0),
          const Text("Upload Multiple",style: bigTitle),
          const SizedBox(height: 10.0),
          _imageFileCropped.isEmpty?
          Row(
            children: [
              InkWell(
                  onTap: (){
                    takePhoto(ImageSource.gallery);
                    // loadAssets();
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color(0xFF434445),
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 1.5,
                              width: 32,
                              color: appColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 32,
                              width: 1.5,
                              color: appColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ):
          buildGridView(),
          const SizedBox(height: 50,),
        ],),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: appBarColor,
          height: 60,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              if(_imageFileCropped.isEmpty || profileUpload == null || coverUpload == null){
                CommonToast(context: context, title: 'Please upload all images', alignCenter: false);
              }else{
                uploadWithMultiple(file: _imageFileCropped);
                saveProfileApi(
                  context: context,
                  profile: proImage.path,
                  cover: covImage.path,
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: const Text('Submit',style: buttonText),
            ),
          )),
    );
  }

  Future saveProfileApi({profile,cover,required BuildContext context}) async{
    final _getUserDetail = GetUserDetail();
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.profileImage));
      request.fields.addAll({
        'user_id': userId,
        "profile_id": DataManager.getInstance().getProfile().toString(),
      });
      request.files.add(await http.MultipartFile.fromPath('profile', profile));
      request.files.add(await http.MultipartFile.fromPath('cover', cover));
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{
          print("$responseDecode-------------------------");
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }

  }

  Future<http.StreamedResponse> uploadWithMultiple({file}) async {
    final _getUserDetail = GetUserDetail();
    var userId = await _getUserDetail.getUserData('id');
    var request = http.MultipartRequest('POST', Uri.parse("https://www.partywitty.com/api/media_upload"));
    request.fields.addAll({
      'user_id': userId,
    });
    List<http.MultipartFile> filelist = [];
    for (var img in file) {
      if (img != "") {
        // File file = await getImageFileFromAssets(img);
        // print("file path===========-==-=-=-=-=--=-=-=-=-=-=-=-==-");
        // print(file.path);
        var multipartFile = await http.MultipartFile.fromPath('file_path[]',img.path,
          filename: "${img.path}",
        );
        filelist.add(multipartFile);
      }
    }
    request.files.addAll(filelist);
    // file==null?null: request.files.add(await http.MultipartFile.fromPath("images", file));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    try{
      if(response.statusCode==200){
        CommonToast(context: context, title: 'Image upload successful', alignCenter: true);
        Navigator.push(context,MaterialPageRoute(builder: (context) => Upload_video()));
        print("success");
        print(res.body);
      }else{
        print("Error");
        print(res.body);
      }
    }catch(e){
      print(e.hashCode);
    }
    return response;
  }

  Future<void> thankDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor:appBarColor,
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                alignment: Alignment.center,
                height: 220,
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5.0,top: 5.0),
                              child: Icon(Icons.cancel_outlined,color: Colors.white,size: 24,),
                            )),
                      ],
                    ),
                    Image.asset('assests/img.png',fit: BoxFit.fill,height: 40,),
                    const Text("Thanks for registering your Profile as __.",style: signUpTitle,textAlign: TextAlign.center),
                    const Text("Team will get back to you after Primary screen of your videos.",style: cardSubTitle,textAlign: TextAlign.center),
                    const SizedBox(),
                  ],
                ),
              );
            }),
          );
        }
    );
  }

  void takePhoto(ImageSource source) async {
    final List<XFile>? image = await _picker.pickMultiImage();
    setState(() {
      _imageFile = image!;
    });
    for (final XFile file in _imageFile) {
      var selectFile = File(file.path);
      _imageFileCropped.add(selectFile.absolute);
      // _cropImage(file.path);
    }
  }
}

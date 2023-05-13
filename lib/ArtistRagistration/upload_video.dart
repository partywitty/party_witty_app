// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/music_type.dart';
import 'package:flutter_app/Screens/bottomSheet.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'package:http/http.dart' as http;
import '../Controller/videoPlayer.dart';
import '../Modal/uploadImageM.dart';



class Upload_video extends StatefulWidget {
  const Upload_video({Key? key}) : super(key: key);

  @override
  State<Upload_video> createState() => _Upload_videoState();
}

class _Upload_videoState extends State<Upload_video> {
  final double _height = Get.height, _width = Get.width;
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  List<File?> files = [];

  List<imageList> selectedImage = [];

  String? profileUpload;
  late File proImage;
  bool isLoading = false;
  String? nextPage;

  getMultipleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.video
    );
    if (result != null) {
      List<File?> file = result.paths.map((path) => File(path!)).toList();
      files = file;
      setState(() {});
    } else {
      Loading().onDone();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select atLeast 1 file', style: textHint),
      ));
    }
  }

  List<uploadData> photosList = [];

  load() {
    fileUploadList().uploadImageApi(type: 3.toString()).then((value) {
      setState(() {
        photosList = value.data!;
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
        title: Text("Live performance videos",
            style: GoogleFonts.poppins(textStyle: appBarText)),
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 24)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10.0),
          Text(" Location for album",
              style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: locationController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10.0),
          Text(" Caption for album",
              style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: captionController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10.0,),
          Text(" Upload videos",
              style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 5),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () async {
                    Loading().onLoading();
                    getMultipleFile();
                    // final result = await FilePicker.platform.pickFiles(type: FileType.video);
                    // proImage=File(result!.files.single.path!);
                    // setState(() {
                    //   profileUpload=result.files.single.path;
                    //   selectedImage.add(imageList(
                    //       imagePath: proImage.path));
                    // }
                    // );
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: Color(0xFF434445),
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
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: files.length,
            itemBuilder: (BuildContext context, int index) {
              var data = files[index];
              Loading().onDone();
              return Row(
                children: [
                  Container(
                    width: _width* 0.70,
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          color: appBarColor,
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Text(data!.path.split("/").last,style: textLabel)),
                  InkWell(
                      onTap: (){
                        setState(() {
                          files.removeAt(index);
                        });
                      },
                      child: const Icon(Icons.clear,color: Colors.white,size: 24)),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          photosList.isEmpty ?  const Text("") : Text("Recently Uploaded File",style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10),
          GridView.builder(
              shrinkWrap: true,
              itemCount: photosList.length,
              physics: const ScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 10.0),
              itemBuilder: (BuildContext context, int index){
                var data = photosList[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: _height*0.10,
                            width: _width*0.25,
                            decoration: BoxDecoration(
                              color: appBarColor,
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 3.0,),
                    SizedBox(
                      width: 150,
                      child:  Text(data.location == null ? "" : "${data.location}",style: textFill,textAlign: TextAlign.center),
                    ),
                  ],
                );
              }
          ),
          const SizedBox(height: 70,)
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 100,
        alignment: Alignment.bottomCenter,
        child: isLoading ?
        const Center(child: CircularProgressIndicator(color: appColor,)) :
        GestureDetector(
          onTap: () {
            // var listOfImage = selectedImage.map((e) => e.imagePath).toList(growable: true);
            // print(listOfImage);
            setState(() {
              isLoading = true;
            });
            if (files.isEmpty) {
              CommonToast(context: context,
                  title: 'Please upload images',
                  alignCenter: false);
              setState(() {
                isLoading = false;
              });
            } else {
              Loading().onLoading();
              uploadMultiplePhotos(
                context: context,
                location: locationController.text,
                captions: captionController.text,
                type: "3",
                nextPage: "0",
                file: files,
              ).whenComplete(() => {
                load(),
                locationController.clear(),
                captionController.clear(),
                setState(() {
                  files.clear();
                }),
                Loading().onDone(),
              });
              // uploadVideo(
              //     context: context,
              //     type: "3",
              //     location: locationController.text,
              //     captions: captionController.text,
              //     file: proImage.path,
              //   nextPage: "0"
              // ).whenComplete(() =>{
              // locationController.clear(),
              // captionController.clear(),
              //   setState(() {
              //     profileUpload = null;
              //   }),
              // });
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: boxDecoration(),
            child: const Text('Submit', style: buttonText),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              setState(() {
                isLoading = true;
              });
              if (files.isEmpty) {
                CommonToast(context: context, title: 'Please upload images',alignCenter: false);
                setState(() {
                  isLoading = false;
                });
              } else {
                Loading().onLoading();
                uploadMultiplePhotos(
                  context: context,
                  location: locationController.text,
                  captions: captionController.text,
                  type: "3",
                  nextPage: "1",
                  file: files,
                ).whenComplete(() => {
                  load(),
                  locationController.clear(),
                  captionController.clear(),
                  setState(() {
                    files.clear();
                  }),
                  Loading().onDone(),
                });
              }
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(height: 5.0,),
          Text("Save and create album",
            style: GoogleFonts.poppins(textStyle: textHint),),
          const SizedBox(height: 40.0,)
        ],
      ),
    );
  }

  Future<void> thankDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: appBarColor,
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                alignment: Alignment.center,
                height: 220,
                width: 200,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5.0, top: 5.0),
                              child: Icon(
                                Icons.cancel_outlined, color: Colors.white,
                                size: 24,),
                            )),
                      ],
                    ),
                    Image.asset(
                      'assests/img.png', fit: BoxFit.fill, height: 40,),
                    const Text("Thanks for registering your Profile",
                        style: signUpTitle, textAlign: TextAlign.center),
                    const Text(
                        "Team will get back to you after Primary screen of your videos.",
                        style: cardSubTitle, textAlign: TextAlign.center),
                    const SizedBox(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => bottomSheet(),));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 140,
                        height: 30.0,
                        decoration: boxDecoration(),
                        child: const Text('Ok', style: buttonText),
                      ),
                    ),
                    const SizedBox(height: 2.0),
                  ],
                ),
              );
            }),
          );
        }
    );
  }

  Future<http.StreamedResponse> uploadMultiplePhotos(
      {nextPage, file, location, captions, type, required BuildContext context}) async {
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    var request = http.MultipartRequest(
        'POST', Uri.parse(Api_link.imageProgress));request.fields.addAll({
      'user_id': userId,
      'profile_id': DataManager.getInstance().getProfile().toString(),
      'type': type,
      'location': location,
      'caption': captions,
      'with_photo': "withVideo",
    });
    print(request.fields);
    List<http.MultipartFile> filelist = [];
    for (var img in file) {
      if (img != "") {
        var multipartFile = await http.MultipartFile.fromPath(
          'multiple_file[]', img.path,
          filename: "${img.path}",
        );
        filelist.add(multipartFile);
      }
    }
    request.files.addAll(filelist);
    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    var response = await request.send();
    final res = await http.Response.fromStream(response);
    try {
      if (response.statusCode == 200) {
        CommonToast(context: context, title: 'Image upload successful', alignCenter: false);
        setState(() {
          isLoading = false;
        });
        nextPage == "1" ? Get.to(const Upload_video()) : Get.to(Music_type());
        print(res.body);
      } else {
        print(res.body);
        setState(() {
          isLoading = false;
          Loading().onError(msg: "Server error");
        });
      }
    } catch (e) {
      Loading().onError(msg: "Server error");
    }
    return response;
  }

}
class imageList {
  String imagePath;

  imageList({required this.imagePath});
}

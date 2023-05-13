
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import 'editChannel.dart';
import '../Controller/utils.dart';
import '../Controller/videoPlayer.dart';
import '../Modal/uploadImageM.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;

class artistChannel extends StatefulWidget {
  const artistChannel({Key? key}) : super(key: key);

  @override
  State<artistChannel> createState() => _artistChannelState();
}

class _artistChannelState extends State<artistChannel> {

  List<uploadData> coverPhoto = [];
  List<uploadData> profilePhoto = [];
  List<uploadData> photosList = [];
  List<uploadData> profileVideos = [];
  List<uploadData> photoWithCeleb = [];
  List<uploadData> photoWithBrands = [];
  List<uploadData> videoWithBrands = [];
  List<uploadData> photoWithBand = [];
  List<uploadData> videoWithBand = [];
  List<uploadData> photoWithClub = [];
  List<uploadData> videoWithClub = [];
  List<uploadData> audioCoverSong = [];
  List<uploadData> videoCoverSong = [];
  List<uploadData> originalAudioSong = [];
  List<uploadData> originalVideoSong = [];

  final double _height = Get.height, _width = Get.width;

  String? coverUpload;
  late File covImage;
  String? profileUpload;
  late File proImage;

  List<File> multiplePhotographs = [];
  List<XFile> multipleImage = [];
  final ImagePicker _pickerMultiple = ImagePicker();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load(){
    fileUploadList().uploadImageApi(type: "0").then((value) {
      setState(() {
        profilePhoto = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "1").then((value) {
      setState(() {
        coverPhoto = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "2").then((value) {
      setState(() {
        photosList = value.error == true ?  [] :  value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "3").then((value) {
      setState(() {
        profileVideos = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "4").then((value) {
      setState(() {
        photoWithCeleb = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "5").then((value) {
      setState(() {
        photoWithBrands =  value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "6").then((value) {
      setState(() {
        videoWithBrands = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "7").then((value) {
      setState(() {
        photoWithBand = value.error == true ?  [] :value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "8").then((value) {
      setState(() {
        videoWithBand = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "9").then((value) {
      setState(() {
        photoWithClub =  value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "10").then((value) {
      setState(() {
        videoWithClub = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "11").then((value) {
      setState(() {
        audioCoverSong = value.error == true ?  [] :value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "12").then((value) {
      setState(() {
        videoCoverSong = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "13").then((value) {
      setState(() {
        originalAudioSong = value.error == true ?  [] : value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: "14").then((value) {
      setState(() {
        originalVideoSong =value.error == true ?  [] : value.data!;
      });
    });
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
          const SizedBox(height: 10.0,),
          const Text("Cover Photo",style: drawerSubtitle,),
          const SizedBox(height: 10.0,),
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
                      saveCoverApi(
                         context: context,
                        profile : covImage.path,
                      ).whenComplete(() {
                        load();
                      });
                    }
                    );
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                    //   type: "0",
                    // ),)).whenComplete((){
                    //   load();
                    // });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              coverPhoto.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 80,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coverPhoto.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = coverPhoto[index];
                    return Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${Api_link.imageUrl}${data.filePath}"),fit: BoxFit.fill
                          ),
                          border: Border.all(
                              color: Colors.red, width: 1),
                          borderRadius:
                          BorderRadius.circular(12)),
                      child: InkWell(
                          onTap : (){
                            setState(() {
                              fileUploadList().deleteMedia(
                                  mediaId: data.id.toString(),
                                  context: context
                              ).whenComplete(() {
                                setState(() {
                                  fileUploadList().uploadImageApi(type: "0").then((value) {
                                    setState(() {
                                      coverPhoto = value.error == true ?  [] :  value.data!;
                                    });
                                  });
                                });
                              });
                            });
                          },
                          child: const Icon(Icons.clear,color: Colors.white,size: 24,)),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const SizedBox(height: 10.0,),
          const Text("Profile Photo",style: drawerSubtitle,),
          const SizedBox(height: 10.0,),
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
                      saveProfileApi(
                          context: context,
                          profile : covImage.path,
                      ).whenComplete(() {
                        load();
                      });
                    }
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              profilePhoto.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 80,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: profilePhoto.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = profilePhoto[index];
                    return Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage("${Api_link.imageUrl}${data.filePath}"),fit: BoxFit.fill
                          ),
                          border: Border.all(
                              color: Colors.red, width: 1),
                          borderRadius:
                          BorderRadius.circular(12)),
                      child: InkWell(
                          onTap : (){
                            setState(() {
                              fileUploadList().deleteMedia(
                                  mediaId: data.id.toString(),
                                  context: context
                              ).whenComplete(() {
                                setState(() {
                                  fileUploadList().uploadImageApi(type: "1").then((value) {
                                    setState(() {
                                      profilePhoto = value.error == true ?  [] : value.data!;
                                    });
                                  });
                                });
                              });
                            });
                          },
                          child: const Icon(Icons.clear,color: Colors.white,size: 24,)),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const SizedBox(height: 10.0,),
          const Text("Multiple Photographs",style: drawerSubtitle,),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "2",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              photosList.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: photosList.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = photosList[index];
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${Api_link.imageUrl}${data.filePath}"),fit: BoxFit.fill
                              ),
                              border: Border.all(
                                  color: Colors.red, width: 1),
                              borderRadius:
                              BorderRadius.circular(12)),
                          child: InkWell(
                              onTap : (){
                                setState(() {
                                  print("${data.id} -------------id ");
                                  fileUploadList().deleteMedia(
                                      mediaId: data.id.toString(),
                                      context: context
                                  ).whenComplete(() {
                                    setState(() {
                                      fileUploadList().uploadImageApi(type: "2").then((value) {
                                        setState(() {
                                          photosList = value.error == true ?  [] :  value.data!;
                                        });
                                      });
                                    });
                                  });
                                });
                              },
                              child: const Icon(Icons.clear,color: Colors.white,size: 24,)),
                        ),
                        const SizedBox(height: 2.0,),
                        data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Videos",style: drawerSubtitle,),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "3",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              profileVideos.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: profileVideos.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = profileVideos[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                          fileUploadList().uploadImageApi(type: "3").then((value) {
                                            setState(() {
                                              profileVideos = value.error == true ?  [] : value.data!;
                                            });
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Photos with celebs",style: drawerSubtitle,),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "4",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              photoWithCeleb.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: photoWithCeleb.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = photoWithCeleb[index];
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${Api_link.imageUrl}${data.filePath}"),fit: BoxFit.fill
                              ),
                              border: Border.all(
                                  color: Colors.red, width: 1),
                              borderRadius:
                              BorderRadius.circular(12)),
                          child: InkWell(
                              onTap : (){
                                setState(() {
                                  fileUploadList().deleteMedia(
                                      mediaId: data.id.toString(),
                                      context: context
                                  ).whenComplete(() {
                                    setState(() {
                                      fileUploadList().uploadImageApi(type: "4").then((value) {
                                        setState(() {
                                          photoWithCeleb = value.error == true ?  [] :  value.data!;
                                        });
                                      });
                                    });
                                  });
                                });
                              },
                              child: const Icon(Icons.clear,color: Colors.white,size: 24,)),
                        ),
                        const SizedBox(height: 2.0,),
                        data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Photos with brands",style: drawerSubtitle),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "5",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              photoWithBrands.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: photoWithBrands.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = photoWithBrands[index];
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${Api_link.imageUrl}${data.filePath}"),fit: BoxFit.fill
                              ),
                              border: Border.all(
                                  color: Colors.red, width: 1),
                              borderRadius:
                              BorderRadius.circular(12)),
                          child: InkWell(
                              onTap : (){
                                setState(() {
                                  fileUploadList().deleteMedia(
                                      mediaId: data.id.toString(),
                                      context: context
                                  ).whenComplete(() {
                                    setState(() {
                                      fileUploadList().uploadImageApi(type: "7").then((value) {
                                        setState(() {
                                          photoWithBand = value.error == true ?  [] :value.data!;
                                        });
                                      });
                                    });
                                  });
                                });
                              },
                              child: const Icon(Icons.clear,color: Colors.white,size: 24,)),
                        ),
                        const SizedBox(height: 2.0,),
                        data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(color: Colors.white),

          const Text("Videos with brands",style: drawerSubtitle),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "6",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              videoWithBrands.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videoWithBrands.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = videoWithBrands[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                          fileUploadList().uploadImageApi(type: "6").then((value) {
                                            setState(() {
                                              videoWithBrands = value.error == true ?  [] : value.data!;
                                            });
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(color: Colors.white),

          const Text("Photos with bands",style: drawerSubtitle),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "7",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              photoWithBand.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: photoWithBand.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = photoWithBand[index];
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${Api_link.imageUrl}${data.filePath}"),fit: BoxFit.fill
                              ),
                              border: Border.all(
                                  color: Colors.red, width: 1),
                              borderRadius:
                              BorderRadius.circular(12)),
                          child: InkWell(
                              onTap : (){
                                setState(() {
                                  fileUploadList().deleteMedia(
                                      mediaId: data.id.toString(),
                                      context: context
                                  ).whenComplete(() {
                                    setState(() {
                                      fileUploadList().uploadImageApi(type: "7").then((value) {
                                        setState(() {
                                          photoWithBand =  value.error == true ?  [] : value.data!;
                                        });
                                      });
                                    });
                                  });
                                });
                              },
                              child: const Icon(Icons.clear,color: Colors.white,size: 24,)),
                        ),
                        const SizedBox(height: 2.0,),
                        data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Videos with bands",style: drawerSubtitle),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "8",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              videoWithBand.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videoWithBand.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = videoWithBand[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                         setState(() {
                                           fileUploadList().uploadImageApi(type: "8").then((value) {
                                             setState(() {
                                               videoWithBand = value.error == true ?  [] : value.data!;
                                             });
                                           });
                                         });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Photos with clubs",style: drawerSubtitle),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "9",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              photoWithClub.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: photoWithClub.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = photoWithClub[index];
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("${Api_link.imageUrl}${data.filePath}"),fit: BoxFit.fill
                              ),
                              border: Border.all(
                                  color: Colors.red, width: 1),
                              borderRadius:
                              BorderRadius.circular(12)),
                          child: InkWell(
                              onTap : (){
                                setState(() {
                                  fileUploadList().deleteMedia(
                                      mediaId: data.id.toString(),
                                      context: context
                                  ).whenComplete(() {
                                    setState(() {
                                      fileUploadList().uploadImageApi(type: "9").then((value) {
                                        setState(() {
                                          photoWithClub =  value.error == true ?  [] : value.data!;
                                        });
                                      });
                                    });
                                  });
                                });
                              },
                              child: const Icon(Icons.clear,color: Colors.white,size: 24,)),
                        ),
                        const SizedBox(height: 2.0,),
                        data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Videos with clubs",style: drawerSubtitle),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "10",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              videoWithClub.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videoWithClub.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = videoWithClub[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                          setState(() {
                                            fileUploadList().uploadImageApi(type: "10").then((value) {
                                              setState(() {
                                                videoWithClub = value.error == true ?  [] : value.data!;
                                              });
                                            });
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.location == null ? const SizedBox() : Text("${data.location}",style: cardSubTitle,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Audio cover songs",style: drawerSubtitle),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "11",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              audioCoverSong.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: audioCoverSong.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = audioCoverSong[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                         setState(() {
                                           fileUploadList().uploadImageApi(type: "11").then((value) {
                                             setState(() {
                                               audioCoverSong = value.error == true ?  [] :value.data!;
                                             });
                                           });
                                         });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.withPhoto == null ? const SizedBox() : Text("${data.withPhoto}",style: cardSubTitle,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Videos cover songs",style: drawerSubtitle),
          const SizedBox(height: 10.0,),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "12",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              videoCoverSong.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: videoCoverSong.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = videoCoverSong[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                          setState(() {
                                            fileUploadList().uploadImageApi(type: "12").then((value) {
                                              setState(() {
                                                videoCoverSong = value.error == true ?  [] : value.data!;
                                              });
                                            });
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.withPhoto == null ? const SizedBox() : Text("${data.withPhoto}",style: cardSubTitle)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          const Text("Original Audio songs",style: drawerSubtitle),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "13",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              originalAudioSong.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: originalAudioSong.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = originalAudioSong[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                          setState(() {
                                            fileUploadList().uploadImageApi(type: "13").then((value) {
                                              setState(() {
                                                originalAudioSong = value.error == true ?  [] : value.data!;
                                              });
                                            });
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.withPhoto == null ? const SizedBox() : Text("${data.withPhoto}",style: cardSubTitle,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(color: Colors.white),

          const Text("Original Video songs",style: drawerSubtitle),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => uploadChannel(
                      type: "14",
                    ),)).whenComplete((){
                      load();
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
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
              const SizedBox(width: 5.0),
              originalVideoSong.toString() == "null" ? const SizedBox() :
              SizedBox(
                height: 100,
                // width: _width* 0.6,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: originalVideoSong.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = originalVideoSong[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                      },
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                    color: appBarColor,
                                    border: Border.all(color: appColor, width: 1),
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: const Icon(Icons.play_circle,color: Colors.white,size: 24),
                              ),
                              Positioned(
                                  right : 5,
                                  top : 2,
                                  child: InkWell(
                                      onTap : (){
                                        fileUploadList().deleteMedia(
                                            mediaId: data.id.toString(),
                                            context: context
                                        ).then((value) {
                                          setState(() {
                                            fileUploadList().uploadImageApi(type: "14").then((value) {
                                              setState(() {
                                                originalVideoSong =value.error == true ?  [] : value.data!;
                                              });
                                            });
                                          });
                                        });
                                      },
                                      child: const Icon(Icons.clear,color: Colors.white,size: 24,)))
                            ],
                          ),
                          const SizedBox(height: 2.0,),
                          data.withPhoto == null ? const SizedBox() : Text("${data.withPhoto}",style: cardSubTitle,)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Divider(color: Colors.white),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
  void multiplePhoto(ImageSource source) async {
    final List<XFile>? image = await _pickerMultiple.pickMultiImage();
    setState(() {
      multipleImage = image!;
    });
    for (final XFile file in multipleImage) {
      var selectFile = File(file.path);
      multiplePhotographs.add(selectFile.absolute);
    }
  }

  Future<void> updateChannel(BuildContext context) {
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
                            onTap: () {},
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

  Future saveCoverApi({profile,type,required BuildContext context}) async{
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.profileImage));
      request.fields.addAll({
        'user_id': userId,
        "profile_id": DataManager.getInstance().getProfile().toString(),
        'end_page' : "cover",
      });
      print(request.fields);
     request.files.add(await http.MultipartFile.fromPath('cover', profile));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{

          setState(() {
            //isLoading = false;
          });
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        setState(() {
        //  isLoading = false;
        });
        Loading().onError(msg: "Server error");
      }
    }catch(e){
      print(e);
      Loading().onError(msg: "Server error");
    }

  }

  Future saveProfileApi({profile,type,required BuildContext context}) async{
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.profileImage));
      request.fields.addAll({
        'user_id': userId,
        "profile_id": DataManager.getInstance().getProfile().toString(),
        'end_page' : "cover",
      });

      request.files.add(await http.MultipartFile.fromPath('profile', profile));
      print(request.files);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{

          setState(() {
            //isLoading = false;
          });
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        setState(() {
          //  isLoading = false;
        });
        Loading().onError(msg: "Server error");
      }
    }catch(e){
      print(e);
      Loading().onError(msg: "Server error");
    }

  }
}

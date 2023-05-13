
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/cover_songs.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Controller/videoPlayer.dart';
import '../Modal/clubListM.dart';
import '../Modal/uploadImageM.dart';
import 'package:http/http.dart' as http;

class Upload_clubs extends StatefulWidget {
  const Upload_clubs({Key? key}) : super(key: key);

  @override
  State<Upload_clubs> createState() => _Upload_clubsState();
}

class _Upload_clubsState extends State<Upload_clubs> {

  TextEditingController locationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController captionController = TextEditingController();

  TextEditingController stateController = TextEditingController();
  TextEditingController searchClubController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  final double _height = Get.height, _width = Get.width;
  List<uploadData> photosList = [];
  String? profileUpload;
  late File proImage;

  List<ClubData> clubList = [];
  List<ClubData> searchStates = [];
  String? clubValue,clubName;
  bool showField = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load(){
    fileUploadList().uploadImageApi(type: 10.toString()).then((value) {
      setState(() {
        photosList = value.data!;
      });
    });
    GetArtistList().getClubApi().then((value) {
      setState(() {
        clubList =searchStates= value.data!;
      });
    });
  }
  String? nextPage;
  bool isLoading = false;
  List<File?> files = [];
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
        content: Text('Please select atleast 1 file',style: textHint),
      ));
    }
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
        automaticallyImplyLeading: true,
        backgroundColor: appBarColor,
        title: Text("Upload videos with clubs",style: GoogleFonts.poppins(textStyle: appBarText)),
        // leading: InkWell(
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 24)),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 10.0),
          Text(" Choose the club",style: GoogleFonts.poppins(textStyle : textLabel)),
          const SizedBox(height: 2.0),
          states(),
          const SizedBox(height: 10,),
          Visibility(
            visible: showField,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                  autofocus: false,
                  controller: titleController,
                  style: const TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                  decoration: InputDecoration(
                    hintText: 'type your club name',
                    hintStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize:10, color: Colors.white),
                    fillColor: const Color(0xFF434445),
                    filled: true,
                    contentPadding: const EdgeInsets.only(
                        left: 25.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                  )),
            ),
          ),
          const SizedBox(height: 10,),
          Text(" Location for album",style: GoogleFonts.poppins(textStyle : textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: locationController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10,),
          Text(" Caption for album",style: GoogleFonts.poppins(textStyle : textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: captionController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10),
          Text(" Upload video",style: GoogleFonts.poppins(textStyle : textLabel)),
          const SizedBox(height: 5),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Loading().onLoading();
                    getMultipleFile();
                    // final result = await FilePicker.platform.pickFiles(type: FileType.video);
                    // proImage=File(result!.files.single.path!);
                    // setState(() {
                    //   profileUpload=result.files.single.path;
                    // }
                    // );
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
          photosList.isEmpty ?  const Text("") : const Text("Recently Uploaded File",style: textLabel),
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
                      child:  Text(data.location == null ? "" : "${data.location}",style: textFill,),
                    )
                  ],
                );
              }
          ),
          const SizedBox(height: 20),
          // profileUpload == null ?
          // const Text("") :
          // Container(
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          //     decoration: BoxDecoration(
          //         color: appBarColor,
          //         borderRadius: BorderRadius.circular(4.0)
          //     ),
          //     child: Text(proImage.path.split('/').last,style: textFill,)),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 70,
        alignment: Alignment.bottomCenter,
        child: isLoading ?
        const Center(child: CircularProgressIndicator(color: appColor,)) :
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if(files.isEmpty){
                  CommonToast(context: context, title: 'Please upload video', alignCenter: false);
                  setState(() {
                    isLoading = false;
                  });
                }else{
                  Loading().onLoading();
                  uploadMultiplePhotos(
                      context: context,
                      bandName: showField == true ?  stateController.text : titleController.text,
                      location: locationController.text,
                      captions: captionController.text,
                      type: "10",
                      file: files,
                    nextPage: "0"
                  ).whenComplete(() => {
                    load(),
                    stateController.clear(),
                    locationController.clear(),
                    captionController.clear(),
                  Loading().onDone(),
                    setState(() {
                      files.clear();
                    }),
                  });
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
            GestureDetector(
              onTap: () {
                Get.to(const CoverSongs());
              },
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50.0,
                decoration: boxDecoration(),
                child: const Text('Skip', style: buttonText),
              ),
            ),
          ],
        )
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
              if(files.isEmpty){
                CommonToast(context: context, title: 'Please upload video', alignCenter: false);
                setState(() {
                  isLoading = false;
                });
              }else{
                Loading().onLoading();
                uploadMultiplePhotos(
                    context: context,
                    bandName: showField == true ?  stateController.text : titleController.text,
                    location: locationController.text,
                    captions: captionController.text,
                    type: "10",
                    file: files,
                    nextPage: "1"
                ).whenComplete(() => {
                  load(),
                  stateController.clear(),
                  locationController.clear(),
                  captionController.clear(),
                Loading().onDone(),
                  setState(() {
                    files.clear();
                  }),
                });
              }
            },
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(height: 5.0,),
          Text("Save and create album",style: GoogleFonts.poppins(textStyle: textHint),),
          const SizedBox(height: 40.0,)
        ],
      ),
    );
  }


  Widget states() {
    return TextFormField(
        controller: stateController,
        onTap: (){
          showDialog(
            context: context,
            barrierDismissible:false,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (context, setState){
                    return Dialog(
                        backgroundColor: cardColor,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 10.0,top: 5.0),
                                    child: Icon(Icons.clear,color: Colors.red,size: 24,),
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                              onChanged: (value) {
                                setState(() {
                                  searchStates = clubList
                                      .where((name) => name.nameOfClub!
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                              keyboardType: TextInputType.text,
                              controller:searchClubController,
                              style: textFill,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search,size: 24,color: Colors.grey[300],),
                                filled: true,
                                fillColor: cardColor,
                                hintText: 'Search Club',
                                hintStyle: textHint,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics:  const ScrollPhysics(),
                                  itemCount:searchStates.isEmpty ? 0 : searchStates.length,
                                  itemBuilder: (context, index) {
                                    var data =searchStates[index];
                                    return ListView(
                                      shrinkWrap: true,
                                      physics:  const ScrollPhysics(),
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: InkWell(
                                              child: Text("${data.nameOfClub}",style: textFill,),
                                              onTap:(){
                                                select_State(state:data.nameOfClub.toString());
                                                Navigator.pop(context);
                                                clubName = data.nameOfClub.toString();
                                                clubName == "Others" ? showField = true : showField = false;
                                              }
                                          ),
                                        ),
                                        Divider(color: Colors.grey[500],)
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        )
                    );
                  }
              );
            },
          );
        },
        readOnly: true,
        textInputAction: TextInputAction.next,
        style: textFill,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select club';
          }
          return null;
        },
        decoration: inputDecoration(context)
    );
  }
  select_State({state}){
    return  setState(() {
      stateController.text= state;
    });
  }

  // Future uploadVideo({nextPage,file,location,captions,bandName,type,required BuildContext context}) async{
  //   final getUserDetail = GetUserDetail();
  //   var userId = await getUserDetail.getUserData('id');
  //   try{
  //     var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
  //     request.fields.addAll({
  //       'user_id': userId,
  //       'type': type,
  //       'location': location,
  //       'caption': captions,
  //       'with_photo': bandName,
  //     });
  //     request.files.add(await http.MultipartFile.fromPath('single_file', file));
  //     http.StreamedResponse response = await request.send();
  //     print('The requested fields are ${request.fields}');
  //     if (response.statusCode == 200) {
  //       var responseJson = await response.stream.bytesToString();
  //       var responseDecode = jsonDecode(responseJson);
  //       if(responseDecode['error']){
  //         CommonToast(context: context, title: 'Internal server error', alignCenter: true);
  //       }else{
  //         CommonToast(context: context, title: 'File upload successful', alignCenter: true);
  //         nextPage == "1" ? Get.offAll(Upload_clubs()) : Get.offAll(CoverSongs());
  //         setState(() {
  //           isLoading = false;
  //         });
  //       }
  //     } else {
  //       CommonToast(context: context, title: 'Internal server error', alignCenter: true);
  //       print(response.reasonPhrase);
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  //
  // }

  Future<http.StreamedResponse> uploadMultiplePhotos({nextPage,file,location,captions,bandName,type,required BuildContext context}) async {
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
    request.fields.addAll({
      'user_id': userId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
      'type': type,
      'location': location,
      'caption': captions,
      'with_photo': bandName,
    });
    print(request.fields);
    List<http.MultipartFile> filelist = [];
    for (var img in file) {
      if (img != "") {
        var multipartFile = await http.MultipartFile.fromPath('multiple_file[]',img.path,
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
    try{
      if(response.statusCode==200){
        CommonToast(context: context, title: 'Image upload successful', alignCenter: false);
        setState(() {
          isLoading = false;
        });
        nextPage == "1" ? Get.to(const Upload_clubs()) : Get.to(const CoverSongs());
        print(res.body);
      }else{
        print("Error");
        print(res.body);
        setState(() {
          isLoading = false;
          Loading().onError(msg: "server error");
        });
      }
    }catch(e){
      print(e.hashCode);
      Loading().onError(msg: "server error");
    }
    return response;
  }
}

class PhotoModel {
  String image;
  String title;
  bool isSelect;

  PhotoModel({
    required this.title,
    required this.image,
    required this.isSelect,
  });
}

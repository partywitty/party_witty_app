
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import '../Controller/style.dart';
import '../Controller/videoPlayer.dart';
import '../Modal/uploadImageM.dart';
import 'Upload_Bands.dart';

class brandVideo extends StatefulWidget {
  const brandVideo({Key? key}) : super(key: key);

  @override
  State<brandVideo> createState() => _brandVideoState();
}

class _brandVideoState extends State<brandVideo> {
  TextEditingController celebController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  final double _height = Get.height, _width = Get.width;
  String? profileUpload;
  late File proImage;
  String? nextPage;
  bool isLoading = false;
  List<uploadData> photosList = [];
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
        content: Text('Please select at least 1 file',style: textHint),
      ));
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load(){
    fileUploadList().uploadImageApi(type: 6.toString()).then((value) {
      setState(() {
        photosList = value.data!;
      });
    });
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
        title: Text("Upload video with brands",style: GoogleFonts.poppins(textStyle: appBarText)),
        // leading: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(
        //         Icons.arrow_back_ios, color: Colors.white, size: 24)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10.0),
          Text(" Brand name for album",style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: celebController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10.0),
          Text(" Location for album",style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: locationController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10.0),
          Text(" Caption for album",style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: captionController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10.0,),
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
                      child:  Text("${data.location}",style: textFill,),
                    )
                  ],
                );
              }
          ),
          const SizedBox(height: 10),

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
                    CommonToast(context: context, title: 'Please upload images', alignCenter: false);
                    setState(() {
                      isLoading = false;
                    });
                  }else{
                    Loading().onLoading();
                    uploadMultiplePhotos(
                        context: context,
                        brandName: celebController.text,
                        location: locationController.text,
                        captions: captionController.text,
                        type: "6",
                        file: files,
                      nextPage: "0"
                    ).whenComplete(()=>{
                      load(),
                      celebController.clear(),
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
                  child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const Upload_Bands());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 50.0,
                  decoration: boxDecoration(),
                  child: Text('Skip',style: GoogleFonts.poppins(textStyle: buttonText)
                  ),
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
                CommonToast(context: context, title: 'Please upload images', alignCenter: false);
                setState(() {
                  isLoading = false;
                });
              }else{
                Loading().onLoading();
                uploadMultiplePhotos(
                    context: context,
                    brandName: celebController.text,
                    location: locationController.text,
                    captions: captionController.text,
                    type: "6",
                    file: files,
                    nextPage: "1"
                ).then((value) =>{
                  load(),
                  celebController.clear(),
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

  Future<http.StreamedResponse> uploadMultiplePhotos({nextPage,file,location,captions,type,brandName,required BuildContext context}) async {
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
    request.fields.addAll({
      'user_id': userId,
      'profile_id' : DataManager.getInstance().getProfile().toString(),
      'type': type,
      'location': location,
      'caption': captions,
      'with_photo': brandName,
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
        nextPage == "1" ? Get.to(const brandVideo()) : Get.to(const Upload_Bands());
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

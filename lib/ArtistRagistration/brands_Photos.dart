

// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'package:http/http.dart' as http;
import '../Modal/uploadImageM.dart';
import 'brandVideos.dart';

class brandPhotos extends StatefulWidget {
  const brandPhotos({Key? key}) : super(key: key);

  @override
  State<brandPhotos> createState() => _brandPhotosState();
}

class _brandPhotosState extends State<brandPhotos> {

  TextEditingController celebController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  List<uploadData> photosList = [];
  List<File> imageFileCropped = [];
  List<XFile> _imageFile = [];
  final ImagePicker _picker = ImagePicker();
  Widget buildGridView() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      crossAxisCount: 3,
      physics: const ScrollPhysics(),
      children: List.generate(imageFileCropped.length, (index) {
        File asset = imageFileCropped[index];
        Loading().onDone();
        return Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: asset.path.split(".").last =="jpg" || asset.path.split(".").last =="png" || asset.path.split(".").last =="jpeg"?
                Image.file(File(asset.path),width: 70,height: 70,fit: BoxFit.fill,):
                Center(child: Text(asset.path.split("/").last))
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: InkWell(
                  onTap: (){
                    setState(() {
                      imageFileCropped.removeAt(index);
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

  load(){
    fileUploadList().uploadImageApi(type: 5.toString()).then((value) {
      setState(() {
        photosList = value.data!;
      });
    });
  }
  final double _height = Get.height, _width = Get.width;
  bool isLoading = false;
  String? nextPage;
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
        automaticallyImplyLeading: true,
        backgroundColor: appBarColor,
        title: Text("Upload photos with brands",style: GoogleFonts.poppins(textStyle: appBarText)),
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
          Text(" Brand name for album", style: GoogleFonts.poppins(textStyle: textLabel)),
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
          Text(" Caption for album", style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 2.0),
          TextFormField(
              autofocus: false,
              controller: captionController,
              style: textFill,
              decoration: inputDecoration(context,)
          ),
          const SizedBox(height: 10),
          Text(" Upload photos", style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10),
          imageFileCropped.isEmpty ?
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Loading().onLoading();
                    takePhoto(ImageSource.gallery);
                  },
                  child: Container(
                    height: 80,
                    width: 80,
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
                  )
              ),
            ],
          ) :
          buildGridView(),
          const SizedBox(height: 20.0),
          photosList.isEmpty ?  const Text("") : const Text("Recently Uploaded File",style: textLabel),
          const SizedBox(height: 10.0),
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
                    ClipRRect(
                        clipBehavior:
                        Clip.antiAliasWithSaveLayer,
                        borderRadius:
                        BorderRadius.circular(5.0),
                        child:  Image.network("${Api_link.imageUrl}${data.filePath}",fit: BoxFit.fill,height: _height* 0.12,width: _width*0.25,)),
                    const SizedBox(height: 3.0,),
                    SizedBox(
                      width: 150,
                      child:  Text(data.location == null ? "" : "${data.location}",style: textFill,),
                    )
                  ],
                );
              }
          ),
          const SizedBox(height: 20.0),
        ],
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor)) :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  if(imageFileCropped.isEmpty){
                    CommonToast(context: context, title: 'Please upload images', alignCenter: false);
                    setState(() {
                      isLoading = false;
                    });
                  }else{
                    Loading().onLoading();
                    uploadMultiplePhotos(
                        brandName:  celebController.text,
                        location: locationController.text,
                        captions: captionController.text,
                        type: "5",
                        file: imageFileCropped,
                      nextPage: "0"
                    ).whenComplete(() => {
                      load(),
                      celebController.clear(),
                      locationController.clear(),
                      captionController.clear(),
                      imageFileCropped.clear(),
                    Loading().onDone(),
                    });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 50.0,
                  decoration: boxDecoration(),
                  child: Text('Submit',
                      style: GoogleFonts.poppins(textStyle: buttonText)
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const brandVideo());
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
              if(imageFileCropped.isEmpty){
                CommonToast(context: context, title: 'Please upload images', alignCenter: false);
                setState(() {
                  isLoading = false;
                });
              }else{
                Loading().onLoading();
                uploadMultiplePhotos(
                    brandName:  celebController.text,
                    location: locationController.text,
                    captions: captionController.text,
                    type: "5",
                    file: imageFileCropped,
                    nextPage: "1"
                ).whenComplete(() {
                  load();
                  celebController.clear();
                  locationController.clear();
                  captionController.clear();
                  imageFileCropped.clear();
                  Loading().onDone();
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
  void takePhoto(ImageSource source) async {
    final List<XFile>? image = await _picker.pickMultiImage();
    setState(() {
      _imageFile = image!;
    });
    for (final XFile file in _imageFile) {
      var selectFile = File(file.path);
      imageFileCropped.add(selectFile.absolute);
    }
    Loading().onDone();
  }

  Future<http.StreamedResponse> uploadMultiplePhotos({nextPage,file,captions,location,brandName,type}) async {
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
    request.fields.addAll({
      'user_id': userId,
      'profile_id': DataManager.getInstance().getProfile().toString(),
      'with_photo' : brandName,
      'caption' :captions,
      'location' : location,
      'type' : type,
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
        CommonToast(context: context, title: 'Image upload successful', alignCenter: true);
        nextPage == "1" ? Get.to(const brandPhotos()) : Get.to(const brandVideo());
        print(res.body);
        print("succes");
        setState(() {
          isLoading = false;
        });
      }else{
        print(res.body);
        Loading().onError(msg: "server error");
      }
    }catch(e){
      print(e.hashCode);
      Loading().onError(msg: "server error");
    }
    return response;
  }
}
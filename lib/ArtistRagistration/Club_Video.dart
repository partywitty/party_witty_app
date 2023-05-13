
// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:flutter/material.dart';
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
import '../Modal/clubListM.dart';
import 'package:http/http.dart' as http;
import '../Modal/uploadImageM.dart';
import 'Upload_clubs.dart';

class clubVideos extends StatefulWidget {
  const clubVideos({Key? key}) : super(key: key);

  @override
  State<clubVideos> createState() => _clubVideosState();
}

class _clubVideosState extends State<clubVideos> {
  TextEditingController locationController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController searchClubController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  final double _height = Get.height, _width = Get.width;
  List<File> imageFileCropped = [];
  List<XFile> _imageFile = [];
  final ImagePicker _picker = ImagePicker();
  String? profileUpload;
  late File proImage;
  List<ClubData> clubList = [];
  List<ClubData> searchStates = [];
  List<uploadData> photosList = [];
  Widget buildGridView() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      crossAxisCount: 3,
      physics: ScrollPhysics(),
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load(){
    GetArtistList().getClubApi().then((value) {
      setState(() {
        clubList =searchStates= value.data!;
      });
    });
    fileUploadList().uploadImageApi(type: 9.toString()).then((value) {
      setState(() {
        photosList = value.data!;
      });
    });
  }
  String? clubValue,clubName;
  bool showField = false;
  String? nextPage;
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
        automaticallyImplyLeading: true,
        backgroundColor: appBarColor,
        title: Text("Upload photos with club",style: GoogleFonts.poppins(textStyle: appBarText)),
        // leading: InkWell(
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 24)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
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
                  style: textFill,
                  decoration: inputDecoration(context,
                  hint: "type your club name")
              ),
            ),
          ),
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
          const SizedBox(height: 10.0),
          Text(" Upload photos",style: GoogleFonts.poppins(textStyle : textLabel)),
          const SizedBox(height: 5.0),
          const SizedBox(height: 5),
          imageFileCropped.isEmpty?
          Row(
            children: [
              InkWell(
                  onTap: (){
                    Loading().onLoading();
                    takePhoto(ImageSource.gallery);
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
                  )
              ),
            ],
          ):
          buildGridView(),
          const SizedBox(height: 20.0),
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
                    ClipRRect(
                        clipBehavior:
                        Clip.antiAliasWithSaveLayer,
                        borderRadius:
                        BorderRadius.circular(5.0),
                        child:  Image.network(Api_link.imageUrl + "${data.filePath}",fit: BoxFit.fill,height: _height* 0.12,width: _width*0.25,)),
                    const SizedBox(height: 3.0,),
                    SizedBox(
                      width: 150,
                      child:  Text("${data.location}",style: textFill,),
                    )
                  ],
                );
              }
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 60,
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
                if(imageFileCropped.isEmpty){
                  CommonToast(context: context, title: 'Please upload images', alignCenter: false);
                  setState(() {
                    isLoading = false;
                  });
                }else{
                  Loading().onLoading();
                  uploadMultiplePhotos(
                      bandName: showField == false ? stateController.text : titleController.text,
                      location: locationController.text,
                      captions: captionController.text,
                      type: "9",
                      file: imageFileCropped,
                    nextPage: "0"
                  ).whenComplete(() => {
                    load(),
                    stateController.clear(),
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
                child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/upload_clubs');
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
                    bandName: showField == false ? stateController.text : titleController.text,
                    location: locationController.text,
                    captions: captionController.text,
                    type: "9",
                    file: imageFileCropped,
                    nextPage: "1"
                ).whenComplete(() => {
                  load(),
                  stateController.clear(),
                  locationController.clear(),
                  captionController.clear(),
                  imageFileCropped.clear(),
                  Loading().onDone(),
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

  Future<http.StreamedResponse> uploadMultiplePhotos({nextPage,file,location,captions,type,bandName}) async {
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
        CommonToast(context: context, title: 'Image upload successful', alignCenter: true);
        setState(() {
          isLoading = false;
        });
        nextPage == "1" ? Get.to(const clubVideos()) : Get.to(const Upload_clubs());
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
      Loading().onError(msg: "server error");
    }
    return response;
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
}

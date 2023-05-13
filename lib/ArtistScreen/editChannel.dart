
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import '../Controller/utils.dart';
import '../Modal/clubListM.dart';
import 'package:http/http.dart' as http;
import '../Modal/genreM.dart';

class uploadChannel extends StatefulWidget {
  var type;
  uploadChannel({Key? key,this.type}) : super(key: key);

  @override
  State<uploadChannel> createState() => _uploadChannelState();
}

class _uploadChannelState extends State<uploadChannel> {

  final double _height = Get.height, _width = Get.width;

  final _formKey = GlobalKey<FormState>();
  final getUserDetail = GetUserDetail();
  TextEditingController title = TextEditingController();
  TextEditingController selectTitle = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController searchStateController = TextEditingController();

  TextEditingController locationController = TextEditingController();
  TextEditingController captionController = TextEditingController();
  TextEditingController nameController = TextEditingController();


  List<Selected> selectedList =[];


  bool isLoading = false;

  String? _uploadImage;
  late File upImage;
  List<ClubData> clubList = [];
  List<ClubData> searchStates = [];
  String? clubValue,clubName;
  String? floorValue;
  bool showField = false;
  List<File?> files = [];
  List<File> imageFileCropped = [];
  List<XFile> imageFile = [];
  final ImagePicker _picker = ImagePicker();
  load(){
    GetArtistList().getClubApi().then((value) {
      setState(() {
        clubList =searchStates= value.data!;
      });
    });
    GetArtistList().genreApi().then((value) {
      setState(() {
        selectedList = value.data!.selected!;
      });
    });
  }
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: appBarColor,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            widget.type == "14" ?
            const SizedBox() :
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30.0),
                Text("  Location for album",style: GoogleFonts.poppins(textStyle : textLabel)),
                const SizedBox(height: 2.0),
                TextFormField(
                    autofocus: false,
                    controller: locationController,
                    style: textFill,
                    decoration: inputDecoration(context,)
                ),
                const SizedBox(height: 10.0),
                Text("  Caption for album",style: GoogleFonts.poppins(textStyle : textLabel)),
                const SizedBox(height: 2.0),
                TextFormField(
                    autofocus: false,
                    controller: captionController,
                    style: textFill,
                    decoration: inputDecoration(context,)
                ),
                const SizedBox(height: 10),
                Text("  name for album",style: GoogleFonts.poppins(textStyle : textLabel)),
                const SizedBox(height: 2.0),
                TextFormField(
                    autofocus: false,
                    controller: nameController,
                    style: textFill,
                    decoration: inputDecoration(context,)
                ),
                const SizedBox(height: 15),
              ],
            ),


            widget.type == "14" ?
            Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(" Genres of music",style: GoogleFonts.poppins(textStyle : textLabel)),
                 DropdownButtonHideUnderline(
                   child: ButtonTheme(
                     alignedDropdown: true,
                     child: DropdownButtonFormField(
                       dropdownColor: appBarColor,
                       decoration: inputDecoration(context),
                       hint: const Text("Select genres", style: textHint,),
                       value:floorValue,
                       isExpanded: true,
                       iconSize: 24,
                       elevation: 1,
                       style: const TextStyle(color: Colors.black,
                         fontWeight: FontWeight.bold,),
                       onChanged: (String? newValue) {
                         setState(() {
                           floorValue = newValue!;
                         });
                       },
                       validator: (value) {
                         if (value == null) {
                           return 'Please select course';
                         }
                         return null;
                       },
                       items: selectedList.map((data) => DropdownMenuItem<String>(
                         onTap: (){
                           setState(() {

                           });
                         },
                         child: Padding(
                           padding:  EdgeInsets.only(left: 8.0),
                           child:Text(data.genresName.toString(),style: textFill
                           ),
                         ), value:data.genresName.toString(),)).toList(),
                     ),
                   ),
                 )
               ],
             ) :
            const SizedBox(),

            const SizedBox(height: 10),

            ///add button ------  for images

            widget.type == "0" ?
            Column(
             children: [
               const SizedBox(height: 20.0),
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
             ],
            ) :
            const SizedBox(),

            widget.type == "1" ?
            Column(
              children: [
                const SizedBox(height: 20.0),
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
              ],
            ) :
            const SizedBox(),

            widget.type == "2" ?
            Column(
              children: [
                const SizedBox(height: 20.0),
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
              ],
            ) :
            const SizedBox(),

            widget.type == "3" ?
            Column(
              children: [
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
              ],
            ) :
            const SizedBox(),

            widget.type == "4" ?
            Column(
              children: [
                const SizedBox(height: 20.0),
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
              ],
            ) :
            const SizedBox(),

            widget.type == "5" ?
            Column(
              children: [
                const SizedBox(height: 20.0),
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
              ],
            ) :
            const SizedBox(),

            widget.type == "6" ?
            Column(
              children: [
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
              ],
            ) :
            const SizedBox(),

            widget.type == "7" ?
            Column(
              children: [
                const SizedBox(height: 20.0),
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
              ],
            ) :
            const SizedBox(),

            widget.type == "8" ?
            Column(
              children: [
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
              ],
            ) :
            const SizedBox(),

            widget.type == "9" ?
            Column(
              children: [
                const SizedBox(height: 20.0),
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
              ],
            ) :
            const SizedBox(),

            widget.type == "10" ?
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () async {
                          Loading().onLoading();
                          getMultipleFile();
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
              ],
            ) :
            const SizedBox(),

            widget.type == "11" ?
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap:()async{
                      final result = await FilePicker.platform.pickFiles(type: FileType.audio);
                      upImage=File(result!.files.single.path!);
                      setState(() {
                        _uploadImage=result.files.single.path;
                      }
                      );
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
                _uploadImage == null ?
                const Text("") :
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Text(upImage.path.split("/").last,style: textFill,)),
              ],
            ) :
            const SizedBox(),

            widget.type == "12" ?
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () async {
                          Loading().onLoading();
                          getMultipleFile();
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
              ],
            ) :
            const SizedBox(),

            widget.type == "13" ?
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap:()async{
                      final result = await FilePicker.platform.pickFiles(type: FileType.audio);
                      upImage=File(result!.files.single.path!);
                      setState(() {
                        _uploadImage=result.files.single.path;
                      }
                      );
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
                _uploadImage == null ?
                const Text("") :
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    decoration: BoxDecoration(
                        color: appBarColor,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Text(upImage.path.split("/").last,style: textFill,)),
              ],
            ) :
            const SizedBox(),

            widget.type == "14" ?
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () async {
                          Loading().onLoading();
                          getMultipleFile();
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
              ],
            ) :
            const SizedBox(),
          ],
        ),
        bottomNavigationBar:
        widget.type == "0" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "0",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: imageFileCropped
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "1" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "1",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: imageFileCropped
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "2" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "2",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: imageFileCropped
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "3" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "3",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: files
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "4" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "4",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: imageFileCropped
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "5" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "5",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: imageFileCropped
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "6" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child:isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "6",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: files
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "7" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child:isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "7",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: imageFileCropped
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "8" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "8",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: files
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "9" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "9",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: imageFileCropped
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "10" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "10",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: files
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "11" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child:isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadAudio(
                    context: context,
                    type: "11",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: upImage.path
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "12" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child:isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "12",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: files
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "13" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadAudio(
                    context: context,
                    type: "13",
                    location: locationController.text,
                    captions: captionController.text,
                    withName: nameController.text,
                    file: upImage.path
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        widget.type == "14" ?
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: isLoading ?
          const Center(child: CircularProgressIndicator(color: appColor,)) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                uploadMultiplePhotos(
                    type: "14",
                    location: "",
                    captions: "",
                    withName: floorValue.toString(),
                    file: files
                ).whenComplete((){
                  setState(() {
                    isLoading = false;
                  });
                });
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
          ),
        ) :
        const SizedBox(),
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
                            controller:searchStateController,
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
                                                searchStateController.clear();
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
          return 'Please select state';
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
  Future<http.StreamedResponse> uploadMultiplePhotos({file,captions,location,type,withName}) async {
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
    request.fields.addAll({
      'user_id': userId,
      'profile_id': DataManager.getInstance().getProfile().toString(),
      'caption' :captions,
      'location' : location,
      'type' : type,
      'with_photo': withName,
      'end_page' : 'multiple'
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
          Loading().onDone();
        });
        Navigator.pop(context);
        print(res.body);
      }else{
        print("Error");
        print(res.body);
        setState(() {
          isLoading = false;
          Loading().onError(msg: "Server error");
        });
      }
    }catch(e){
      print(e.hashCode);
      Loading().onError(msg: "Server error");
    }
    return response;
  }

  Future uploadAudio({file,location,captions,withName,type,required BuildContext context}) async{
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'type': type,
        'location': location,
        'caption': captions,
        'with_photo': withName,
        'end_page' : 'multiple'
      });
      request.files.add(await http.MultipartFile.fromPath('single_file', file));
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
      //    CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{
          CommonToast(context: context, title: 'File upload successful', alignCenter: true);
          Navigator.pop(context);
          setState(() {
            isLoading = false;
          });
        }
      } else {
       // CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        print(response.reasonPhrase);
        setState(() {
          isLoading = false;
          Loading().onError(msg: "server error");
        });
      }
    }catch(e){
      print(e);
      Loading().onError(msg: "server error");
    }

  }

  void takePhoto(ImageSource source) async {
    final List<XFile>? image = await _picker.pickMultiImage();
    setState(() {
      imageFile = image!;
    });
    for (final XFile file in imageFile) {
      var selectFile = File(file.path);
      imageFileCropped.add(selectFile.absolute);
      // _cropImage(file.path);
    }
    Loading().onDone();
  }
}

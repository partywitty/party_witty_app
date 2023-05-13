
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/loader.dart';
import '../Controller/utils.dart';
import '../Modal/clubListM.dart';
import 'package:http/http.dart' as http;
import '../Modal/genreM.dart';
import '../Modal/uploadImageM.dart';
import 'Streaming.dart';

class originalAudio extends StatefulWidget {
  const originalAudio({Key? key}) : super(key: key);

  @override
  State<originalAudio> createState() => _originalAudioState();
}

class _originalAudioState extends State<originalAudio> {
  final double _height = Get.height, _width = Get.width;
  TextEditingController name = TextEditingController();
  TextEditingController searchClubController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  String? _uploadImage;
  late File upImage;
  String? floorValue;
  List<ClubData> clubList = [];
  List<ClubData> searchStates = [];
  List<Selected> selectedList =[];
  List<uploadData> photosList = [];
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
    fileUploadList().uploadImageApi(type: 14.toString()).then((value) {
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
  bool isLoading = false;
  String? nextPage;

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
        title: Text("Upload original audio song", style: GoogleFonts.poppins(textStyle: appBarText)),
        // leading: InkWell(
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 24)),
      ),
       body: ListView(
         shrinkWrap: true,
         physics: const ScrollPhysics(),
         padding: const EdgeInsets.symmetric(horizontal: 15.0),
         children: [
           const SizedBox(height: 10.0),
           Text(" Genres of music",style: GoogleFonts.poppins(textStyle : textLabel)),
           const SizedBox(height: 5.0),
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
                     padding:  const EdgeInsets.only(left: 8.0),
                     child:Text(data.genresName.toString(),style: textFill
                     ),
                   ), value:data.genresName.toString(),)).toList(),
               ),
             ),
           ),
           //states(),
           const SizedBox(height: 10.0),
           Text(" Upload original audio song",style: GoogleFonts.poppins(textStyle: textLabel)),
           const SizedBox(height: 10.0),
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
           /// show file path
           const SizedBox(height: 20),
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

           const SizedBox(height: 20.0),
           photosList.isEmpty ?  const Text("") : const Text("Recently Uploaded File",style: textLabel),
           const SizedBox(height: 10),
           GridView.builder(
               shrinkWrap: true,
               itemCount: photosList.length,
               physics: const ScrollPhysics(),
               gridDelegate:
               const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   crossAxisSpacing: 0.0,
                   mainAxisSpacing: 10.0),
               itemBuilder: (BuildContext context, int index){
                 var data = photosList[index];
                 return Column(
                   children: [
                     InkWell(
                       onTap: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
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
                       child:  Text(data.location== null ? "" : "${data.location}",style: textFill,),
                     ),
                   ],
                 );
               }
           ),
         ],
       ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 60,
        alignment: Alignment.bottomCenter,
        child:
        isLoading ?
        const Center(child: CircularProgressIndicator(color: appColor,)) :
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if(_uploadImage == null){
                  CommonToast(context: context, title: 'Please upload audio song', alignCenter: false);
                  setState(() {
                    isLoading = false;
                  });
                }else{
                  Loading().onLoading();
                  uploadVideo(
                      context: context,
                      bandName: floorValue.toString(),
                      location: "not found",
                      captions: "not found",
                      type: "14",
                      file: upImage.path,
                    nextPage: "0"
                  ).whenComplete(() =>  {
                    load(),
                    stateController.clear(),
                  Loading().onDone(),
                    setState(() {
                      _uploadImage = null;
                    })
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/stream');
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
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: (){
              setState(() {
                isLoading = true;
              });
              if(_uploadImage == null){
                CommonToast(context: context, title: 'Please upload audio song', alignCenter: false);
                setState(() {
                  isLoading = false;
                });
              }else{
                Loading().onLoading();
                uploadVideo(
                    context: context,
                    bandName: floorValue.toString(),
                    location: "not found",
                    captions: "not found",
                    type: "14",
                    file: upImage.path,
                    nextPage: "1"
                ).whenComplete(() => {
                  load(),
                  stateController.clear(),
                Loading().onDone(),
                  setState(() {
                    _uploadImage = null;
                  })
                });
              }
            },
            child: const Icon(Icons.add,color: Colors.white),
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

  Future uploadVideo({nextPage,file,location,captions,bandName,type,required BuildContext context}) async{
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.imageProgress));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'type': type,
        'location': location,
        'caption': captions,
        'with_photo': bandName,
      });
      request.files.add(await http.MultipartFile.fromPath('single_file', file));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        }else{
          CommonToast(context: context, title: 'File upload successful', alignCenter: true);
          nextPage == "1" ? Get.to(const originalAudio()) : Get.to(const Streamup());
          setState(() {
            isLoading = false;
          });
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
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
}

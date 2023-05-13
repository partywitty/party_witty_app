


import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_app/ArtistRagistration/budgetSummary.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/instrumentM.dart';
import 'package:flutter_app/ArtistRagistration/duoBudget.dart';
import 'package:flutter_app/ArtistRagistration/trioScreen.dart';

import '../Modal/venueM.dart';



class budgetScreen extends StatefulWidget {
  String heading,type,subCategoryId;
  budgetScreen({Key? key,required this.heading,required this.type,required this.subCategoryId}) : super(key: key);

  @override
  State<budgetScreen> createState() => _budgetScreenState();
}

class _budgetScreenState extends State<budgetScreen> {

  final _getUserDetail = GetUserDetail();

  TextEditingController priceController = TextEditingController();
  TextEditingController clubPriceController = TextEditingController();
  TextEditingController privatePriceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController clubNameController = TextEditingController();
  TextEditingController privateNameController = TextEditingController();


  List<queAns> privatePrice = [];
  List<queAns> clubPrice = [];
  List<queAns> corporatePrice = [];
  List<Instruments> instrument =[] ;
  List<SelectedVenue> selectedList = [];

  var appBar,nullId;
  String? privateValue;
  String? duoPrivateValue;
  String? trioPrivateValue;

  String? clubPrivateValue;
  String? corporatePrivateValue;

  String? clubValue;
  String? corporateValue;
  bool loader = false;

  String? privateUpload;
  late File privateImage;
  String? clubUpload;
  late File clubImage;
  String? corporateUpload;
  late File corporateImage;

  load(){
    GetArtistList().instrumentApi().then((value) {
      setState(() {
        instrument = value.data!.instruments!;
      });
    });
    GetArtistList().venueApi().then((value) {
      setState(() {
        selectedList = value.data!.selected!;
      });
    });
  }

  String? privateId,clubId,corporateId,numberOfInstrument,nextPage,notFoundPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
    print("${widget.heading}===================title");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //   onTap: (){
        //     Navigator.pop(context);
        //   },
        //     child: const Icon(Icons.arrow_back_ios_new,size: 24,color: Colors.white,)),
        title: Text(widget.heading, style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView.builder(
        itemCount: selectedList.length,
        itemBuilder: (context, index) {
          var data = selectedList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            data.venueName == "Private" ?
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0),
                      Text("  For Private",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                      const SizedBox(height: 10.0),
                      widget.type == "1" ?
                      DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonFormField(
                            dropdownColor: appBarColor,
                            onTap: (){
                              setState(() {
                                privatePrice.add(queAns(
                                    queId: privateId.toString(),
                                    ansData: priceController.text,
                                    name: nameController.text
                                ));
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                hintStyle: textHint,
                                hintText: " Select Instrument",
                                contentPadding: const EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.7),
                                    borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
                            ),
                            value:privateValue,
                            isExpanded: true,
                            iconSize: 24,
                            iconEnabledColor: Colors.white,
                            elevation: 1,
                            style: textFill,
                            onChanged: (String? newValue) {
                              setState(() {
                                privateValue = newValue!;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select instrument';
                              }
                              return null;
                            },
                            items: instrument.map((data) => DropdownMenuItem<String>(
                              onTap: (){
                                setState(() {
                                  privateId = "${data.id}";
                                });
                              },
                              child: Text(data.name.toString(),style: textFill),
                              value:data.id.toString(),)).toList(),
                          ),
                        ),
                      ) :
                      const SizedBox(),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Base price';
                          }
                          return null;
                        },
                        // onEditingComplete: (){
                        //   widget.type == "0"  ?
                        //   privatePrice.add(queAns(
                        //       queId: privateId.toString(),
                        //       ansData: priceController.text,
                        //       name: nameController.text)) : "";
                        // },
                        controller: priceController,
                        style: textFill,
                        keyboardType: TextInputType.phone,
                        decoration: inputDecorationSuffix(
                            context,
                            hint: "Base price"
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap:()async{
                                final result = await FilePicker.platform.pickFiles(type: FileType.image);
                                privateImage=File(result!.files.single.path!);
                                setState(() {
                                  privateUpload=result.files.single.path;
                                }
                                );
                                widget.type == "0"  ?
                                privatePrice.add(queAns(
                                    queId: privateId.toString(),
                                    ansData: priceController.text,
                                    name: nameController.text)) : "";
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
                          const SizedBox(width: 20.0,),
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            decoration: privateUpload==null ?
                            BoxDecoration(
                              //border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),):
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                image: Image.file(privateImage).image,fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Divider(color: Colors.white,height: 10,),
                    ],
                  ),
            ) :
            data.venueName == "Club" ?
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Text("  For club",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                    const SizedBox(height: 10.0),
                    widget.type == "1" ?
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                          dropdownColor: appBarColor,
                          onTap: (){
                            clubPrice.add(queAns(
                              queId: clubId.toString(),
                              ansData: clubPriceController.text,
                              name: clubNameController.text,
                            ));
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: textHint,
                              hintText: " Select Instrument",
                              contentPadding: const EdgeInsets.only(left: 10.0, bottom: 12.0, top: 0.0,right: 10),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.7),
                                  borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
                          ),
                          value:clubValue,
                          isExpanded: true,
                          iconSize: 24,
                          iconEnabledColor: Colors.white,
                          elevation: 1,
                          style: textFill,
                          onChanged: (String? newValue) {
                            setState(() {
                              clubValue = newValue!;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select instrument';
                            }
                            return null;
                          },
                          items: instrument.map((data) => DropdownMenuItem<String>(
                            onTap: (){
                              setState(() {
                                clubId = "${data.id}";
                              });
                            },
                            child: Text(data.name.toString(),style: textFill),
                            value:data.id.toString(),)).toList(),
                        ),
                      ),
                    ) :
                    const SizedBox(),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Base price';
                        }
                        return null;
                      },
                      // onEditingComplete: (){
                      //   widget.type == "0"  ?
                      //   clubPrice.add(queAns(
                      //     queId: clubId.toString(),
                      //     ansData: clubPriceController.text,
                      //     name: clubNameController.text,
                      //   )) : "";
                      // },
                      controller: clubPriceController,
                      style: textFill,
                      keyboardType: TextInputType.phone,
                      decoration: inputDecorationSuffix(
                          context,
                          hint: "Base price"
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap:()async{
                              final result = await FilePicker.platform.pickFiles(type: FileType.image);
                              clubImage=File(result!.files.single.path!);
                              setState(() {
                                clubUpload=result.files.single.path;
                              }
                              );
                              widget.type == "0"  ?
                              clubPrice.add(queAns(
                                queId: clubId.toString(),
                                ansData: clubPriceController.text,
                                name: clubNameController.text,
                              )) : "";
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
                        const SizedBox(width: 20.0,),
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: clubUpload==null ?
                          BoxDecoration(
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),):
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: Image.file(clubImage).image,fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(color: Colors.white,height: 10,),
                  ],
                ),
            ) :
            data.venueName == "Corporate" ?
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15.0),
                      Text("  For Corporate",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                      const SizedBox(height: 10.0),
                      widget.type == "1" ?
                      DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
                          child: DropdownButtonFormField(
                            dropdownColor: appBarColor,
                            onTap: (){
                              corporatePrice.add(queAns(
                                  queId: corporateId.toString(),
                                  ansData: privatePriceController.text,
                                  name: privateNameController.text
                              ));
                            },
                            decoration: InputDecoration(
                                filled: true,
                                hintStyle: textHint,
                                hintText: " Select Instrument",
                                contentPadding: const EdgeInsets.only(left: 10.0, bottom: 12.0, top: 0.0,right: 10),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.7),
                                    borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
                            ),
                            value:corporateValue,
                            isExpanded: true,
                            iconSize: 24,
                            iconEnabledColor: Colors.white,
                            elevation: 1,
                            style: textFill,
                            onChanged: (String? newValue) {
                              setState(() {
                                corporateValue = newValue!;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select instrument';
                              }
                              return null;
                            },
                            items: instrument.map((data) => DropdownMenuItem<String>(
                              onTap: (){
                                setState(() {
                                  corporateId = "${data.id}";
                                });
                              },
                              child: Text(data.name.toString(),style: textFill),
                              value:data.id.toString(),)).toList(),
                          ),
                        ),
                      ) :
                      const SizedBox(),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Base price';
                          }
                          return null;
                        },
                        // onEditingComplete: (){
                        //   widget.type == "0"  ?
                        //   corporatePrice.add(queAns(
                        //       queId: corporateId.toString(),
                        //       ansData: privatePriceController.text,
                        //       name: privateNameController.text
                        //   )) : "";
                        // },
                        controller: privatePriceController,
                        style: textFill,
                        keyboardType: TextInputType.phone,
                        decoration: inputDecorationSuffix(
                            context,
                            hint: "Base price"
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap:()async{
                                final result = await FilePicker.platform.pickFiles(type: FileType.image);
                                corporateImage=File(result!.files.single.path!);
                                setState(() {
                                  corporateUpload=result.files.single.path;
                                }
                                );
                                widget.type == "0"  ?
                                corporatePrice.add(queAns(
                                    queId: corporateId.toString(),
                                    ansData: privatePriceController.text,
                                    name: privateNameController.text
                                )): "";
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
                          const SizedBox(width: 20.0,),
                          Container(
                            alignment: Alignment.center,
                            height: 70,
                            width: 70,
                            decoration: corporateUpload==null ?
                            BoxDecoration(
                              //border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),):
                            BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.grey),
                              image: DecorationImage(
                                image: Image.file(corporateImage).image,fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Divider(color: Colors.white,height: 10,),
                      const SizedBox(height: 50.0),
                    ],
                  ),
            ) : const SizedBox(),
          ],
        );
      },),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 70,
        alignment: Alignment.bottomCenter,
        child: Center(
          child: GestureDetector(
            onTap: () {

              var private = privatePrice.map((e) => {
                '"intrument_ids"': widget.type == "1"  ? '"${privateId.toString()}"' : '" "',
                '"price"': widget.type == "1"  ? '"${priceController.text}"' : '"${priceController.text}"',
                '"name"' : '" "',
              },).toList(growable: true);
              print(private);

              var club = clubPrice.map((e) => {
                '"intrument_ids"' : widget.type == "1"  ? '"${clubId.toString()}"' : '" "',
                '"price"' : widget.type == "1"  ?  '"${clubPriceController.text}"' : '"${clubPriceController.text}"',
                '"name"' : '" "'
              }).toList(growable: true);
              print(club);

              var corporate = corporatePrice.map((e) => {
                '"intrument_ids"' : widget.type == "1"  ?  '"${corporateId.toString()}"' : '" "',
                '"price"' : widget.type == "1"  ?  '"${privatePriceController.text}"' : '"${privatePriceController.text}"',
                '"name"' : '" "'
              }).toList(growable: true);
              print(corporate);

              // if(priceController.text.isEmpty || clubPriceController.text.isEmpty || privatePriceController.text.isEmpty){
              //   CommonToast(context: context, title: 'fill all value', alignCenter: false);
              // }
           //   else{
                budgetSubmit(
                    subInstrumentId: widget.subCategoryId.toString(),
                    budgetFirst: private.toString(),
                    budgetSecond: club.toString(),
                    budgetThird: corporate.toString(),
                    privatePhoto: privateUpload == null ?  "" : privateImage.path,
                    clubPhoto: clubUpload == null ? "" : clubImage.path,
                    corporatePhoto: corporateUpload == null ? "" : corporateImage.path,
                    context: context
                ).then((value) {
                  load();
                  priceController.clear();
                  nameController.clear();
                  clubPriceController.clear();
                  privatePriceController.clear();
                  ///--------------------
                  setState(() {
                    privateValue = null;
                    clubValue = null;
                    corporateValue = null;
                    privateUpload = null;
                    clubUpload = null;
                    corporateUpload = null;
                  });
                });
             },
           // },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)),
            ),
          ),
        ),
      )
    );
  }



  Future budgetSubmit({
    required String subInstrumentId,
    required String budgetFirst,
    required String budgetSecond,
    required budgetThird,
    required privatePhoto,
    required clubPhoto,
    required corporatePhoto,
    required BuildContext context,}) async{
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.addBudget));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'subcategory_id': subInstrumentId,
        'private': budgetFirst,
        'club': budgetSecond,
        'corporate': budgetThird,
      });
      privateUpload == null ? "" : request.files.add(await http.MultipartFile.fromPath('private_image[0]', privatePhoto));
      clubUpload == null ? "" :  request.files.add(await http.MultipartFile.fromPath('club_image[0]', clubPhoto));
      corporateUpload == null ? "" :  request.files.add(await http.MultipartFile.fromPath('corporate_image[0]', corporatePhoto));
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        }else{
          load();
          print("json response- $responseDecode-----------------------------------response");
          CommonToast(context: context, title: 'successfully', alignCenter: false);
          nextPage = responseDecode['data']['num_of_intrument'];
          if(nextPage == "2"){
            Get.to(duoBudgetScreen(
                heading: responseDecode['data']['name'],
                subCategoryId: responseDecode['data']['id'].toString(),
                 type: responseDecode['data']['num_of_intrument'],
              ));
          }else if (nextPage == "3"){
            Get.to(trioScreen(
                  heading: responseDecode['data']['name'],
                subCategoryId: responseDecode['data']['id'].toString(),
                type: responseDecode['data']['num_of_intrument'],
              ));
          }else if (nextPage == "0"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => budgetScreen(
              heading: responseDecode['data']['name'],
              type: responseDecode['data']['num_of_intrument'].toString(),
              subCategoryId: responseDecode['data']['id'].toString(),
            ),)).whenComplete(() => {
              load()
            });
          }else if(nextPage ==null){
            Get.offAll(const budgetSummary());
          }
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: true);
        setState(() {
       //   isLoading = false;
        });
      }
    }catch(e){
      print(e);
    }

  }
}
class queAns {
  String queId;
  String ansData;
  String name;

  queAns({required this.queId, required this.ansData,required this.name});
}

// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistScreen/editDuoBudget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/editVenueM.dart';
import '../Modal/instrumentM.dart';
import 'package:http/http.dart' as http;

import '../Screens/bottomSheet.dart';
import 'editTrioBudget.dart';

class editBudget extends StatefulWidget {
  String title,type,subcategoryId,venuePage;
  editBudget({Key? key,
    required this.title,
    required this.type,
    required this.subcategoryId,
    required this.venuePage
  }) : super(key: key);

  @override
  State<editBudget> createState() => _editBudgetState();
}

class _editBudgetState extends State<editBudget> {
  final _getUserDetail = GetUserDetail();
  TextEditingController priceController = TextEditingController();
  TextEditingController clubPriceController = TextEditingController();
  TextEditingController privatePriceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController clubNameController = TextEditingController();
  TextEditingController privateNameController = TextEditingController();

  List<Venue> venueShow = [];
  List<queAns> privatePrice = [];
  List<queAns> clubPrice = [];
  List<queAns> corporatePrice = [];
  String? privateValue;
  String? duoPrivateValue;
  String? trioPrivateValue;
  String? privateUpload;
  late File privateImage;
  String? clubUpload;
  late File clubImage;
  String? corporateUpload;
  late File corporateImage;
  List<Instruments> instrument =[] ;


  String? clubPrivateValue;
  String? corporatePrivateValue;

  String? clubValue;
  String? corporateValue;
  load(){
    widget.venuePage.toString() == "1" ?
    GetArtistList().editVenueApiModel().then((value) {
      setState(() {
        venueShow = value.data!.venue!;
      });
    })
    :
    widget.venuePage.toString() == "0" ?
    GetArtistList().editFormationApiModel().then((value) {
      setState(() {
        venueShow = value.data!.venue!;
      });
    }) : SizedBox() ;
    GetArtistList().instrumentApi().then((value) {
      setState(() {
        instrument = value.data!.instruments!;
      });
    });
  }
  String? privateId,clubId,corporateId,numberOfInstrument,nextPage,notFoundPage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("${widget.title}", style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView.builder(
          itemCount: venueShow.length,
          itemBuilder: (context, index) {
            var data = venueShow[index];
            return Column(
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
                ) :
                const SizedBox(),
              ],
            );
          }
      ),
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
                editBudgetSubmit(
                    subInstrumentId: widget.subcategoryId.toString(),
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
  Future editBudgetSubmit({
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
        'end_page': 'venue',
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
          nextPage = responseDecode['data']['stage']['num_of_intrument'];
          print("${nextPage}---------- next page data");
          if(nextPage == "2"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => editDuoBudget(
              title: responseDecode['data']['stage']['name'],
              subcategoryId: responseDecode['data']['stage']['id'].toString(),
              type: responseDecode['data']['stage']['num_of_intrument'],
              venuePage: widget.venuePage,
            ))).whenComplete(() {
              load();
            });
          }else if (nextPage == "3"){
            Get.to(editTrioBudget(
              title: responseDecode['data']['stage']['name'],
               subcategoryId: responseDecode['data']['stage']['id'].toString(),
              type: responseDecode['data']['stage']['num_of_intrument'],
              venuePage: widget.venuePage,
            ));
          }else if (nextPage == "0"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => editBudget(
              title: responseDecode['data']['stage']['name'],
              type: responseDecode['data']['stage']['num_of_intrument'].toString(),
              subcategoryId: responseDecode['data']['stage']['id'].toString(),
              venuePage: widget.venuePage,
            ),)).whenComplete(() => {
              load()
            });
          }else if(nextPage ==null){
            Navigator.push(context, MaterialPageRoute(builder: (context) => bottomSheet(),));
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

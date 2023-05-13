
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/ArtistScreen/editBudget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Modal/editVenueM.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/instrumentM.dart';
import '../Modal/venueM.dart';
import '../Screens/bottomSheet.dart';
import 'editTrioBudget.dart';

class editDuoBudget extends StatefulWidget {
  String title,type,subcategoryId;
  var venuePage;
  editDuoBudget({Key? key,
    required this.title,
    required this.type,
    required this.subcategoryId,
    this.venuePage}) : super(key: key);

  @override
  State<editDuoBudget> createState() => _editDuoBudgetState();
}

class _editDuoBudgetState extends State<editDuoBudget> {

  List<Venue> venueShow = [];
  final _getUserDetail = GetUserDetail();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController1 = TextEditingController();
  TextEditingController clubPriceController = TextEditingController();
  TextEditingController clubPriceController1 = TextEditingController();
  TextEditingController corporatePriceController = TextEditingController();
  TextEditingController corporatePriceController1 = TextEditingController();

  String? privateValue;
  String? privateValue1;
  String? clubValue;
  String? clubValue1;
  String? corporateValue;
  String? corporateValue1;
  String? privateId,privateId1,clubId,clubId1,corporateId,corporateId1,numberOfInstrument,nextPage,notFoundPage;

  List<duoAns> privatePrice = [];
  List<duoAns> privatePrice1 = [];
  List<duoAns> clubPrice = [];
  List<duoAns> clubPrice1 = [];
  List<duoAns> corporatePrice = [];
  List<duoAns> corporatePrice1 = [];
  List<Instruments> instrument =[] ;
  List<SelectedVenue> selectedList = [];

  String? privateUpload;
  late File privateImage;
  String? privateUpload1;
  late File privateImage1;

  String? clubUpload;
  late File clubImage;
  String? clubUpload1;
  late File clubImage1;

  String? corporateUpload;
  late File corporateImage;
  String? corporateUpload1;
  late File corporateImage1;
  load(){
    widget.venuePage == "1" ?
    GetArtistList().editVenueApiModel().then((value) {
      setState(() {
        venueShow = value.data!.venue!;
      });
    }) :
    GetArtistList().editFormationApiModel().then((value) {
      setState(() {
        venueShow = value.data!.venue!;
      });
    });
    GetArtistList().instrumentApi().then((value) {
      setState(() {
        instrument = value.data!.instruments!;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data.venueName == "Private" ?
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Text("  For Private",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                    const SizedBox(height: 5.0),
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                          dropdownColor: appBarColor,
                          onTap: (){
                            setState(() {
                              privatePrice.add(duoAns(
                                  queId: privateId.toString(),
                                  ansData: priceController.text,
                                  name: ""
                              ));
                            });
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: textHint,
                              hintText: " Select Instrument 1",
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
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price';
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
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                          dropdownColor: appBarColor,
                          onTap: (){
                            setState(() {
                              privatePrice1.add(duoAns(
                                  queId: privateId1.toString(),
                                  ansData: priceController1.text,
                                  name: ""
                              ));
                            });
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: textHint,
                              hintText: " Select Instrument 2",
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
                          value:privateValue1,
                          isExpanded: true,
                          iconSize: 24,
                          iconEnabledColor: Colors.white,
                          elevation: 1,
                          style: textFill,
                          onChanged: (String? newValue) {
                            setState(() {
                              privateValue1 = newValue!;
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
                                privateId1 = "${data.id}";
                              });
                            },
                            child: Text(data.name.toString(),style: textFill),
                            value:data.id.toString(),)).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter price';
                        }
                        return null;
                      },
                      controller: priceController1,
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
                              privateImage1=File(result!.files.single.path!);
                              setState(() {
                                privateUpload1=result.files.single.path;
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
                        const SizedBox(width: 20.0,),
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: privateUpload1==null ?
                          BoxDecoration(
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),):
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: Image.file(privateImage1).image,fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(color: Colors.white,height: 10),
                  ],
                ),
              ) :
              data.venueName == "Club" ?
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  For club",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                    const SizedBox(height: 10.0),
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                          dropdownColor: appBarColor,
                          onTap: (){
                            clubPrice.add(duoAns(
                              queId: '${clubId.toString()}',
                              ansData: clubPriceController.text,
                              name: "",
                            ));
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: textHint,
                              hintText: " Select Instrument 1",
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
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Base price';
                        }
                        return null;
                      },
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
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                          dropdownColor: appBarColor,
                          onTap: (){
                            clubPrice1.add(duoAns(
                              queId: '${clubId1.toString()}',
                              ansData: clubPriceController1.text,
                              name: "",
                            ));
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: textHint,
                              hintText: " Select Instrument 2",
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
                          value:clubValue1,
                          isExpanded: true,
                          iconSize: 24,
                          iconEnabledColor: Colors.white,
                          elevation: 1,
                          style: textFill,
                          onChanged: (String? newValue) {
                            setState(() {
                              clubValue1 = newValue!;
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
                                clubId1 = "${data.id}";
                              });
                            },
                            child: Text(data.name.toString(),style: textFill),
                            value:data.id.toString(),)).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Base price';
                        }
                        return null;
                      },
                      controller: clubPriceController1,
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
                              clubImage1=File(result!.files.single.path!);
                              setState(() {
                                clubUpload1=result.files.single.path;
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
                        const SizedBox(width: 20.0,),
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: clubUpload1==null ?
                          BoxDecoration(
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),):
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: Image.file(clubImage1).image,fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(color: Colors.white,height: 10),
                  ],
                ),
              ) :
              data.venueName == "Corporate" ?
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Text("  For Corporate",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                    const SizedBox(height: 10.0),
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                          dropdownColor: appBarColor,
                          onTap: (){
                            corporatePrice.add(duoAns(
                                queId: '${corporateId.toString()}',
                                ansData: corporatePriceController.text,
                                name: ""
                            ));
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: textHint,
                              hintText: " Select Instrument 1",
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
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Base price';
                        }
                        return null;
                      },
                      controller: corporatePriceController,
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
                    DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButtonFormField(
                          dropdownColor: appBarColor,
                          onTap: (){
                            corporatePrice1.add(duoAns(
                                queId: '${corporateId1.toString()}',
                                ansData: corporatePriceController1.text,
                                name: ""
                            ));
                          },
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: textHint,
                              hintText: " Select Instrument 2",
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
                          value:corporateValue1,
                          isExpanded: true,
                          iconSize: 24,
                          iconEnabledColor: Colors.white,
                          elevation: 1,
                          style: textFill,
                          onChanged: (String? newValue) {
                            setState(() {
                              corporateValue1 = newValue!;
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
                                corporateId1 = "${data.id}";
                              });
                            },
                            child: Text(data.name.toString(),style: textFill),
                            value:data.id.toString(),)).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Base price';
                        }
                        return null;
                      },
                      controller: corporatePriceController1,
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
                              corporateImage1=File(result!.files.single.path!);
                              setState(() {
                                corporateUpload1=result.files.single.path;
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
                        const SizedBox(width: 20.0,),
                        Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: corporateUpload1==null ?
                          BoxDecoration(
                            //border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),):
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                              image: Image.file(corporateImage1).image,fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(color: Colors.white,height: 10),
                    const SizedBox(height: 60.0),
                  ],
                ),
              ) : const SizedBox()
            ],
          );
        },),
        bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 60,
          alignment: Alignment.bottomCenter,
          child: Center(
            child: GestureDetector(
              onTap: () {
                var private = privatePrice.map((e) => {
                  '"intrument_ids"':  '"${privateId.toString()}"',
                  '"price"': '"${priceController.text}"',
                  '"name"' : '" "',
                },).toList(growable: true);

                var private1 = privatePrice1.map((e) => {
                  '"intrument_ids"':  '"${privateId1.toString()}"',
                  '"price"': '"${priceController1.text}"',
                  '"name"' : '" "',
                },).toList(growable: true);
                print(private);

                var club = clubPrice.map((e) => {
                  '"intrument_ids"' :'"${clubId.toString()}"',
                  '"price"' : '"${clubPriceController.text}"',
                  '"name"' : '" "'
                }).toList(growable: true);

                var club1 = clubPrice1.map((e) => {
                  '"intrument_ids"' :'"${clubId1.toString()}"',
                  '"price"' : '"${clubPriceController.text}"',
                  '"name"' : '" "'
                }).toList(growable: true);
                print(club);

                var corporate = corporatePrice.map((e) => {
                  '"intrument_ids"' : '"${corporateId.toString()}"',
                  '"price"' : '"${corporatePriceController.text}"',
                  '"name"' : '" "'
                }).toList(growable: true);

                var corporate1 = corporatePrice1.map((e) => {
                  '"intrument_ids"' : '"${corporateId1.toString()}"',
                  '"price"' : '"${corporatePriceController1.text}"',
                  '"name"' : '" "'
                }).toList(growable: true);

                print(corporate);
                var list = [private.join(','),private1.join(",")];
                var list1 = [club.join(','),club1.join(",")];
                var list2 = [corporate.join(','),corporate1.join(",")];
                budgetSubmit(
                    subInstrumentId: widget.subcategoryId.toString(),
                    budgetFirst: list.toString(),
                    budgetSecond: list1.toString(),
                    budgetThird: list2.toString(),
                    privatePhoto: privateUpload == null ? "" : privateImage.path,
                    privatePhoto1: privateUpload1 == null ? "" : privateImage1.path,
                    clubPhoto: clubUpload == null ? "" : clubImage.path,
                    clubPhoto1: clubUpload1 == null ?  "" : clubImage1.path,
                    corporatePhoto: corporateUpload == null ? "" :  corporateImage.path,
                    corporatePhoto1: corporateUpload1 == null ? "" :  corporateImage1.path,
                    context: context
                ).then((value) {
                  load();
                  priceController.clear();
                  nameController.clear();
                  clubPriceController.clear();
                  ///--------------------
                  setState(() {
                    privateValue = null;
                    clubValue = null;
                    corporateValue = null;
                  });
                });
              },
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
    required privatePhoto1,
    required clubPhoto,
    required clubPhoto1,
    required corporatePhoto,
    required corporatePhoto1,
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
      privateUpload1 == null ? "" :  request.files.add(await http.MultipartFile.fromPath('private_image[1]', privatePhoto));
      clubUpload == null ? "" :  request.files.add(await http.MultipartFile.fromPath('club_image[0]', clubPhoto));
      clubUpload1 == null ?  "" :  request.files.add(await http.MultipartFile.fromPath('club_image[1]', clubPhoto));
      corporateUpload == null ? "" : request.files.add(await http.MultipartFile.fromPath('corporate_image[0]', corporatePhoto));
      corporateUpload1 == null ? "" :  request.files.add(await http.MultipartFile.fromPath('corporate_image[1]', corporatePhoto));
      print(request.fields);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        }else{
          print(responseDecode);
          CommonToast(context: context, title: 'successfully', alignCenter: false);
          nextPage = responseDecode['data']['stage']['num_of_intrument'];
          if(nextPage == "3"){
            Get.to(editTrioBudget(
              title: responseDecode['data']['stage']['name'],
              subcategoryId: responseDecode['data']['stage']['id'].toString(),
              type: responseDecode['data']['stage']['num_of_intrument'],
              venuePage: widget.venuePage,
            ));
          }else if (nextPage == "1"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => editBudget(
              title: responseDecode['data']['stage']['name'],
              type: responseDecode['data']['stage']['num_of_intrument'].toString(),
              subcategoryId: responseDecode['data']['stage']['id'].toString(),
              venuePage: widget.venuePage,
            ),)).whenComplete(() => {
              load()
            });
          }else if (nextPage == "0"){
            Navigator.push(context, MaterialPageRoute(builder: (context) => editBudget(
              title: responseDecode['data']['stage']['name'],
              type: responseDecode['data']['stage']['num_of_intrument'].toString(),
              subcategoryId: responseDecode['data']['stage']['id'].toString(),
              venuePage: widget.venuePage,
            ),)).whenComplete(() => {
              load()
            });
          } else if (nextPage == null){
            Get.offAll(const bottomSheet());
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
class duoAns {
  String queId;
  String ansData;
  String name;

  duoAns({required this.queId, required this.ansData,required this.name});
}
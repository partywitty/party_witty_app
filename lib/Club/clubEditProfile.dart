
// ignore_for_file: camel_case_types
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/genreM.dart';
import '../Modal/youPlayM.dart';
import 'clubEditDetails.dart';

class clubEditProfile extends StatefulWidget {
  const clubEditProfile({Key? key}) : super(key: key);

  @override
  State<clubEditProfile> createState() => _clubEditProfileState();
}

class _clubEditProfileState extends State<clubEditProfile> {
  final double _height = Get.height, _width = Get.width;
  TextEditingController soundController =TextEditingController();
  List<SubcategoryYou> formationList = [];
  List<Genres> genresList = [];
  String? typeValue;
  String? genreValue1;
  String? genreValue2;
  String? soundCheckTime;

  String? coverUpload;
  late File covImage;

  String? videoUpload;
  late File videoPoster;

  String selected = "Morning Slot";
  String selectedEvent = "Upload a Poster";
  load(){
    GetArtistList().artistSubtype(subArtist: "1").then((value) {
      setState(() {
        formationList = value.data!.subcategory!;
      });
    });
    GetArtistList().genreApi().then((value) {
      setState(() {
        genresList = value.data!.genres!;
      });
    });
  }
  Future<void> _soundCheck() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(
                // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        soundCheckTime = result.format(context) ;
        soundController.text = soundCheckTime.toString();
      });
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Live Music",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: appColor),
              color: appBarColor,
            ),
            child: ExpansionTile(
              title: Row(
                children: [
                  Image.asset("assests/calender.png",height: 30,fit: BoxFit.fill,width: 25)
                ],
              ),
              trailing: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
              children: [
                HorizontalCalendar(
                  date: DateTime.now(),
                  textColor: Colors.black45,
                  backgroundColor: Colors.white,
                  selectedColor: appColor,
                  showMonth:true,
                  onDateSelected: (date) {
                    // print(date.toString());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Text("Choose Slot",style: GoogleFonts.poppins(textStyle: appTitle)),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Morning Slot';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                  decoration: selected == 'Morning Slot' ?
                  BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ) :
                  BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text("Morning Slot",style: GoogleFonts.poppins(textStyle: cardTitle))
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Afternoon Slot';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    decoration: selected == 'Afternoon Slot' ?
                    BoxDecoration(
                      color: appColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ) :
                    BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  child: Text("Afternoon Slot",style: GoogleFonts.poppins(textStyle: cardTitle))
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Evening Slot';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                  decoration: selected == 'Evening Slot' ?
                  BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ) :
                  BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text("Evening Slot",style: GoogleFonts.poppins(textStyle: cardTitle)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Text("Event Details",style: GoogleFonts.poppins(textStyle: appTitle)),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedEvent = 'Upload a Poster';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    decoration: selectedEvent == 'Upload a Poster' ?
                    BoxDecoration(
                        border: Border.all(color: appColor),
                        color: appColor,
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))
                    ) :
                    BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))
                    ),
                    child: Text("Upload a Poster",style: GoogleFonts.poppins(textStyle: cardSubTitle))
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedEvent = 'Make a Poster';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    decoration: selectedEvent == 'Make a Poster' ?
                    BoxDecoration(
                        color: appColor,
                        border: Border.all(color: appColor),
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20))
                    ) :
                    BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20))
                    ) ,
                    child: Text("Make a Poster",style: GoogleFonts.poppins(textStyle: cardSubTitle))
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Text("Event Name",style: GoogleFonts.poppins(textStyle: cardTitle)),
          const Divider(color: Colors.white),
          const SizedBox(height: 10.0),
          Text("Artist Name",style: GoogleFonts.poppins(textStyle: cardTitle)),
          const Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Formation",style: GoogleFonts.poppins(textStyle: cardTitle)),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),
                //height: 45,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: appColor,
                  border: Border.all(
                      color: Colors.black, width: 0.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      // decoration: inputDecoration(context),
                      hint: const Text("Formation",style: textHint,),
                      value:typeValue,
                      isExpanded: true,
                      iconSize: 24,
                      elevation: 1,
                      dropdownColor: appBarColor,
                      style: textHint,
                      onChanged: (String? newValue) {
                        setState(() {
                          typeValue = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Formation';
                        }
                        return null;
                      },
                      icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                      items: formationList.map((data) => DropdownMenuItem<String>(
                        onTap: (){
                          setState(() {});
                        },
                        value:data.id.toString(),
                        child: Text(data.name.toString(),style: textFill),)).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Row(
            children: [
              Text("Genres",style: GoogleFonts.poppins(textStyle: cardTitle)),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: appColor,
                  border: Border.all(
                      color: Colors.black, width: 0.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      // decoration: inputDecoration(context),
                      hint: const Text("Formation",style: textHint,),
                      value: genreValue1,
                      isExpanded: true,
                      iconSize: 24,
                      elevation: 1,
                      dropdownColor: appBarColor,
                      style: textHint,
                      onChanged: (String? newValue) {
                        setState(() {
                          genreValue1 = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Formation';
                        }
                        return null;
                      },
                      icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                      items: genresList.map((data) => DropdownMenuItem<String>(
                        onTap: (){
                          setState(() {});
                        },
                        value:data.id.toString(),
                        child: Text(data.name.toString(),style: textHint),)).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 0.0),
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: appColor,
                  border: Border.all(
                      color: Colors.black, width: 0.5),
                ),
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButtonFormField(
                      // decoration: inputDecoration(context),
                      hint: const Text("Formation",style: textHint,),
                      value:genreValue2,
                      isExpanded: true,
                      iconSize: 24,
                      elevation: 1,
                      dropdownColor: appBarColor,
                      style: textHint,
                      onChanged: (String? newValue) {
                        setState(() {
                          genreValue2 = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Formation';
                        }
                        return null;
                      },
                      icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                      items: genresList.map((data) => DropdownMenuItem<String>(
                        onTap: (){
                          setState(() {});
                        },
                        value:data.id.toString(),
                        child: Text(data.name.toString(),style: textHint),)).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Start Time",style: GoogleFonts.poppins(textStyle: cardTitle)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: appColor
                ),
                height: 45,
                width: 120,
                child: TextFormField(
                  readOnly: true,
                  style: likes,
                  textAlign: TextAlign.center,
                  controller: soundController,
                  onTap: () {
                    _soundCheck();
                  },
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          const SizedBox(height: 10.0),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: ()async{
              final result = await FilePicker.platform.pickFiles(type: FileType.image);
              covImage=File(result!.files.single.path!);
              setState(() {
                coverUpload = result.files.single.path;
              }
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: appBarColor,
                border: Border.all(color: appColor)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(coverUpload== null  ? "Upload Club Poster" : covImage.path.split("/").last
                        ,style: GoogleFonts.poppins(textStyle: cardTitle)),
                  ),
                  const Icon(Icons.cloud_download_outlined,size: 24,color: appColor),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          InkWell(
            onTap: ()async{
              final result = await FilePicker.platform.pickFiles(type: FileType.video);
              videoPoster=File(result!.files.single.path!);
              setState(() {
                videoUpload = result.files.single.path;
              }
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: appBarColor,
                  border: Border.all(color: appColor)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(videoUpload == null ? "Upload MP4/GIF" : videoPoster.path.split("/").last,
                      style: GoogleFonts.poppins(textStyle: cardTitle)),
                  const Icon(Icons.cloud_download_outlined,size: 24,color: appColor),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          /// submit button
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const clubEditDetails(),));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              height: 45.0,
              decoration: boxDecoration(),
              child: Text('Submit', style: GoogleFonts.poppins(textStyle: buttonText)),
            ),
          ),
          const SizedBox(height: 15.0),
          Text("Monthly Event",style: GoogleFonts.poppins(textStyle: appTitle)),
          SizedBox(
            height: _height*0.45,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5.0),
                      Text("26 March",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 'Morning Slot';
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: selected == 'Morning Slot' ?
                                BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ) :
                                BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("Morning Slot",style: GoogleFonts.poppins(textStyle: cardTitle))
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 'Afternoon Slot';
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                                decoration: selected == 'Afternoon Slot' ?
                                BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ) :
                                BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text("Afternoon Slot",style: GoogleFonts.poppins(textStyle: cardTitle))
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = 'Evening Slot';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                              decoration: selected == 'Evening Slot' ?
                              BoxDecoration(
                                color: appColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ) :
                              BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text("Evening Slot",style: GoogleFonts.poppins(textStyle: cardTitle)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Stack(
                        children: [
                          Image.asset("assests/set.png",fit: BoxFit.fill,height: _height*0.28,width: _width*0.80,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xFF1F1E2E).withOpacity(0.6),
                            ),
                            height: _height*0.28,
                            width: _width*0.80,
                          ),
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 25)),
                          Positioned(
                              right: 5,
                              top: 5,
                              child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.white
                                  ),
                                  child: const Text("4.5",style: blackSubTitle))),
                          Positioned(
                              top: 0,
                              right: 0,
                              left: 0,
                              bottom: 0,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 20.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Event",style: GoogleFonts.robotoSlab(textStyle: appTitle),),
                                            Text("Name",style: GoogleFonts.robotoSlab(textStyle: extraBold),),
                                          ],
                                        ),
                                        const SizedBox(width: 20.0),
                                        Image.asset("assests/slot.png",fit: BoxFit.fill,height: 70,width: 150),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text("Friday",style: cardSubTitle),
                                        SizedBox(width: 15),
                                        Text("27.03.2023",style: cardSubTitle),
                                        SizedBox(width: 15),
                                        Text("8Pm Onwards",style: cardSubTitle),
                                      ],
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.location_on,color: Colors.white,size: 24),
                                        const SizedBox(width: 15),
                                        Text("4th Floor, Mall of India, Sector 18, Noida",style: GoogleFonts.poppins(textStyle: cardSubTitle),)
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                    ],
                  );
                },),
          ),
        ],
      ),
    );
  }
}

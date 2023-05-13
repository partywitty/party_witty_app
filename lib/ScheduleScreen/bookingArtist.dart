
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../ApiServices/bookingProcesses.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/artistProfileDetails.dart';
import '../Modal/artistTypeM.dart';
import '../Modal/genreM.dart';
import '../Modal/youPlayM.dart';

class bookingArtistFirst extends StatefulWidget {
  const bookingArtistFirst({Key? key}) : super(key: key);

  @override
  State<bookingArtistFirst> createState() => _bookingArtistFirstState();
}

class _bookingArtistFirstState extends State<bookingArtistFirst> {

  TextEditingController morningStart =TextEditingController();
  TextEditingController startTimeController =TextEditingController();
  TextEditingController endTimeController =TextEditingController();
  TextEditingController morningEnd =TextEditingController();
  TextEditingController soundController =TextEditingController();
  TextEditingController pinController =TextEditingController();

  final double _height = Get.height, _width = Get.width;

  bool mainCheck = false;
  bool starterCheck = false;
  bool nonAlcoholicCheck = false;
  bool alcoholicCheck = false;
  String slotValue = 'Morning Slot';
  var slotItems = ['Morning Slot', 'Afternoon Slot', 'Evening Slot'];
  var breakItems = ['1', '2', '3'];
  String breakTimeCountValue = '5 min';
  var breakCountItems = ['5 min', '10 min', '15 min', '20 min'];
  String breakTimeValue = '1';
  var mainItems = ['1', '2', '3', '4','5'];
  String mainValue = '1';
  var starterItems = ['1', '2', '3', '4','5'];
  String starterValue = '1';
  var alcoholicItems = ['1', '2', '3', '4','5'];
  String alcoholicValue = '1';
  var nonAlcoholicItems = ['1', '2', '3', '4','5'];
  String nonAlcoholicValue = '1';
  bool selectedBox = false;
  bool selectedCategory = false;
  bool slotVisibility = true;

  var artistSelect;
  var artistSelectCategory;
  var artistId;

  List<Artist> categoryList = [];
  List<SubcategoryYou> formationList = [];
  List<Genres> genresList = [];
  List selectedPrompts = [];
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
    GetArtistList().artistType().then((value) {
      setState(() {
        categoryList = value.data!.artist!;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  Future<void> _morningStart() async {
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
        morningStartTime = result.format(context) ;
        morningStart.text = morningStartTime.toString();
        startTimeController.text = morningStartTime.toString();
      });
    }
  }
  Future<void> _morningEnd() async {
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
        morningEndTime = result.format(context) ;
        morningEnd.text = morningEndTime.toString();
        endTimeController.text = morningEndTime.toString();
      });
    }
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
  
  String? morningStartTime;
  String? morningEndTime;
  String? soundCheckTime;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          children: [
            FutureBuilder<ArtistProfileDetails>(
              future: GetArtistList().artistProfileDetailsApi(profileId: "1"),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var userData = snapshot.data;
                  return Column(
                    children: [
                      SizedBox(
                        height: height/2.2,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: height/2.8,
                              child: Stack(
                                children: [
                                  userData!.data!.coverPhoto == null ?
                                  Image.network("https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=",fit: BoxFit.fill,height: height/2.8,width: width,):
                                  Image.network("${Api_link.imageUrl}${userData.data!.coverPhoto!.filePath}",fit: BoxFit.fill,height: height/2.8,width: width,),
                                  Positioned(
                                      left: 7,
                                      top: 7,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.home_work_outlined,color: appColor,size: 16),
                                                Icon(Icons.star,size: 16,color: Colors.yellow),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.groups,color: appColor,size: 16),
                                                Icon(Icons.star,size: 16,color: Colors.yellow),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  Positioned(
                                      top: 7,
                                      right: 10,
                                      child: Row(
                                        children: [
                                          Image.asset("assests/share.png",fit: BoxFit.fill,height: 18),
                                          const SizedBox(width: 10),
                                          const Icon(Icons.volume_off,size: 24,color: Colors.white,)
                                        ],
                                      )),
                                  Positioned(
                                      left: 7,
                                      bottom : 7,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.mic,size: 16,color: appColor),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.person,size: 16,color: appColor),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Column(
                                        children: [
                                          Image.asset("assests/meter.png",fit: BoxFit.fill,height: 70),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: const Text("Prize : 4500",style: blackSubTitle,),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: SizedBox(
                                height: 130,
                                width: 130,
                                child: OctoImage.fromSet(
                                    fit: BoxFit.fill,
                                    image: NetworkImage("${Api_link.imageUrl}${userData.data!.profilePhoto!.filePath}"),
                                    octoSet: OctoSet.circleAvatar(
                                        backgroundColor: appColor,
                                        text: Text(userData.data!.user!.username![0].split("").last.toUpperCase(),
                                            style: GoogleFonts.poppins(color: Colors.white,fontSize: 50))
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                          child: Column(
                            children: [
                              Text("${userData.data!.user!.username}",style: GoogleFonts.poppins(textStyle: extraBold),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.favorite,size: 16,color: Colors.red),
                                  SizedBox(width: 5,),
                                  Text("4.5k",style: textLabel,)
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 15.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                border: Border.all(color: appColor),
                color: Colors.white38
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.only(left: 00.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color(0xFFffcccc),
                            border: Border.all(color: appColor),
                          ),
                          child: Column(
                            children: const [
                              Text("Fri"),
                              Text("27"),
                            ],
                          ),
                        ),
                        Column(
                          children: const [
                            Text("Sat"),
                            Text("28"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Sun"),
                            Text("29"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Mon"),
                            Text("30"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Tue"),
                            Text("31"),
                          ],
                        ),
                        Column(
                          children: const [
                            Text("Th"),
                            Text("1"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey
                          ),
                          height: 40,
                          width: _width,
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 1,
                                style: textFill,
                                borderRadius: BorderRadius.circular(10),
                                value: slotValue,
                                hint: const Text("Select Time Slot"),
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                                dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                                items: slotItems.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    slotValue = newValue!;
                                  //  slotVisibility = true;
                                  });
                                },
                              )),
                        ),
                        const SizedBox(height: 15.0),
                        Visibility(
                          visible: slotVisibility,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40,
                                  width: _width*0.35,
                                  child: TextFormField(
                                    readOnly: true,
                                    style: textFill,
                                    textAlign: TextAlign.center,
                                    controller: morningStart,
                                    onTap: () {
                                      _morningStart();
                                    },
                                    decoration: inputDecorationTime(context, hint: "Start time"),
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: _width*0.35,
                                  child: TextFormField(
                                    readOnly: true,
                                    style: textFill,
                                    textAlign: TextAlign.center,
                                    controller: morningEnd,
                                    onTap: () {
                                      _morningEnd();
                                    },
                                    decoration: inputDecorationTime(context,hint: "End time"),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("*Terms & Condition applied",style: GoogleFonts.poppins(color: const Color(0xFFFE262F),fontSize: 10),),
            ),
            const SizedBox(height: 15.0),
            Container(
              color: appBarColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(color: appColor)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sound check time",style: GoogleFonts.poppins(textStyle: buttonText),),
                        SizedBox(
                          height: 35,
                          width: _width*0.25,
                          child: TextFormField(
                            readOnly: true,
                            style: likes,
                            textAlign: TextAlign.center,
                            controller: soundController,
                            onTap: () {
                              _soundCheck();
                            },
                            decoration: inputDecorationTime(context,hint: "Start time",
                            suffixIcon: const Icon(Icons.access_time_outlined,size: 20,color: appColor)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text("We recommended Sound Check 60 minute before start time",style: likes,textAlign: TextAlign.start),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: appColor)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.watch_later_rounded,color: appColor,size: 24),
                            const SizedBox(width: 5.0),
                            Text("Show time",style: GoogleFonts.poppins(textStyle: buttonText)),
                            const Spacer(),
                            const Text("**Stage Performance time limited to 120 minute",style: likes)
                          ],
                        ),
                        const Divider(color: Colors.grey),
                        Row(
                          children:  [
                            const Text("Start Time",style: cardTitle,),
                            const SizedBox(width: 5.0),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              width: _width*0.25,
                              child:TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter start time';
                                  }
                                  return null;
                                },
                                readOnly: true,
                                controller: startTimeController,
                                style: textFill,
                                decoration: inputDecoration(context),
                              ),
                            ),
                            const Spacer(),
                            const Text("End Time",style: cardTitle,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              width: _width*0.25,
                              child:TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter end time';
                                  }
                                  return null;
                                },
                                readOnly: true,
                                controller: endTimeController,
                                style: textFill,
                                decoration: inputDecoration(context),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: appColor)
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.free_breakfast,color: appColor,size: 24),
                            const SizedBox(width: 5.0),
                            Text("Break time",style: GoogleFonts.poppins(textStyle: buttonText)),
                            const SizedBox(width: 5.0),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey
                              ),
                              height: 35,
                              child:DropdownButtonHideUnderline(
                                  child:  DropdownButton(
                                    iconSize: 1,
                                    style: textFill,
                                    borderRadius: BorderRadius.circular(10),
                                    value: breakTimeValue,
                                    icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                                    dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                                    items: breakItems.map((String items) {
                                      return DropdownMenuItem(
                                        enabled: true,
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        breakTimeValue = newValue!;
                                      });
                                    },
                                  )),
                            ),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.grey
                              ),
                              height: 35,
                              child:DropdownButtonHideUnderline(
                                  child:  DropdownButton(
                                    iconSize: 1,
                                    style: textFill,
                                    borderRadius: BorderRadius.circular(10),
                                    value: breakTimeCountValue,
                                    icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                                    dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                                    items: breakCountItems.map((String items) {
                                      return DropdownMenuItem(
                                        enabled: true,
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        breakTimeCountValue = newValue!;
                                      });
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
              color: appBarColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: appColor),
                ),
                child: ExpansionTile(
                  title: Text("Category",style: GoogleFonts.poppins(textStyle: buttonText)),
                  trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
                  children: [
                    const Divider(color: Colors.white),
                    const SizedBox(height: 5.0,),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categoryList.length,
                        itemBuilder: (context, index) {
                          var data = categoryList[index];
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedCategory = true;
                                artistSelectCategory = data.name;
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                    color: artistSelectCategory  == "${data.name}" ? appColor : appBarColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: appColor)
                                ),
                                child: Text("${data.name}", style: textFill,textAlign: TextAlign.center,)),
                          );
                        },),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
              color: appBarColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: appColor),
                ),
                child: ExpansionTile(
                  title: Text("Formation",style: GoogleFonts.poppins(textStyle: buttonText)),
                  trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
                  children: [
                    const Divider(color: Colors.white),
                    const SizedBox(height: 5.0,),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: formationList.length,
                        itemBuilder: (context, index) {
                          var data = formationList[index];
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedBox = true;
                                artistSelect = data.name;
                                artistId = data.id;
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                                decoration: BoxDecoration(
                                    color: artistSelect  == "${data.name}" ? appColor : appBarColor,
                                    borderRadius: BorderRadius.circular(5.0),
                                    border: Border.all(color: appColor)
                                ),
                                child: Text("${data.name}", style: textFill,textAlign: TextAlign.center,)),
                          );
                        },),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
              color: appBarColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: appColor),
                ),
                child: ExpansionTile(
                  title: Text("Genres",style: GoogleFonts.poppins(textStyle: buttonText)),
                  trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
                  children: [
                    const Divider(color: Colors.white),
                    const SizedBox(height: 5.0,),
                    MultiSelectContainer(
                        items: genresList.map((e) {
                          return MultiSelectCard(
                            decorations: MultiSelectItemDecorations(
                              decoration: BoxDecoration(
                                  color: appBarColor,
                                  border: Border.all(color: appColor),
                                  borderRadius: BorderRadius.circular(10)),
                              selectedDecoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            value: e.name,
                            label: '${e.name}',
                            textStyles:  const MultiSelectItemTextStyles(textStyle: buttonText),
                            contentPadding: const EdgeInsets.all(12),
                            highlightColor: appColor,
                          );
                        }).toList(),
                        onChange: (allSelectedItems, selectedItem) {
                          selectedPrompts =  allSelectedItems;
                        },
                        splashColor: appColor
                    ),
                    const SizedBox(height: 5.0,),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              color: appBarColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  Text("Food & Beverages per artist",style: GoogleFonts.poppins(textStyle: buttonText)),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: _width*0.50,
                       // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFFFE262F),
                              checkColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                              value: mainCheck,
                              onChanged: (value) {
                                setState(() {
                                  mainCheck = value!;
                                });
                              },
                            ),
                            const Text("Main Course(Veg/NonVeg)   ",style: likes,)
                          ],
                        ),
                      ),
                      const Icon(Icons.clear,color: Colors.white,size: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0.0),
                        //margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: DropdownButtonHideUnderline(
                            child:  DropdownButton(
                              iconSize: 1,
                              style: textFill,
                              borderRadius: BorderRadius.circular(10),
                              value: mainValue,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                              dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                              items: mainItems.map((String items) {
                                return DropdownMenuItem(
                                  enabled: true,
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  mainValue = newValue!;
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: _width*0.50,
                        // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFFFE262F),
                              checkColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                              value: starterCheck,
                              onChanged: (value) {
                                setState(() {
                                  starterCheck = value!;
                                });
                              },
                            ),
                            const Text("Starter(Veg/NonVeg)   ",style: likes,)
                          ],
                        ),
                      ),
                      const Icon(Icons.clear,color: Colors.white,size: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0.0),
                        //margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: DropdownButtonHideUnderline(
                            child:  DropdownButton(
                              iconSize: 1,
                              style: textFill,
                              borderRadius: BorderRadius.circular(10),
                              value: starterValue,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                              dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                              items: starterItems.map((String items) {
                                return DropdownMenuItem(
                                  enabled: true,
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  starterValue = newValue!;
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: _width*0.50,
                        // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFFFE262F),
                              checkColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                              value: alcoholicCheck,
                              onChanged: (value) {
                                setState(() {
                                  alcoholicCheck = value!;
                                });
                              },
                            ),
                            const Text("Non Alcoholic Beverages   ",style: likes,)
                          ],
                        ),
                      ),
                      const Icon(Icons.clear,color: Colors.white,size: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0.0),
                        //margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: DropdownButtonHideUnderline(
                            child:  DropdownButton(
                              iconSize: 1,
                              style: textFill,
                              borderRadius: BorderRadius.circular(10),
                              value: alcoholicValue,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                              dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                              items: alcoholicItems.map((String items) {
                                return DropdownMenuItem(
                                  enabled: true,
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  alcoholicValue = newValue!;
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: _width*0.50,
                        // margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: Row(
                          children: [
                            Checkbox(
                              activeColor: const Color(0xFFFE262F),
                              checkColor: Colors.white,
                              side: const BorderSide(
                                color: Colors.white,
                              ),
                              value: nonAlcoholicCheck,
                              onChanged: (value) {
                                setState(() {
                                  nonAlcoholicCheck = value!;
                                });
                              },
                            ),
                            const Text("Alcoholic Beverages   ",style: likes,)
                          ],
                        ),
                      ),
                      const Icon(Icons.clear,color: Colors.white,size: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 0.0),
                        //margin: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: appColor)
                        ),
                        child: DropdownButtonHideUnderline(
                            child:  DropdownButton(
                              iconSize: 1,
                              style: textFill,
                              borderRadius: BorderRadius.circular(10),
                              value: nonAlcoholicValue,
                              icon: const Icon(Icons.keyboard_arrow_down_outlined,size: 24,color: Colors.white),
                              dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                              items: nonAlcoholicItems.map((String items) {
                                return DropdownMenuItem(
                                  enabled: true,
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  nonAlcoholicValue = newValue!;
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Text("        Pin code",style: GoogleFonts.poppins(textStyle: buttonText)),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter pin code';
                  }
                  return null;
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6)],
                controller: pinController,
                style: textFill,
                keyboardType: TextInputType.number,
                decoration: inputDecoration(context,),
              ),
            ),
            const SizedBox(height: 15.0),
            /// book now button
            GestureDetector(
              onTap: (){
                ArtistBookingProcess().artistBookingApi(
                    context: context,
                    bookDate: DateTime.now().toString(),
                    bookSlot: slotValue == "Morning Slot" ? "1" : slotValue == "Afternoon Slot" ? "2" : "3",
                    showStart: morningStart.text,
                    showEnd: morningEnd.text,
                    soundCheck: soundController.text,
                    noBreak: breakTimeValue.toString(),
                    formation: artistSelect.toString(),
                    genres: selectedPrompts.join(","),
                    mainCourse: mainCheck == true ? mainValue.toString() : "",
                    starter: starterCheck == true ? starterValue.toString() : "",
                    alcoholic:  nonAlcoholicCheck == true ? nonAlcoholicValue.toString() : "",
                    nonAlcoholic: alcoholicCheck == true ? alcoholicValue.toString() : ""
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.center,
                width: 140,
                height: 50.0,
                decoration: boxDecoration(),
                child: const Text('Book Now', style: buttonText),
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}

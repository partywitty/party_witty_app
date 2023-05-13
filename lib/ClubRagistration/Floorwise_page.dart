
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/ClubRagistration/photographer_page.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/addClientDetails.dart';
import '../ApiServices/clubAddress.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class Floorwise_page extends StatefulWidget {
  const Floorwise_page({Key? key}) : super(key: key);

  @override
  State<Floorwise_page> createState() => _Floorwise_pageState();
}

class _Floorwise_pageState extends State<Floorwise_page> {
  TextEditingController seatindtext1 = TextEditingController();
  TextEditingController seatindtext2 = TextEditingController();
  TextEditingController seatindtext3 = TextEditingController();
  List<TextEditingController>? privateControllers = [];
  List<TextEditingController>? floorControllers = [];
  List<TextEditingController>? musicControllers = [];

  String? Selectmusicfirst;
  bool ismusicfirst = false;

   String? Selectfloorfirst;
  bool isfloorfirst = false;

  String? Selectmusicsecond;
  bool ismusicSecond = false;
  String? Selectfloorsecond;
  bool isfloorSecond = false;

  String? Selectfloorthird;
  bool isfloorThird = false;
  String? Selectmusicthird;
  bool ismusicThird = false;



  String? jsonListDynamic;
  List<queAns> submitANS = [];
  List<queAns> second_dataList = [];
  List <queAns> third_datalist =[];
  //List<FloorData> getFloorList = [];
 // FloorData getFloorList = FloorData();
  final _formKey=GlobalKey<FormState>();
  var items = [
    'RoofTop',
    'Indoor',
  ];
  var itemsMusic = [
    'Live Music',
    'DJ',
    'Instrument',
  ];
  String floorValue = 'RoofTop';
  String musicValue = 'Live Music';
  String dropdownvalue = 'Live Music1';



  load(){
    ClubRegistration().getFloorApi().then((value) => {
      setState((){
        GetFloorM = value.data!;
      })
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  List GetFloorM = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            scrollDirection: axisDirectionToAxis(
              AxisDirection.down,
            ),
            child: SizedBox(
              width: width,
              child: Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.63,
                    child: Image.asset(
                      'assests/light.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                      height: height,
                      width: width,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20,bottom: 10.0),
                            child: Text("Floor wise seats availability",style: GoogleFonts.poppins(textStyle: appTitle)),),
                          const Divider(height: 10, color: Colors.grey,),
                          SizedBox(
                            height: height/1.5,
                            child: ListView.builder(
                              itemCount: GetFloorM.length,
                              itemBuilder: (context, index) {
                                var data = GetFloorM[index];
                                privateControllers!.add(TextEditingController());
                                floorControllers!.add(TextEditingController());
                                musicControllers!.add(TextEditingController());
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30, top: 10),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Floor ${data}", style:GoogleFonts.poppins(textStyle: drawerSubtitle)),
                                          SizedBox(
                                            width: 200,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text("Seating",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                                                const SizedBox(width: 12,),
                                                SizedBox(
                                                  height: 40,
                                                  width: 80,
                                                  child: Center(
                                                    child: TextFormField(
                                                      validator: (val){
                                                        if(val!.isEmpty){
                                                          return 'Empty';
                                                        }else null;
                                                      },
                                                      controller: privateControllers![index],
                                                      keyboardType: TextInputType.number,
                                                      style: textFill,
                                                      cursorColor: Colors.blue,
                                                      decoration: inputDecoration(context,hint: "Seat"),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text("  Floor Type", style: GoogleFonts.poppins(textStyle: appTitle)),
                                    const SizedBox(height: 10,),
                                    // DropdownButtonHideUnderline(
                                    //   child: ButtonTheme(
                                    //     alignedDropdown: true,
                                    //     child: DropdownButtonFormField(
                                    //       dropdownColor: appBarColor,
                                    //       decoration: inputDecoration(context),
                                    //       hint: const Text("Select Course", style: textHint,),
                                    //       value:floorValue,
                                    //       isExpanded: true,
                                    //       iconSize: 24,
                                    //       elevation: 1,
                                    //       style: const TextStyle(color: Colors.black,
                                    //         fontWeight: FontWeight.bold,),
                                    //       onChanged: (String? newValue) {
                                    //         setState(() {
                                    //           floorValue = newValue!;
                                    //           submitANS.add(queAns(
                                    //               floor_name: '',
                                    //               seating: privateControllers![index].text,
                                    //               floor_type:floorControllers![index].text,
                                    //               music_type: ''));
                                    //         });
                                    //       },
                                    //       validator: (value) {
                                    //         if (value == null) {
                                    //           return 'Please select course';
                                    //         }
                                    //         return null;
                                    //       },
                                    //       items: items.map((data) => DropdownMenuItem<String>(
                                    //         onTap: (){
                                    //           setState(() {
                                    //
                                    //           });
                                    //         },
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.only(left: 8.0),
                                    //           child:Text(data.toString(),
                                    //               style: textFill
                                    //           ),
                                    //         ), value:data.toString(),)).toList(),
                                    //     ),
                                    //   ),
                                    // ),

                                    TextFormField(
                                      readOnly: true,
                                      onTap: (){
                                        // setState(() {
                                        //     submitANS.add(queAns(
                                        //         floor_name: '',
                                        //         seating: privateControllers![index].text,
                                        //         floor_type: floorControllers![index].text,
                                        //         music_type: ""));
                                        // });
                                        showDialog(context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                backgroundColor: const Color(0xFF2D2B42),
                                                contentPadding: const EdgeInsets.all(0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                content: StatefulBuilder(builder: (context, StateSetter setState) {
                                                  return  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                                                    height: height/5,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const SizedBox(height: 10,),
                                                        InkWell(
                                                            onTap: (){
                                                              setState((){
                                                                floorControllers![index].text = "RoofTop";
                                                                Navigator.pop(context);
                                                              });
                                                            },
                                                            child: Text("RoofTop",style: appTitle,)),
                                                        const Divider(color: Colors.white,),
                                                        const SizedBox(height: 10,),
                                                        InkWell(
                                                            onTap: (){
                                                              setState((){
                                                                floorControllers![index].text = "Indoor";
                                                                Navigator.pop(context);
                                                              });
                                                            },
                                                            child: Text("Indoor",style: appTitle,)),
                                                        const Divider(color: Colors.white,),
                                                        const SizedBox(height: 10,),
                                                        InkWell(
                                                            onTap: (){
                                                              setState((){
                                                                floorControllers![index].text = "Open";
                                                                Navigator.pop(context);
                                                              });
                                                            },
                                                            child: Text("Open",style: appTitle,)),
                                                        const Divider(color: Colors.white,),
                                                        const SizedBox(height: 10,),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                              );
                                            }
                                        );
                                      },
                                      controller: floorControllers![index],
                                      style: textFill,
                                      decoration: inputDecoration(context,
                                          suffixIcon: const Icon(Icons.arrow_drop_down,color: Colors.white,size: 24,)),
                                    ),

                                    const SizedBox(height: 10,),
                                    Text("  Music Type", style: GoogleFonts.poppins(textStyle: appTitle)),
                                    const SizedBox(height: 10,),
                                    const SizedBox(height: 10,),

                                    TextFormField(
                                     readOnly: true,
                                     onTap: (){
                                       setState(() {
                                         submitANS.add(queAns(
                                             floor_name: '',
                                             seating: privateControllers![index].text,
                                             floor_type: floorControllers![index].text,
                                             music_type: musicControllers![index].text));
                                       });
                                       showDialog(context: context,
                                           builder: (BuildContext context) {
                                             return AlertDialog(
                                               backgroundColor: const Color(0xFF2D2B42),
                                               contentPadding: const EdgeInsets.all(0),
                                               shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20),
                                               ),
                                               content: StatefulBuilder(builder: (context, StateSetter setState) {
                                                 return  Container(
                                                   padding: EdgeInsets.symmetric(horizontal: 20.0),
                                                   height: height/5,
                                                   child: Column(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: [
                                                       const SizedBox(height: 10,),
                                                       InkWell(
                                                         onTap: (){
                                                           setState((){
                                                             musicControllers![index].text = "Live Music";
                                                             Navigator.pop(context);
                                                           });
                                                         },
                                                           child: Text("Live Music",style: appTitle,)),
                                                       const Divider(color: Colors.white,),
                                                       const SizedBox(height: 10,),
                                                       InkWell(
                                                           onTap: (){
                                                             setState((){
                                                               musicControllers![index].text = "DJ";
                                                               Navigator.pop(context);
                                                             });
                                                           },
                                                           child: Text("DJ",style: appTitle,)),
                                                       const Divider(color: Colors.white,),
                                                       const SizedBox(height: 10,),
                                                       InkWell(
                                                           onTap: (){
                                                             setState((){
                                                               musicControllers![index].text = "Instrument";
                                                               Navigator.pop(context);
                                                             });
                                                           },
                                                           child: Text("Instrument",style: appTitle,)),
                                                       const SizedBox(height: 5,),
                                                     ],
                                                   ),
                                                 );
                                               }),
                                             );
                                           }
                                       );
                                     },
                                      controller: musicControllers![index],
                                      style: textFill,
                                      decoration: inputDecoration(context,
                                      suffixIcon: const Icon(Icons.arrow_drop_down,color: Colors.white,size: 24,)),
                                    ),


                                    // DropdownButtonHideUnderline(
                                    //   child: ButtonTheme(
                                    //     alignedDropdown: true,
                                    //     child: DropdownButtonFormField(
                                    //       dropdownColor: appBarColor,
                                    //       decoration: inputDecoration(context),
                                    //       hint: const Text("Select Course", style: textHint,),
                                    //       value:musicValue,
                                    //       isExpanded: true,
                                    //       iconSize: 24,
                                    //       elevation: 1,
                                    //       style: const TextStyle(color: Colors.black,
                                    //         fontWeight: FontWeight.bold,),
                                    //       onChanged: (String? newValue) {
                                    //         setState(() {
                                    //           musicValue = newValue!;
                                    //         });
                                    //       },
                                    //       validator: (value) {
                                    //         if (value == null) {
                                    //           return 'Please select ';
                                    //         }
                                    //         return null;
                                    //       },
                                    //       items: itemsMusic.map((data) => DropdownMenuItem<String>(
                                    //         onTap: (){
                                    //           setState(() {
                                    //
                                    //           });
                                    //         },
                                    //         child: Padding(
                                    //           padding: const EdgeInsets.only(left: 8.0),
                                    //           child:Text(data.toString(),
                                    //               style: textFill
                                    //           ),
                                    //         ), value:data.toString(),)).toList(),
                                    //     ),
                                    //   ),
                                    // ),
                                    const SizedBox(height: 10,),
                                    const Divider(height: 10, color: Colors.grey,),
                                    const SizedBox(height: 10,),
                                  ],
                                );
                              },),
                          ),
                          const SizedBox(height: 10,),
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                // submitANS.add(queAns(floor_name: '', seating:'',
                                //     floor_type:'', music_type: ''));

                                var data = submitANS.map((e) => {
                                  '"floor_name"': '"${'floor1'}"',
                                  '"seating"': '"${e.seating.toString()}"',
                                  '"music_type"' : '"${e.music_type.toString()}"',
                                  '"floor_type"': '"${e.floor_type.toString()}"'
                                }).toList(growable: true);

                                jsonListDynamic=jsonEncode(data);
                                var list = [data.join(',')];
                                // var list = [data.join(','),secondfloordata.join(','),thirdfloordata.join(',')];
                                AddClientDataApi().addClient(floordeatail: list.toString(),context: context).then((value) =>
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Photographer_page()),)
                                );
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
                        ],
                      ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class queAns {
  String floor_name;
  String seating;
  String floor_type;
  String music_type;

  queAns(
      {required this.floor_name, required this.seating, required this.floor_type, required this.music_type});

  Map toJson() => {
    'floor_name': floor_name,
    'seating': seating,
    'floor_type': floor_type,
    'music_type':music_type,
  };
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/clubAddress.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'manyFlore.dart';

class Dance_page extends StatefulWidget {
  const Dance_page({Key? key}) : super(key: key);

  @override
  State<Dance_page> createState() => _Dance_pageState();
}

class _Dance_pageState extends State<Dance_page> {

  String? SelectDj;
  bool isSelected=false;
  String? SelectDancefloor;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: axisDirectionToAxis(
          AxisDirection.down,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height*0.61,
                child: Image.asset(
                  'assests/light.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    // height: 200,
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: const BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dj availability", style: GoogleFonts.poppins(textStyle: appTitle)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                fillColor: MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {return (isSelected) ? Colors.white : Color(0xFFfd2630);
                                    }),
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                autofocus: true,
                                value: "Yes",
                                groupValue: SelectDj,
                                onChanged: (value) {
                                  setState(() {SelectDj = value.toString();
                                  });
                                },
                              ),
                              Text(
                                'Yes',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                    fontSize: 14, color: Colors.white),
                              ),
                              const SizedBox(width: 20,),
                              Radio(
                                activeColor: Color(0xFFfd2630),
                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  return (isSelected) ? Colors.white : Color(0xFFfd2630);
                                }),
                                value: "No",
                                groupValue: SelectDj,
                                onChanged: (value) {
                                  setState(() {SelectDj = value.toString();
                                  });
                                },
                              ),
                              Text(
                                'No',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                          Text("Dance floor", style: GoogleFonts.poppins(textStyle: appTitle)),
                          const SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                // activeColor:  Color(0xFFfd2630),
                                fillColor:
                                MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  return (value) ? Colors.white : Color(0xFFfd2630);
                                }),
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                autofocus: true,
                                value: "Yes",
                                groupValue: SelectDancefloor,
                                onChanged: (value) {
                                  setState(() {
                                    SelectDancefloor = value.toString();
                                  });
                                },
                              ),
                              Text(
                                'Yes',
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                              ),
                              const SizedBox(width: 20,),
                              Radio(
                                activeColor: Color(0xFFfd2630),
                                fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                  return (value) ? Colors.white : Color(0xFFfd2630);
                                }),
                                value: "No",
                                groupValue: SelectDancefloor,
                                onChanged: (value) {
                                  setState(() {
                                    SelectDancefloor = value.toString();
                                  });
                                },
                              ),
                              Text(
                                'No',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if(SelectDancefloor==null||SelectDj==null){
                                  CommonToast(context: context, title: 'please select ', alignCenter: false);
                                }else {
                                  ClubRegistration()
                                      .Dj_avalabity_api(
                                      dj_avaibility: SelectDj,
                                      dance_floor: SelectDancefloor,
                                      context: context)
                                      .then((value) =>
                                  Get.to(numberOfFlore())
                                  );
                                }},
                              child: Container(
                                 alignment: Alignment.center,
                                width: 140,
                                height: 50.0,
                                decoration: boxDecoration(),
                                child: Text('Submit', style: GoogleFonts.poppins(textStyle: buttonText)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35)
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/sponser.dart';
import 'bottomSheet.dart';

class Sponsorship_page extends StatefulWidget {
  const Sponsorship_page({Key? key}) : super(key: key);

  @override
  State<Sponsorship_page> createState() => _Sponsorship_pageState();
}

class _Sponsorship_pageState extends State<Sponsorship_page> {
  String? Select;
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
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height*0.63,
                child: Image.asset(
                  'assests/light.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:30),
                              child: Text("Would you be interested in sponsorship from various brands",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 22,
                                      color: Colors.white)),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 36.0),
                              child: Row(
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
                                    groupValue: Select,
                                    onChanged: (value) {
                                      setState(() {
                                        Select = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'Yes',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(width: 20,),
                                  Radio(
                                    activeColor: Color(0xFFfd2630),
                                    fillColor:
                                    MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                      return (value) ? Colors.white : Color(0xFFfd2630);
                                    }),
                                    value: "No",
                                    groupValue: Select,
                                    onChanged: (value) {
                                      setState(() {
                                        Select = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'No',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      if(Select!=null) {
                                        Wantsponser_Api().wantsponser_api(
                                            want_sponsorship: Select.toString()).then((value) =>
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => bottomSheet(),)));
                                      } else
                                        CommonToast(context: context, title:'please select ', alignCenter: false);
                                    },
                                    child: Container(
                                      width: 140,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: FractionalOffset(0.1, 0.1),
                                          end: FractionalOffset(0.8, 0.1),
                                          colors: [
                                            Color(0xFFFE262F),
                                            Color(0xFFFD2F71),
                                          ],
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      child: Center(
                                        child: Text('Submit',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Padding(
                              padding: const EdgeInsets.only( ),
                              child: Center(
                                child: Text("thanks for showing interest in sponsorship, our backend",
                                    textScaleFactor: 1,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8,
                                        color: Colors.white)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("will call you to ",
                                      textScaleFactor: 1,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8,
                                          color: Colors.white)),
                                  Text("share the details",
                                      textScaleFactor: 1,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8,
                                          color: Colors.red)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
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
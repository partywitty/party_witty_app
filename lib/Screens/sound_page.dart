import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sound_page extends StatefulWidget {
  const sound_page({Key? key}) : super(key: key);

  @override
  State<sound_page> createState() => _sound_pageState();
}

class _sound_pageState extends State<sound_page> {
  String? Select;
  bool isSelected=false;
  String? gender;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                height: height*0.6,
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
                  // bottom: height*0.2,

                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      // height: 200,
                      width: width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:30 ),
                              child: Text("Sound Availability in House",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 43.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yes',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Radio(
                                    // activeColor:  Color(0xFFfd2630),
                                    fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return (value)
                                              ? Colors.white
                                              : Color(0xFFfd2630);
                                        }),
                                    focusColor: Colors.white,
                                    hoverColor: Colors.white,
                                    autofocus: true,
                                    value: "Yes",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'No',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Radio(
                                    activeColor: Color(0xFFfd2630),
                                    fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return (value)
                                              ? Colors.white
                                              : Color(0xFFfd2630);
                                        }),
                                    value: "N0",
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:30 ),
                              child: Text("Sound Engineer in House",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 43.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yes',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Radio(
                                    // activeColor:  Color(0xFFfd2630),
                                    fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return (isSelected)
                                              ? Colors.white
                                              : Color(0xFFfd2630);
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
                                    'No',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  Radio(
                                    activeColor: Color(0xFFfd2630),
                                    fillColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {
                                          return (isSelected)
                                              ? Colors.white
                                              : Color(0xFFfd2630);
                                        }),
                                    value: "No",
                                    groupValue: Select,
                                    onChanged: (value) {
                                      setState(() {
                                        Select = value.toString();
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/manager_page');
                                    },
                                    child: Container(
                                      width: 140,
                                      height: 50.0,
                                      decoration: BoxDecoration(
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
                              height: 30,
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

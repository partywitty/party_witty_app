import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Manager_page extends StatefulWidget {
  const Manager_page({Key? key}) : super(key: key);

  @override
  State<Manager_page> createState() => _Manager_pageState();
}

class _Manager_pageState extends State<Manager_page> {
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
                        padding: const EdgeInsets.only(top: 45.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:45 ),
                              child: Text("POC - Manager Number",
                                  textScaleFactor: 1,
                                  softWrap: true,
                                  style: GoogleFonts.poppins(

                                      fontWeight: FontWeight.w400,
                                      fontSize: 21,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:60 ),
                              child: Text("Phone Number",

                                  softWrap: true,
                                  style: GoogleFonts.poppins(

                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:3,left: 33,right: 30),
                              child: Container(
                                decoration: (BoxDecoration(
                                    color: Color(0xFF434445),
                                    borderRadius: BorderRadius.circular(30))),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 25.0),
                                      child: Container(
                                        child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
                                                child: Image.asset(
                                                  'assests/ind_img.png',
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                child: Text(
                                                  '+91',
                                                  style:
                                                  TextStyle(color: Colors.white),
                                                ),

                                                //     child: DropdownButton(iconSize: 12,
                                                //   value: dropdownvalue,dropdownColor: Colors.blueGrey,focusColor: Colors.blueGrey,
                                                //   icon:
                                                //       const Icon(Icons.keyboard_arrow_down),
                                                //   items: items.map((String items) {
                                                //     return DropdownMenuItem(
                                                //       enabled: true,
                                                //       value: items,
                                                //       child: Text(items),
                                                //     );
                                                //   }).toList(),
                                                //   onChanged: (String? newValue) {
                                                //     setState(() {
                                                //       dropdownvalue = newValue!;
                                                //     });
                                                //   },
                                                // )),
                                                // Expanded(
                                                //   child: TextField(
                                                //     keyboardType: TextInputType.phone,
                                                //     decoration: InputDecoration(
                                                //       border: InputBorder.none,
                                                //       hintText: "Phone Number",
                                                //     ),
                                                //     onChanged: (value) {
                                                //       // this.phoneNo=value;
                                                //       print(value);
                                                //     },
                                                //   ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                height: 25,
                                                width: 1.5,
                                                color: Colors.white,
                                              ),
                                              Container(
                                                width: 180,
                                                child: TextField(
                                                  autofocus: false,
                                                  keyboardType: TextInputType.number,
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Color(0xFFbdc6cf)),
                                                  decoration: InputDecoration(
                                                    hintText: 'Phone Number',
                                                    hintStyle: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 14,
                                                        color: Colors.white70),
                                                    // filled: true,
                                                    contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 20.0,
                                                        bottom: 6.0,
                                                        top: 10.0),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(0xFF434445)),
                                                      borderRadius:
                                                      BorderRadius.circular(25.7),
                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Color(0xFF434445)),
                                                      borderRadius:
                                                      BorderRadius.circular(25.7),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Center(
                              child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/music_days_page');
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

                            SizedBox(
                              height: 10,
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

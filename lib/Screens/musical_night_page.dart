import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Musical_page extends StatefulWidget {
  const Musical_page({Key? key}) : super(key: key);

  @override
  State<Musical_page> createState() => _Musical_pageState();
}

class _Musical_pageState extends State<Musical_page> {
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
                              padding: const EdgeInsets.only(left:44 ),
                              child: Text("Special Musical Night",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 34.0, right: 35),
                              child: TextFormField(
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFFbdc6cf)),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.calendar_month_sharp,color: Colors.white,),
                                    hintText: '',
                                    hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Colors.white),
                                    fillColor: Color(0xFF434445),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 25.0, bottom: 12.0, top: 0.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color:Color(0xFF434445)),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF434445)
                                      ),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Center(
                              child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/sponsor_page');
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
                              height: 70,
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

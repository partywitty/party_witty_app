import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/clubAddress.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class Projected_page extends StatefulWidget {
  const Projected_page({Key? key}) : super(key: key);

  @override
  State<Projected_page> createState() => _Projected_pageState();
}

class _Projected_pageState extends State<Projected_page> {
  String? Selectprojector;
  bool projectvalue = false;
  String? Selectmatch;
  bool matchvalue = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: axisDirectionToAxis(AxisDirection.down,
          ),
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height*0.63,
                  child: Image.asset('assests/light.png', fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Do you have Projector Screen", style: GoogleFonts.poppins(textStyle: appTitle)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  // activeColor:  Color(0xFFfd2630),
                                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return (projectvalue) ? Colors.white : Color(0xFFfd2630);
                                  }),
                                  focusColor: Colors.white,
                                  hoverColor: Colors.white,
                                  autofocus: true,
                                  value: "Yes",
                                  groupValue: Selectprojector,
                                  onChanged: (value) {
                                    setState(() {Selectprojector = value.toString();
                                    });
                                  },
                                ),
                                Text('Yes', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),),
                                const SizedBox(width: 20,),
                                Radio(
                                  activeColor: Color(0xFFfd2630),
                                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return (projectvalue) ? Colors.white : Color(0xFFfd2630);
                                  }),
                                  value: "No",
                                  groupValue: Selectprojector,
                                  onChanged: (value) {setState(() {Selectprojector = value.toString();
                                  });
                                  },
                                ),
                                Text('No', style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            Text("Show live matches during the season ", style: GoogleFonts.poppins(textStyle: appTitle)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  // activeColor:  Color(0xFFfd2630),
                                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return (matchvalue) ? Colors.white : Color(0xFFfd2630);
                                  }),
                                  focusColor: Colors.white,
                                  hoverColor: Colors.white,
                                  autofocus: true,
                                  value: "Yes",
                                  groupValue: Selectmatch,
                                  onChanged: (value) {
                                    setState(() {Selectmatch = value.toString();
                                    });
                                  },
                                ),
                                Text(
                                  'Yes',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                ),
                                SizedBox(width: 20,),
                                Radio(
                                  activeColor: Color(0xFFfd2630),
                                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return (matchvalue) ? Colors.white : Color(0xFFfd2630);
                                  }),
                                  value: "No",
                                  groupValue: Selectmatch,
                                  onChanged: (value) {
                                    setState(() {Selectmatch = value.toString();
                                    });
                                  },
                                ),
                                Text(
                                  'No',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  print(Selectmatch);
                                  print(Selectprojector);
                                  if(Selectmatch==null||Selectmatch==null){
                                    CommonToast(context: context, title:"please select", alignCenter: false);
                                  }else {
                                    ClubRegistration().projector_api(
                                        live_match_season: Selectmatch,
                                        projector_screen: Selectprojector,
                                      context: context
                                    )
                                        .then((value) =>
                                        Navigator.pushNamed(context, '/dance_page'));
                                  } },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: Text('Submit', style: GoogleFonts.poppins(textStyle: buttonText)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
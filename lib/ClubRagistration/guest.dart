import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/clubAddress.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class Guest_page extends StatefulWidget {
  const Guest_page({Key? key}) : super(key: key);

  @override
  State<Guest_page> createState() => _Guest_pageState();
}

class _Guest_pageState extends State<Guest_page> {
  String? gender;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
                  height: height*0.63,
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
                Positioned(
                    bottom: 0,
                    child: Container(
                      // height: 200,
                      width: width,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Do you wish to get guest from the application", style: GoogleFonts.poppins(textStyle: appTitle)),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 35,
                                child: Radio(
                                  fillColor:
                                  MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return (value) ? Colors.white : Color(0xFFfd2630);
                                  }),
                                  focusColor: Colors.white,
                                  hoverColor: Colors.white,
                                  autofocus: true,
                                  value: "Yes",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                      print(gender);
                                    });
                                  },
                                ),
                              ),
                              const Text('Yes',style: textLabel,),
                              const SizedBox(width: 30,),
                              SizedBox(
                                width: 35,
                                child: Radio(
                                  activeColor: Color(0xFFfd2630),
                                  fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        return (value)
                                            ? Colors.white
                                            : Color(0xFFfd2630);
                                      }),
                                  value: "No",
                                  groupValue: gender,
                                  onChanged: (value) {
                                    setState(() {
                                      gender = value.toString();
                                      print(gender);
                                    });
                                  },
                                ),
                              ),
                              const Text('No',style: textLabel),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if(gender=='Yes'){
                                  ClubRegistration().guest_api(guest_form: gender.toString(),context: context);
                                  Navigator.pushNamed(context, '/projected_page');
                                }else{
                                  ClubRegistration().guest_api(guest_form: gender.toString(),context: context);
                                  Navigator.pushNamed(context, '/projected_page');
                                }
                                },
                              child: Container(
                                alignment: Alignment.center,
                                width: 140,
                                height: 50.0,
                                decoration: boxDecoration(),
                                child: Text('Submit', style: GoogleFonts.poppins(textStyle: buttonText)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50,),
                        ],
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
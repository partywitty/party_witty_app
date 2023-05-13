// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/otp_api.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'artistReferral.dart';

class artist extends StatefulWidget {
  const artist({Key? key}) : super(key: key);

  @override
  State<artist> createState() => _artistState();
}

class _artistState extends State<artist> {
  bool value = false;

  bool isLoading = false;
  var Selectrole;
  var typeColor;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height*0.65,
                  child: Image.asset(
                    'assests/A_img.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned(
                //   child: IconButton(
                //     color: Colors.white,
                //     icon: const Icon(Icons.arrow_back_ios),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //   ),
                // ),
                Positioned(
                  bottom: 0,
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only( top:20,left: 32,right: 32,bottom: 12),
                                    child:  InkWell(
                                      onTap: (){
                                        setState(() {
                                          Selectrole='Artist';
                                          typeColor = Selectrole;
                                        });
                                      },
                                      child: Text(
                                          "I am an artist",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize:16, color: typeColor == 'Artist' ? Color(0xFFFD2F71) :Colors.white,)
                                      ),
                                    ),
                                  ),
                                Divider(height: 0.8,color: Colors.grey.shade600,),
                                Padding(
                                  padding: const EdgeInsets.only(top:13,left: 32,right: 32),
                                  child:InkWell(
                                    onTap: (){
                                      setState(() {
                                        Selectrole='Club';
                                        typeColor = Selectrole;
                                        print(Selectrole);
                                      });
                                    },
                                    child: Text(
                                        "I am a Club / Restaurant / Lounge",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize:16, color:typeColor == 'Club' ? Color(0xFFFD2F71) :  Colors.white,)
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 70),
                                ///submit button
                                isLoading ?
                                const Center(child: CircularProgressIndicator()) :
                                Center(
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        isLoading = true;
                                      });
                                      if(Selectrole == null){
                                        setState(() {
                                          isLoading = false;
                                        });
                                        CommonToast(context: context, title: 'Please select Type', alignCenter: false);
                                      }else{
                                        Otp_Api().artist_role(role: Selectrole,context: context);
                                        setState(() {
                                          isLoading = false;
                                        });
                                        Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => artistReferral(
                                            type: Selectrole,
                                          ),));
                                      }
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
                                const SizedBox(height: 70),
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


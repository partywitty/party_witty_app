
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../ApiServices/otp_api.dart';
import '../Controller/style.dart';

class forgetOtp extends StatefulWidget {
  String userId;
  forgetOtp({Key? key,required this.userId}) : super(key: key);

  @override
  State<forgetOtp> createState() => _forgetOtpState();
}

class _forgetOtpState extends State<forgetOtp> {

  OtpFieldController otpController = OtpFieldController();
  var otptap;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height * 0.7,
                child: Image.asset(
                  'assests/A_img.png',
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
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                      width: width,
                      // height: height,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50.0,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 34.0),
                              child: Text("Enter Verification Code",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                      color: Colors.white)),
                            ),
                            const SizedBox(height: 8,),
                            Padding(
                              padding: const EdgeInsets.only(left: 34),
                              child: Text(
                                  "We've send you an email with a confirmation code. Please enter the 4-digit code below.",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white)),
                            ),
                            const SizedBox(height: 20,),
                            Center(
                              child: SizedBox(
                                height: 50,
                                width: 250,
                                child:OTPTextField(
                                    controller: otpController,
                                    length: 4,
                                    width: MediaQuery.of(context).size.width,
                                    textFieldAlignment: MainAxisAlignment.spaceAround,
                                    fieldWidth: 50,
                                    otpFieldStyle: OtpFieldStyle(
                                      // borderColor: Colors.red,
                                      disabledBorderColor: Colors.red,
                                      enabledBorderColor:Color(0xFF434445),
                                      backgroundColor: Color(0xFF434445),
                                    ),
                                    fieldStyle: FieldStyle.box,
                                    outlineBorderRadius: 30,
                                    style:GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22,
                                        color: Colors.white),
                                    onChanged: (pin) {
                                      print("Changed: " + pin);
                                    },
                                    onCompleted: (pin) {
                                      setState((){
                                        otptap=pin;
                                      });
                                      print("Completed: " + otptap);
                                    }),
                              ),
                            ),
                            const SizedBox(height: 50,),
                            Center(
                              child: Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Otp_Api().forGetOtp(otp: otptap.toString(),userIds: widget.userId.toString(),context: context).then((value) {});
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 140,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: FractionalOffset(0.1, 0.1),
                                          end: FractionalOffset(0.7, 0.1),
                                          colors: [
                                            Color(0xFFFE262F),
                                            Color(0xFFFD2F71),
                                          ],
                                        ),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                      ),
                                      child: Text('Submit', style: buttonText,
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


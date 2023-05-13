
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/upload_video.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/utils.dart';

class introMessage extends StatefulWidget {
  const introMessage({Key? key}) : super(key: key);

  @override
  State<introMessage> createState() => _introMessageState();
}

class _introMessageState extends State<introMessage> {

  TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height * 0.8,
                child: Image.asset(
                  'assests/A_img.png',
                  fit: BoxFit.cover,
                ),
              ),
              // Positioned(
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 40, left: 30),
              //     child:SizedBox(
              //       width: 40,
              //       height: 40,
              //       child:  IconButton(
              //         color: Colors.white,
              //         icon: Icon(Icons.arrow_back_ios),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //     ),
              //   ),
              // ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      width: width,
                      // height: height*0.5,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 50.0),
                              child: Text("Intro introMessage in words", style: GoogleFonts.poppins(textStyle: textLabel)),
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(right: 42,left: 42),
                              child: TextFormField(
                                controller: description,
                                  maxLines: 5,
                                  maxLength: 100,
                                  autofocus: false,
                                  style: textFill,
                                  decoration: InputDecoration(
                                    hintText: 'Write a introMessage...',
                                    hintStyle: textHint,
                                    fillColor: const Color(0xFF434445),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 20.0, bottom: 12.0, top: 10.0,right: 20),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color:  Color(0xFF434445),),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Color(0xFF434445),),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 20,),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if(description.text == ''){
                                    CommonToast(context: context, title: 'Please enter intro introMessage', alignCenter: false);
                                  }else {
                                    GetArtistList().introSubmit(
                                        description: description.text,
                                        context: context).then((value) {
                                      Get.to(const Upload_video());
                                    });
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: const Text('Submit',style: buttonText),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
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

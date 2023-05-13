
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Streaming.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'fb_message.dart';

class Streamup extends StatefulWidget {
  const Streamup({Key? key}) : super(key: key);

  @override
  State<Streamup> createState() => _StreamupState();
}

class _StreamupState extends State<Streamup> {

  TextEditingController spotify = TextEditingController();
  TextEditingController amazon = TextEditingController();
  TextEditingController jio = TextEditingController();
  TextEditingController apple = TextEditingController();
  TextEditingController tidal = TextEditingController();
  TextEditingController deezer = TextEditingController();
  TextEditingController pandoora = TextEditingController();
  TextEditingController quzol = TextEditingController();
  bool isLoading = false;
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
                height: height * 0.45,
                child: Image.asset(
                  'assests/A_img.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 15),
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  top: 100,
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
                        padding: const EdgeInsets.only(
                            top: 40.0, left: 30, right: 30),
                        child: ListView(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Text("Original song streaming platforms",style: GoogleFonts.poppins(textStyle: bigTitle)),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: spotify,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                              decoration: inputDecorationSuffix(context,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assests/spotify.png',
                                    width: 10,height: 10,fit: BoxFit.contain),
                              )),
                            ),
                            const SizedBox(height: 15.0,),
                            TextFormField(
                              controller: amazon,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                              decoration: inputDecorationSuffix(context,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assests/am.png',
                                        width: 10,height: 10,fit: BoxFit.contain),
                                  )),
                            ),
                            const SizedBox(height: 15.0,),
                            TextFormField(
                              controller: jio,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                                decoration: inputDecorationSuffix(context,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assests/jio.png',
                                          width: 10,height: 10,fit: BoxFit.contain),
                                    ))
                            ),
                            const SizedBox(height: 15.0,),
                            TextFormField(
                              controller: apple,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                                decoration: inputDecorationSuffix(context,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assests/app.png',
                                          width: 10,height: 10,fit: BoxFit.contain),
                                    ))
                            ),
                            const SizedBox(height: 15.0,),
                            TextFormField(
                              controller: tidal,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                                decoration: inputDecorationSuffix(context,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assests/tid.png',
                                          width: 10,height: 10,fit: BoxFit.contain),
                                    ))
                            ),
                            const SizedBox(height: 15.0,),
                            TextFormField(
                              controller: deezer,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                                decoration: inputDecorationSuffix(context,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assests/deezer.png',
                                          width: 10,height: 10,fit: BoxFit.contain),
                                    ))
                            ),
                            const SizedBox(height: 15.0,),
                            TextFormField(
                              controller: pandoora,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                                decoration: inputDecorationSuffix(context,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assests/pandoora.png',
                                          width: 10,height: 10,fit: BoxFit.contain),
                                    ))
                            ),
                            const SizedBox(height: 15.0,),
                            TextFormField(
                              controller: quzol,
                              keyboardType: TextInputType.emailAddress,
                              autofocus: false,
                              style: textFill,
                                decoration: inputDecorationSuffix(context,
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset('assests/qzo.png',
                                          width: 10,height: 10,fit: BoxFit.contain),
                                    ))
                            ),
                            const SizedBox(height: 10,),
                            isLoading ?
                            const Center(child: CircularProgressIndicator(color: appColor,)) :
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    StreamingApi().stream_submit(
                                        spotify: spotify.text,
                                        amazon: amazon.text,
                                        jio: jio.text,
                                        apple: apple.text,
                                        tidel: tidal.text,
                                        deezer: deezer.text,
                                        pandoora: pandoora.text,
                                        qubon: quzol.text,
                                        context: context).then((value) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });
                                    Get.to(const FaceBook());
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => FaceBook(),));
                                    setState(() {
                                      isLoading = false;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 140,
                                    height: 50.0,
                                    decoration: boxDecoration(),
                                    child: const Text('Submit',style: buttonText),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FaceBook(),));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 140,
                                    height: 50.0,
                                    decoration: boxDecoration(),
                                    child: const Text('Skip',style: buttonText),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40,),
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

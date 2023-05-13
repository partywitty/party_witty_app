
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/clubAddress.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class numberOfFlore extends StatefulWidget {
  const numberOfFlore({Key? key}) : super(key: key);

  @override
  State<numberOfFlore> createState() => _numberOfFloreState();
}

class _numberOfFloreState extends State<numberOfFlore> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController floreController = TextEditingController();

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
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height*0.81,
                child: Image.asset(
                  'assests/light.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
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
                    decoration: const BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("How many floor you have", style: GoogleFonts.poppins(textStyle: appTitle)),
                          const SizedBox(height: 15,),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the room 1 to 9';
                                } else if (int.parse(value) < 1 || int.parse(value) > 9) {
                                  return 'The room number between 1 and 9';
                                }
                                return null;
                              },
                              controller: floreController,
                              style: textFill,
                              keyboardType: TextInputType.phone,
                              decoration: inputDecoration(context),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                if(_formKey.currentState!.validate()){
                                  ClubRegistration().numberOfFlore(
                                      numberFlore: floreController.text,
                                    context: context
                                  ).then((value) => {
                                    Navigator.pushNamed(context, '/floorwise_page'),
                                  });
                                }
                                // if(floreController.text.isEmpty){
                                //   CommonToast(context: context, title: "Enter No of floor", alignCenter:false);
                                // }else{
                                //   ClubRegistration().numberOfFlore(
                                //       numberFlore: floreController.text
                                //   ).then((value) => {
                                //     Navigator.pushNamed(context, '/floorwise_page'),
                                //   });
                                // }
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
                          const SizedBox(height: 30)
                        ],
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

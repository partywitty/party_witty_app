

// ignore_for_file: camel_case_types
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';

class invitationScreen extends StatefulWidget {
  const invitationScreen({Key? key}) : super(key: key);

  @override
  State<invitationScreen> createState() => _invitationScreenState();
}

class _invitationScreenState extends State<invitationScreen> {
  final double _height = Get.height, _width = Get.width;
  String dropValue = 'What is Refer and Earn Program?';
  String workValue = 'How it works?';
  String whereValue = 'Where can I use these LoyaltyPoints?';
  var items = [
    'What is Refer and Earn Program?',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var items1 = [
    'How it works?',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var items2 = [
    'Where can I use these LoyaltyPoints?',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: drawerColor,
          body: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF2C019E),
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0),bottomLeft: Radius.circular(20.0))
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 50.0),
                    Text("Refer your friends and Earn",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 22,color: Colors.white),),
                    const SizedBox(height: 20.0),
                    Image.asset("assests/gift.png",fit: BoxFit.fill,height: _height*0.35,width: _width*0.70),
                    const Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration.",
                      style: textHint,textAlign: TextAlign.center),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DottedBorder(
                          radius: const Radius.circular(5.0),
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                          child: Row(
                            children: [
                              Column(
                                children: const [
                                  Text("Your Referral Code",style: textHint),
                                  Text("ADCZOP321",style: appTitle),
                                ],
                              ),
                              const SizedBox(width: 10.0,),
                              Container(
                                color: Colors.white,
                                width: 1,
                                height: 30,
                              ),
                              const SizedBox(width: 10.0,),
                              const Text("Copy\nCode",style: signUpTitle)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text("Share Your Referral Code via",
                      style: GoogleFonts.poppins(textStyle: textHint),),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assests/fb1.png",fit: BoxFit.fill,height: 20,color: Colors.white),
                              const SizedBox(width: 5.0),
                              const Text("Facebook",style: buttonText,)
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assests/whatsapp.png",fit: BoxFit.fill,height: 25),
                              const Text("Whatsapp",style: buttonText)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text("Frequently Asked Questions",style: GoogleFonts.poppins(textStyle: textLabel)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButton(
                  value: dropValue,
                  hint: const Text("What is Refer and Earn Program?"),
                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.white),
                  dropdownColor: drawerColor,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,style: textFill),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropValue = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButton(
                  value: workValue,
                  hint: const Text("How it works?"),
                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.white),
                  dropdownColor: drawerColor,
                  items: items1.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,style: textFill),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      workValue = newValue!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: DropdownButton(
                  value: whereValue,
                  hint: const Text("Where can I use these LoyaltyPoints?"),
                  icon: const Icon(Icons.keyboard_arrow_down,color: Colors.white),
                  dropdownColor: drawerColor,
                  items: items2.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,style: textFill),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      whereValue = newValue!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        )
    );
  }
}

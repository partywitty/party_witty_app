
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_app/Club/clubPayManagement.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../Controller/style.dart';
import '../Controller/utils.dart';

class clubPayScreen extends StatefulWidget {
  const clubPayScreen({Key? key}) : super(key: key);

  @override
  State<clubPayScreen> createState() => _clubPayScreenState();
}

class _clubPayScreenState extends State<clubPayScreen> {
  final double _height = Get.height, _width = Get.width;
  TextEditingController seatingController = TextEditingController();
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  TextEditingController dynamicController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Party Witty Pay",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: boxDecoration(),
                  child: Text('Instant discount', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Text('Free Add On', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            child: SizedBox(
              width: 150, height: 130, //height and width of guage
              child:SfRadialGauge(
                  enableLoadingAnimation: true, //show meter pointer movement while loading
                  animationDuration: 4500, //pointer movement speed
                  axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                    RadialAxis(
                        minimum: 0,maximum: 15,
                        ranges: <GaugeRange>[ //Guage Ranges
                          GaugeRange(startValue: 0,endValue: 5, color: const Color(0xFF7AFF77), startWidth: 10,endWidth: 10),
                          GaugeRange(startValue: 5,endValue: 10,color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
                          GaugeRange(startValue: 10,endValue: 15,color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
                        ],
                        pointers: const <GaugePointer>[
                          /// pointer dynamic value
                          NeedlePointer(value:8,
                            needleColor: Colors.white,
                            needleEndWidth: 5,
                            knobStyle: KnobStyle(color: Colors.deepOrange,borderColor: Colors.lightBlue,),
                          )
                        ],
                        annotations: const <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Text('',style: TextStyle(fontSize: 0,fontWeight:FontWeight.bold,color: Colors.white)),
                              angle: 90,
                              positionFactor: 0.5),
                          //add more annotations 'texts inside guage' here
                        ]
                    )]
              ),
            ),
          ),
          Row(
            children: [
              const Text("Sitting capacity",style: textLabel),
              const Spacer(),
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  controller: seatingController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: blackSubTitle,
                  decoration: whiteDecoration(context),
                )
              ),
            ],
          ),
          const Divider(color: Colors.white,height: 20.0),
          Row(
            children: [
              const Flexible(child: Text("Minimum Discount at best occupancy",style: textLabel)),
              const Spacer(),
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  controller: minController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: blackSubTitle,
                  decoration: whiteDecoration(context),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white,height: 20.0),
          Row(
            children: [
              const Flexible(child: Text("Maximum Discount at least occupancy",style: textLabel)),
              const Spacer(),
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  controller: maxController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: blackSubTitle,
                  decoration: whiteDecoration(context),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white,height: 20.0),
          Row(
            children: [
              const Flexible(child: Text("Dynamic Discount Change with occupancy",style: textLabel)),
              const Spacer(),
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  controller: dynamicController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: blackSubTitle,
                  decoration: whiteDecoration(context),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white,height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Text('Save', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ClubPayManagement()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Text('Edit', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../Controller/appBarArtist.dart';
import 'artistBooking.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({Key? key}) : super(key: key);

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  final double _height = Get.height, _width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Appbars().getArtistAppBar(context: context,title: ""),
      // appBar: AppBar(
      //   backgroundColor: appBarColor,
      //   leading: const Icon(Icons.menu,color: Colors.white,size: 24),
      //   actions: const [
      //     Icon(Icons.search,size: 24,color: Colors.white),
      //     SizedBox(width: 10.0),
      //     Icon(Icons.notifications_none_sharp,color: Colors.white,size: 24),
      //     SizedBox(width: 10.0),
      //   ],
      // ),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assests/calender.png",fit: BoxFit.fill,height: _height*0.05),
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height:  _height*0.07,
                    child: SizedBox(
                      width: 100, height: 100, //height and width of guage
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
                                annotations: <GaugeAnnotation>[
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
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: const Text("Prize : 4500",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: 30.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 5.0,
                percent: 0.5,
                center: Container(
                  decoration : BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.black,
                  ),
                  child: Text("50%",style: cardTitle,),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.white,
                progressColor: appColor,
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(Icons.remove_red_eye_outlined,color: appColor,size: 24,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: appColor),
                      color: cardColor
                    ),
                      child: const Text("1.5k",style: cardTitle,)),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.mic,color: appColor,size: 24,),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: appColor),
                          color: cardColor
                      ),
                      child: const Text("1.5k",style: cardTitle,)),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.person,color: appColor,size: 24,),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: appColor),
                          color: cardColor
                      ),
                      child: const Text("1.5k",style: cardTitle,)),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.favorite,color: appColor,size: 24,),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: appColor),
                          color: cardColor
                      ),
                      child: const Text("1.5k",style: cardTitle,)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 5.0),
            child: Row(
              children: const [
                Text("January",style: bigTitle,),
                Icon(Icons.keyboard_arrow_down,size: 24,color: Colors.white,)
              ],
            ),
          ),
          const SizedBox(height: 10.0,),
          Container(
            padding: const EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(left: 20.0),
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(2.0),
             ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: const Color(0xFFffcccc),
                    border: Border.all(color: appColor),
                  ),
                  child: Column(
                    children: const [
                      Text("Fri"),
                      Text("27"),
                    ],
                  ),
                ),
                Column(
                  children: const [
                    Text("Sat"),
                    Text("28"),
                  ],
                ),
                Column(
                  children: const [
                    Text("Sun"),
                    Text("29"),
                  ],
                ),
                Column(
                  children: const [
                    Text("Mon"),
                    Text("30"),
                  ],
                ),
                Column(
                  children: const [
                    Text("Tue"),
                    Text("31"),
                  ],
                ),
                Column(
                  children: const [
                    Text("Th"),
                    Text("1"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0,),
          const Padding(
            padding: EdgeInsets.only(left: 20,top: 5.0),
            child: Text("Today shows",style: bigTitle,),
          ),
          InkWell(
            onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => bookingProcess(),));
             },
            child: Container(
              height: _height*0.20,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
              ),
              child: const Text("Show details",style: cardTitle,),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20,top: 0.0),
            child: Text("Upcoming shows",style: bigTitle,),
          ),
          Container(
            height: _height*0.10,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
            ),
            child: const Text("28 jan",style: cardTitle,),
          ),
          Container(
            height: _height*0.10,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
            ),
            child: const Text("29 jan",style: cardTitle,),
          ),
          Container(
            height: _height*0.10,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
            ),
            child: const Text("30 jan",style: cardTitle,),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../Controller/style.dart';

class ArtistSplash extends StatefulWidget {
  const ArtistSplash({Key? key}) : super(key: key);

  @override
  State<ArtistSplash> createState() => _ArtistSplashState();
}

class _ArtistSplashState extends State<ArtistSplash> {
  final double _height = Get.height, _width = Get.width;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  PageController page = PageController(initialPage: 0);
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF17143D),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: page,
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              children: [
                Column(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocation(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: const Color(0xFF443BD4))
                              ),
                              child: const Text("Skip",style: bannerTitle)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Image.asset("assests/Aintro1.png",fit: BoxFit.fill,height: _height*0.40,width: _width*0.50),
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: SizedBox(
                        width: 180, height: 180, //height and width of guage
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45.0),
                      child: Text("Rate Enhancement",
                          style: GoogleFonts.poppins(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocation(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: const Color(0xFF443BD4))
                              ),
                              child: const Text("Skip",style: bannerTitle)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Image.asset("assests/Aintro2.png",fit: BoxFit.fill,height: _height*0.40,width: _width*0.70),
                    Image.asset("assests/Acalnder.png",fit: BoxFit.fill,height: _height*0.30,width: _width*0.70),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45.0),
                      child: Text("calendarization",
                          style: GoogleFonts.poppins(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => CurrentLocation(),));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: const Color(0xFF443BD4))
                              ),
                              child: const Text("Skip",style: bannerTitle)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Image.asset("assests/Cintro3.png",fit: BoxFit.fill,height: _height*0.40,width: _width*0.70),
                    Image.asset("assests/Scoin.png",fit: BoxFit.fill,height: _height*0.30,width: _width*0.70),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45.0),
                      child: Text("Payment Guarantee",
                          style: GoogleFonts.poppins(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w400)),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Center(
                  child: SmoothPageIndicator(
                      controller: page,  // PageController
                      count:  3,
                      effect:  const WormEffect(),  // your preferred effect
                      onDotClicked: (index){
                      }
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

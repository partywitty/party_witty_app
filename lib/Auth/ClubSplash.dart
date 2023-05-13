
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Controller/style.dart';

class ClubSplash extends StatefulWidget {
  const ClubSplash({Key? key}) : super(key: key);

  @override
  State<ClubSplash> createState() => _ClubSplashState();
}

class _ClubSplashState extends State<ClubSplash> {
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
                    const SizedBox(height: 50.0),
                    Image.asset("assests/Cintro1.png",fit: BoxFit.fill,height: _height*0.50,width: _width),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45.0),
                      child: Text("Benefit",
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
                    const SizedBox(height: 50.0),
                    Image.asset("assests/Cintro2.png",fit: BoxFit.fill,height: _height*0.60,width: _width),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45.0),
                      child: Text("Reach maximum customer",
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

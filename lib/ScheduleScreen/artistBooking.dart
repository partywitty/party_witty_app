
import 'package:flutter/material.dart';
import 'package:flutter_app/ScheduleScreen/showDetails.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class bookingProcess extends StatefulWidget {
  const bookingProcess({Key? key}) : super(key: key);

  @override
  State<bookingProcess> createState() => _bookingProcessState();
}

class _bookingProcessState extends State<bookingProcess> {
  final double _height = Get.height, _width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Artist booking",style: GoogleFonts.poppins(textStyle: appBarText),),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0,),
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
          Container(
            height: _height*0.20,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20.0),
                   child: Image.asset("assests/jack.png",fit: BoxFit.fill,height: _height*0.15),
                 ),
                 const Padding(
                   padding: EdgeInsets.only(right: 20.0),
                   child: Text("Show details",style: cardTitle),
                 ),
               ],
            ),
          ),
          const SizedBox(height: 10.0,),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const showDetails(),));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('reached the venue',style: GoogleFonts.poppins(textStyle: buttonText)
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
          const Padding(
            padding: EdgeInsets.only(left: 20,top: 0.0),
            child: Text("Upcoming shows",style: bigTitle,),
          ),
          Container(
            height: _height*0.15,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset("assests/jack.png",fit: BoxFit.fill,height: _height*0.10),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text("Show details",style: cardTitle),
                ),
              ],
            ),
          ),
          Container(
            height: _height*0.15,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset("assests/jack.png",fit: BoxFit.fill,height: _height*0.10),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text("Show details",style: cardTitle),
                ),
              ],
            ),
          ),
          Container(
            height: _height*0.15,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: cardColor,
                border: Border.all(color: appColor)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset("assests/jack.png",fit: BoxFit.fill,height: _height*0.10),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text("Show details",style: cardTitle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

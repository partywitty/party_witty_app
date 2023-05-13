
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/utils.dart';
import 'bookingArtist.dart';

class setupDetails extends StatefulWidget {
  const setupDetails({Key? key}) : super(key: key);

  @override
  State<setupDetails> createState() => _setupDetailsState();
}

class _setupDetailsState extends State<setupDetails> {
  final double _height = Get.height, _width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 20.0),
          Image.asset("assests/set.png",fit: BoxFit.fill),
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            decoration: BoxDecoration(
              color: drawerColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("4 Piece Band Setup by his friends",style: GoogleFonts.poppins(textStyle: cardTitle),),
                Text("A band of energetic music lovers charged up to please your ears and take your heart away with the roller coaster of mesmerizing bollywood hits!",style: GoogleFonts.poppins(textStyle: cardSubTitle),),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            decoration: BoxDecoration(
              color: appBarColor,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: appColor)
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total Amount INR 50000",style: GoogleFonts.poppins(textStyle: cardTitle),),
                Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(140),
                    1: FixedColumnWidth(20),
                  },
                  children: const [
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Package",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Mode",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Wedding",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Offline",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Packages",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Language",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Duration",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Hindi",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("120 min",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Members",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Tags",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("4",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Bollywood",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("City",style: cardSubTitle,textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("",  textAlign: TextAlign.start,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0,top: 5.0),
                          child: Text("Willing to Travel \nYes",style: cardSubTitle, textAlign: TextAlign.start,),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const bookingArtistFirst(),));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    decoration: boxDecorationSquare(),
                    child: const Text('Book Now', style: buttonText),
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: const [
                    Text("Remaining Amount  INR 50000",style: likes,textAlign: TextAlign.start,),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Container(
            decoration: BoxDecoration(
              color: drawerColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: ExpansionTile(
              title: const Text("Who can book this?",style: signUpTitle),
              trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
              children: [
                const SizedBox(height: 15.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                  decoration: BoxDecoration(
                    color: drawerColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("4 Piece Band Setup by his friends",style: GoogleFonts.poppins(textStyle: cardTitle),),
                          const Spacer(),
                          Image.asset("assests/share.png",fit: BoxFit.fill,height: 15,),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text("A band of energetic music lovers charged up to please your ears and take your heart away with the rollercoaster of mezmerizing bollywood hits!",style: cardTitle,),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                  decoration: BoxDecoration(
                    color: drawerColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Who can book this?",style: GoogleFonts.poppins(textStyle: cardTitle),),
                      const SizedBox(height: 10.0),
                      const Text("If you have a wedding in your family or you yourself are getting married and want to make the wedding day the best day for you and your family, then this package is for you. In short, book this package if you have a wedding in your family and are looking to make it exciting for the bride and the groom.Book this wedding package exclusively on Part Witty.",style: cardTitle,),
                      const SizedBox(height: 10.0),
                      Text("How to participate?",style: GoogleFonts.poppins(textStyle: cardTitle),),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: appBarColor,
                              border: Border.all(color: appColor),
                            ),
                            child: Image.asset('assests/part.png',fit: BoxFit.fill,height: 30),
                          ),
                          const SizedBox(width: 10.0,),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Click on Book Now",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                Text("Booking an entertainment package is simple and hassle free. Just click on the book now button on this package.",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: appBarColor,
                              border: Border.all(color: appColor),
                            ),
                            child: const Icon(Icons.groups,size: 30,color: appColor,),
                          ),
                          const SizedBox(width: 10.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Select date and reserve",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                Text("Booking an entertainment package is simple and hassle free. Just click on the book now button on this package.",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Text("What to bring",style: GoogleFonts.poppins(textStyle: cardTitle),),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Icon(Icons.check_circle,size: 24,color: Colors.white,),
                          SizedBox(width: 10.0,),
                          Flexible(child: Text("You need a proper stage and technical setup to host the artists.",style: cardSubTitle,))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Icon(Icons.check_circle,size: 24,color: Colors.white,),
                          SizedBox(width: 10.0,),
                          Flexible(child: Text("You need a great ambiance and people who can enjoy this entertaining package.",style: cardSubTitle,))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Icon(Icons.check_circle,size: 24,color: Colors.white,),
                          SizedBox(width: 10.0,),
                          Flexible(child: Text("In case of an outstation artist, you might have to arrange for their travel and stay.",style: cardSubTitle,))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Icon(Icons.check_circle,size: 24,color: Colors.white,),
                          SizedBox(width: 10.0,),
                          Flexible(child: Text("A decent hospitality for the artists you are hosting.",style: cardSubTitle,))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: const [
                          Icon(Icons.check_circle,size: 24,color: Colors.white,),
                          SizedBox(width: 10.0,),
                          Flexible(child: Text("Some great vibes that will enhance the magic of this amazing package.",style: cardSubTitle,))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Text("Party Witty Experiences",style: GoogleFonts.poppins(textStyle: cardTitle),),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: appBarColor,
                              border: Border.all(color: appColor),
                            ),
                            child: Image.asset('assests/thoug.png',fit: BoxFit.fill,height: 30),
                          ),
                          const SizedBox(width: 10.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Thoughtful Packages",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                Text("Booking an entertainment package is simple and hassle free. Just click on the book now button on this package.",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: appBarColor,
                              border: Border.all(color: appColor),
                            ),
                            child: const Icon(Icons.calendar_month_outlined,size: 30,color: appColor,),
                          ),
                          const SizedBox(width: 10.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Select date and reserve",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                Text("Booking an entertainment package is simple and hassle free. Just click on the book now button on this package.",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: appBarColor,
                              border: Border.all(color: appColor),
                            ),
                            child: const Icon(Icons.groups,size: 30,color: appColor,),
                          ),
                          const SizedBox(width: 10.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Select date and reserve",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                Text("Booking an entertainment package is simple and hassle free. Just click on the book now button on this package.",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Text("Meet Your host",style: GoogleFonts.poppins(textStyle: cardTitle),),
                      const SizedBox(height: 10.0),
                      ListTile(
                        leading: Container(
                          width: _width*0.15,
                          height: _height*0.15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: appColor),
                              color: appBarColor
                          ),
                          child: const Icon(Icons.person,color: Colors.white,size: 30),
                        ),
                        title: const Text("Malvika",style: appBarText,),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          ListTile(
            leading: Container(
              width: _width*0.15,
              height: _height*0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: appColor),
                color: appBarColor
              ),
              child: const Icon(Icons.person,color: Colors.white,size: 30),
            ),
            title: const Text("Malvika",style: appBarText,),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}

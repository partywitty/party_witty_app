import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Club/Club_Home.dart';

class Colifornia extends StatefulWidget {
  const Colifornia({Key? key}) : super(key: key);

  @override
  State<Colifornia> createState() => _ColiforniaState();
}
void scrollup(){
  scrollController.animateTo(scrollController.offset-200, duration: Duration(milliseconds: 500),
      curve: Curves.linear);
}
void scrolldown(){
  scrollController.animateTo(scrollController.offset+200, duration: Duration(milliseconds: 500),
      curve: Curves.linear);
}

ScrollController scrollController=ScrollController();
List<PhotoModel> photolist = [
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
];
int index = 0;
List<dynamic> cursorim = [
  "assests/monu.jpg",
  "assests/map.jpg",
  "assests/resta.jpg",
  "assests/mesho.jpg"
];

class _ColiforniaState extends State<Colifornia> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Container(
                    width: width,
                    height: 190,
                    color: Colors.white,
                    child: Image.asset(
                      'assests/music_party.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      left: width * 0.81,
                      top:40,
                      child: Container(
                        width: 40,
                        height: 15,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assests/live.png',
                          scale: 3.3,
                          height: 10,
                        ),
                      )),
                  Positioned(
                      top: 130,
                      child: Container(
                        color: Colors.black54,
                        width: width,
                        height: 90,
                        child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: Container(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Colifornia party:2022",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400,
                                              fontSize:12, color: Colors.white)
                                      ),
                                      Container(
                                        height: 15,
                                        child: Row(children: [
                                          Container(
                                            child: Image.asset(
                                              'assests/cd.png',
                                              color: Colors.white,
                                              scale: 3,
                                              height: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                              'Sufi,Foke',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:10, color: Colors.white)
                                          ),
                                        ]),
                                      ),
                                      SizedBox(width: 8,),
                                      Container(
                                        height: 18,
                                        child: Row(children: [
                                          Image.asset(
                                            'assests/map2.png',
                                            // scale: 4,
                                            height: 15,
                                            fit: BoxFit.cover,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                              'Britinea Club',
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:10, color: Colors.white)
                                          ),
                                        ]),
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25, bottom: 30),
                              child: Container(
                                width: 95,
                                height: 45,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Color(0xFF434445),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Column(
                                  children: [
                                    Text(
                                      'Male,Female occupency',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 6,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Image.asset(
                                      'assests/rangebutton.png',
                                      scale: 3.3,
                                      height: 18,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Image.asset(
                                          'assests/male_user_icon.png',
                                          scale: 4.5,
                                          // height:,
                                        ),
                                        Container(
                                          width: 3,
                                        ),
                                        Image.asset(
                                          'assests/female_icon 1.png',
                                          scale: 5,
                                          // height: 5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Container(
                    height: 35,
                    width: width,
                    color: Colors.black,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 33),
                              child: Container(
                                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:30,
                                      child: IconButton(onPressed: (){
                                        Navigator.pop(context);
                                      }, icon:   Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: 18,
                                      ),),
                                    ),
                                    Text(
                                        "Colifrnia party:2022",
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize:12, color: Colors.white)
                                    ),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: InkWell(
                              onTap: () {
                                attentionAdmin();
                              },
                              child: Image.asset(
                                'assests/forward.png',
                                fit: BoxFit.fill,
                                scale: 3.2,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "About Event",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize:15, color: Color(0xFFFD2F71),)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 7,top: 3,bottom: 3),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset(0.1, 0.1),
                              end: FractionalOffset(0.7, 0.1),
                              colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        child: Text(
                            'Buy Now',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize:10, color: Colors.white,)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 10, right: 19),
                child: Text(
                  "It is a long established fact that a reader will be di"
                      "stracted by the readable content of a page when looki at its layout. "
                      "The point of using Lorem Ipsum is that it has a more-or-less normal"
                      " distribution of letters, as opposed to using 'Content here, content here',"
                      " maki it look like readable English",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 1.01,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,

                      fontSize: 12, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: width,
                height: 0.3,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 15),
                child: Text(
                    "Artist Performing",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize:16, color: Colors.white,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap:(){ scrollup();},
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Container(
                      height: 130,
                      width: width * 0.78,
                      child: ListView.builder(
                          controller: scrollController,
                          addRepaintBoundaries: true,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          // physics: ScrollableScrollPhysics(),
                          itemCount: photolist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(top: 20,),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          photolist[index].isSelect =
                                          !photolist[index].isSelect;
                                        });
                                      },
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: photolist[index].isSelect
                                                    ? Colors.red
                                                    : Colors.transparent,
                                                width: 0.8),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(
                                            photolist[index].image,
                                            // height: 50,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                        'Nami',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:16, color: Colors.white,)
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    // SizedBox(
                    //   width: 3,
                    // ),
                    InkWell(
                      onTap: (){
                        scrolldown();
                      },

                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: width,
                height: 0.3,
                color: Colors.grey,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 15),
                child: Text(
                  "Inclusive Tickets",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize:16, color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 6, right: 19),
                child: Text(
                  "It is a long established fact that a reader will be di"
                      "stracted by the readable content of a page when looki at its layout. "
                      "The point of using Lorem Ipsum is that it has a more-or-less normal"
                      " distribution of letters, as opposed to using 'Content here, content here',"
                      " maki it look like readable English",
                  textAlign: TextAlign.justify,
                  // textScaleFactor: 1.01,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,

                      fontSize: 12, color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 15),
                child: Text(
                  "Offer & combo",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize:16, color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 40.0, right: 40),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                      color: Color(0xFF434445),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Colifornia party:2022",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize:12, color: Colors.white,)
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 7, top: 3, bottom: 3),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: FractionalOffset(0.1, 0.1),
                                        end: FractionalOffset(0.7, 0.1),
                                        colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                                      ),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Text(
                                    '25%',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Valid For:",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 8, color: Colors.white70),

                                    ),
                                    Text(
                                      " 4 People ",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8, color: Colors.white),

                                    ),
                                    Text(
                                      " Valid on:",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 8, color: Colors.white70),

                                    ),
                                    Text(
                                      " Sat,Sun",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8, color: Colors.white),

                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 6.5,
                                          right: 3,
                                        ),
                                        child: Container(
                                          width: 40,
                                          height: 0.5,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        '  ₹5000/-',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 8, color: Colors.white70),
                                      ),
                                    ],
                                  ), Text(
                                    '  ₹ ',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white),
                                  ),
                                  Text(
                                    '3500/-',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 8, color: Colors.white70),
                                  ),
                                ],
                              )
                            ],
                          ),

                          SizedBox(height: 3,),
                          Row(
                            children: [
                              Text(
                                "Timings:",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 8,
                                ),
                              ),
                              Text(
                                '12PM-4PM,',
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 8,
                                ),
                              ),
                              Text(
                                "7PM-11PM",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 8,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 20,
                                  child:
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assests/map2.png',
                                        // scale: 4,
                                        color: Colors.white54,
                                        height: 14,
                                        fit: BoxFit.cover,
                                      ),

                                      SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                          'Colifornia Club',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize:10, color: Colors.white70,)
                                      ),  ],
                                  ),),
                                SizedBox(
                                  width: 6,
                                ), Padding(
                                  padding: const EdgeInsets.only(right: 6.0),
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10, right: 7,top: 1,bottom: 1),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: FractionalOffset(0.1, 0.1),
                                          end: FractionalOffset(0.7, 0.1),
                                          colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                                        ),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Text(
                                        'Add  +',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize:10, color: Colors.white,)
                                    ),
                                  ),
                                )
                              ]),

                        ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Positioned.fill(
            bottom: 15,
            child: Align(
              alignment: Alignment.bottomCenter, child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/create_event');
              },
                child: Container(
                height: 45,
            width: 140,
            decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.1, 0.1),
                    end: FractionalOffset(0.7, 0.1),
                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                  ),
                  borderRadius: BorderRadius.circular(30)),
            child: Center(
                child: Text(
                    'Buy Now',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize:14, color: Colors.white,)
                ),
            ),
          ),
              ),))
        ],
      ),
    );
  }

  Widget buidcard() {
    return Container(
        width: 100,
        height: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            photolist[index].image,
            // height: 50,
            fit: BoxFit.fill,
          ),
        ));
  }
  attentionAdmin() {
    return showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                insetPadding:
                EdgeInsets.only(top: 100, left: 30, right: 32,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 480,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    color: Color(0xFF434445),
                  ),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Text(
                          'Select Date & Time',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 19.0, top: 15,),
                        child: Container(
                          height: 80,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Booking',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1),
                                      child: Container(
                                        width: 120,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF666667),
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                        child: Center(
                                          child: Text(
                                            '30',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Date",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1.0),
                                      child: Container(
                                        width: 120,
                                        height: 35,
                                        child: Center(
                                          child: Text(
                                            '30/11/2022',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF666667),
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                      ),
                                    )
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 19.0, top: 13, ),
                        child: Container(
                          height: 80,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Start Time',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1),
                                      child: Container(
                                        width: 118,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF666667),
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                        child: Center(
                                          child: Text(
                                            '05:30',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'End Time',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1.0),
                                      child: Container(
                                        width: 120,
                                        height: 35,
                                        child: Center(
                                          child: Text(
                                            '11:30',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF666667),
                                            borderRadius:
                                            BorderRadius.circular(30)),
                                      ),
                                    )
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 20),
                        child: Text(
                          'About Event',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10,right: 20, left: 20),
                        child: Container(
                          child: Stack(
                            children: [
                              TextFormField(
                                  maxLines: 3,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFFbdc6cf)),
                                  decoration: InputDecoration(
                                    hintText: 'Write a message...',
                                    hintStyle: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.white54),
                                    fillColor: Color(0xFF666667),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 25.0, bottom: 12.0, top: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(    color: Color(0xFF666667),),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(    color: Color(0xFF666667),),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 220),
                                child: Container(
                                  child: IconButton(
                                    icon: Image.asset(
                                      'assests/editv.png',
                                      // color: Colors.white,
                                      height: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Container(
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(context, '/solo');
                              },
                              child: Container(
                                width: 140,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: FractionalOffset(0.1, 0.1),
                                    end: FractionalOffset(0.7, 0.1),
                                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Center(
                                  child: Text(
                                      'Send Request',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize:14, color: Colors.white)
                                  ),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}


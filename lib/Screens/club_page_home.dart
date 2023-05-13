import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class Club_page_home extends StatefulWidget {
  const Club_page_home({Key? key}) : super(key: key);

  @override
  State<Club_page_home> createState() => Club_page_homeState();
}

class Club_page_homeState extends State<Club_page_home> {
  // final List<Widget> tablist = [Artist_home_page(), Myhome()];
  int index = 0;
  bool isSelect = false;
  List<Photo> list = [
    Photo(
      title: 'David Barg',
      image: 'assests/jack.png',
      isSelect: false,
      color: Colors.green,
      text: 'Accepted',
    ),
    Photo(
      title: 'David Barg',
      image: 'assests/jack.png',
      isSelect: false,
      color: Colors.grey.shade500,
      text: 'Expired',
    ),
    Photo(
      title: 'Shawli teen',
      image: 'assests/shawli.png',
      isSelect: false,
      color: Colors.red,
      text: 'Denied',
    ),
    Photo(
      title: 'Shawli teen',
      image: 'assests/shawli.png',
      isSelect: false,
      color: Colors.white,
      text: 'wait for response',
    ),
  ];
  List<PhotoModel> photolist = [
    PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF18191a),
      body: Stack(
        children: [
          ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 34, right: 30),
                  child: Text("Event",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.white)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 33, right: 20),
                  child: Container(
                    child: Text("Upcoming Event",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white)),
                  ),
                ),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          right: 30,
                          left: 40,
                        ),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: photolist.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //       const Colifornia()),
                                    // );
                                  },
                                  child: Container(
                                      height: 91,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF434445),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Center(
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.asset(
                                                        photolist[index].image,
                                                        fit: BoxFit.fill,
                                                        height: 80,
                                                        width: 80,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Container(
                                                        width: 26,
                                                        height: 28,
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFF676767),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 2.0),
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "30",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        8),
                                                              ),
                                                              Text(
                                                                "feb",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        8),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 1,
                                                    left: 10,
                                                    bottom: 0),
                                                child: Container(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Colifornia party:2022",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Container(
                                                          height: 20,
                                                          child: Row(children: [
                                                            Container(
                                                              width: 20,
                                                              height: 18,
                                                              child:
                                                                  Image.asset(
                                                                'assests/clock.png',
                                                                scale: 3.2,
                                                                height: 10,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 6,
                                                            ),
                                                            Text(
                                                              '05:25 PM',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10),
                                                            ),
                                                          ]),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 18.0),
                                                          child: Container(
                                                            height: 20,
                                                            child:
                                                                Row(children: [
                                                              Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(1),
                                                                // width: 10,
                                                                // height: 22,
                                                                child:
                                                                    Image.asset(
                                                                  'assests/map2.png',
                                                                  scale: 2.5,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 6,
                                                              ),
                                                              Text(
                                                                'Colifornia,CA',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white70,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ]),
                                                          ),
                                                        ),
                                                      ]),
                                                )),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            }))),
              ],
            ),
            verticalslider(),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 30,
                    ),
                    child: Container(
                      width: 300,
                      child: ListView.builder(
                          // scrollDirection: Axis.horizonta,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Container(
                                  // height: 110,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF747576),
                                      border: Border.all(
                                          color: Colors.red, width: 0.9),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15.0,top:15
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          foregroundImage: AssetImage(
                                            list[index].image,
                                            // fit: BoxFit.fill,
                                          ),
                                          // maxRadius: 28,
                                          backgroundColor: Colors.blueGrey,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 5.0),
                                          child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                    left: 8.0,
                                                  ),
                                                  child: Container(
                                                    child: Text(list[index].title,
                                                        // fit: BoxFit.fill,
                                                        style: GoogleFonts.poppins(
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 16,
                                                                color: Colors.white)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text("Gender: Male",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 8,
                                                          color: Colors.white)),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                      "Music Type: Sufi,Foke",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 8,
                                                          color: Colors.white)),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                      "With Intrument: Instru1,Instru2",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 8,
                                                          color: Colors.white)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                      "Types of Band : Solo,Duo,Trio",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 8,
                                                          color: Colors.white)),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 10.0),
                                                  child: Text(
                                                      "Date 30/12/2022, 5:30 PM-11:39 PM",
                                                      style: GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 8,
                                                          color: Colors.white)),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 200,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 40,
                                                          height: 20,
                                                        ),
                                                        Container(
                                                          height: 21,
                                                          decoration: BoxDecoration(
                                                              color: list[index]
                                                                  .color,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4)),
                                                          child: InkWell(
                                                            // onTap: () {
                                                            // Navigator.push(
                                                            //   context,
                                                            //   MaterialPageRoute(
                                                            //       builder: (context) =>
                                                            //       const Booking_request()),
                                                            // );
                                                            // },
                                                            child: Center(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 7.0,
                                                                        right: 6),
                                                                child: Text(
                                                                  list[index]
                                                                      .text,
                                                                  style: (TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          8)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    ))),
          ]),
          // tablist.elementAt(index),
        ],
      ),
    );
  }

  Widget verticalslider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 15, top: 10),
          child: Text(
            'Past Event',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, top: 10),
          child: Center(
              child: SizedBox(
// width: 250,
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                // physics: ScrollableScrollPhysics(),
                itemCount: photolist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                        width: 200,
                        height: 190,
                        decoration: BoxDecoration(
                            color: Color(0xFF434445),
                            borderRadius: BorderRadius.circular(9)),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  height: 130,
                                  width: 190,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      photolist[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 9,
                                  ),
                                  child: Container(
                                    // width:,
                                    height: 55,
                                    child: Row(
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Feb 30,2022 ',
                                                      style: TextStyle(
                                                          color: Colors.white30,
                                                          fontSize: 10),
                                                    ),
                                                    //
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5.0,
                                                              right: 4,
                                                              left: 3),
                                                      child: Container(
                                                        width: 2,
                                                        height: 2,
                                                        // decoration: ,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    // SizedBox(
                                                    //   width: 4,
                                                    // ),
                                                    Text(
                                                      '05:25 PM',
                                                      style: TextStyle(
                                                          color: Colors.white30,
                                                          fontSize: 10),
                                                    ),
                                                  ]),
                                              Divider(
                                                height: 3,
                                              ),
                                              Text(
                                                "Colifornia party:2022",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                              Divider(
                                                height: 3,
                                              ),
                                              Container(
                                                height: 20,
                                                child: Row(children: [
                                                  Image.asset(
                                                    'assests/map2.png',
                                                    scale: 4,
                                                    color: Colors.white30,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Colifornia,CA',
                                                    style: TextStyle(
                                                        color: Colors.white30,
                                                        fontSize: 10),
                                                  ),
                                                ]),
                                              ),
                                            ]),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 32, left: 6),
                                          child: Container(
                                            padding: EdgeInsets.all(3),
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF666667),
                                                borderRadius:
                                                    BorderRadius.circular(3)),
                                            child: InkWell(
                                              onTap: () {
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //       builder: (context) =>
                                                //       const Artist_request()),
                                                // );
                                              },
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: Text(
                                                    '₹5000/-',
                                                    style: (TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 9)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )),
                  );
                }),
          )),
        ),
      ],
    );
  }
}

class PhotoModel {
  String image;
  String title;
  bool isSelect;

  PhotoModel({
    required this.title,
    required this.image,
    required this.isSelect,
  });
}

class Photo {
  String text;
  Color color;
  String image;
  String title;
  bool isSelect;

  Photo({
    required this.text,
    required this.color,
    required this.title,
    required this.image,
    required this.isSelect,
  });
}

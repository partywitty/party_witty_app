// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ArtistRagistration/Upload_Bands.dart';

class About_page extends StatefulWidget {
  const About_page({Key? key}) : super(key: key);

  @override
  State<About_page> createState() => _About_pageState();
}


class _About_pageState extends State<About_page>
    with SingleTickerProviderStateMixin {


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  List<PhotoModel> photolist = [
    PhotoModel(
        title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(
        title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(
        title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(
        title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(
        title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(
        title: 'createen', image: 'assests/dance.png', isSelect: false),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
          shrinkWrap: true,
          children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 220.0),
              child: Container(
                width: width,
                color: Colors.black54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, top: 35),
                      child: Text(
                        "About",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14, color: const Color(0xFFFD2F71)),

                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30.0, top: 3, right: 22),
                      child: Text(
                        'It is a long established fact that a reader will be distra cted by the '
                            'readable content of a page when looking at its layout. The point of using'
                            ' Lorem Ipsum is that it has a more-or-less normal distribution',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                            fontSize: 12, color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                      height: 0.8,
                      width: width,
                    color: Colors.grey,),
                    const SizedBox(height: 15,),
                    SizedBox(
                      height: 30,
                      child: Align(
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          controller: _tabController,
                          labelColor: const Color(0xFFFD2F71),
                          isScrollable: false,
                          labelPadding: const EdgeInsets.only(bottom: 0,right:3),
                          padding: const EdgeInsets.only(left: 18,right: 10,bottom: 2),
automaticIndicatorColorAdjustment: false,

                          indicatorColor: const Color(0xFFFD2F71),
                          indicatorWeight: 1,

                          labelStyle: GoogleFonts.poppins(color: Colors.white,),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(text:'Event'),
                            Tab(text:'Offer'),
                            Tab(text:'About'),
                            Tab(text: 'Photos  '),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:14.0),
                      child: SizedBox(
                        height:300,
                        width: double.maxFinite,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            BuildEvent(),
                            Build_offer(),
                            Build_about(),
                            build_photo()

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 222,
              width: width,
              color: Colors.blueGrey,
              child: Image.asset(
                'assests/club.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 178.0, left: 34),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(70)),


                        child: Image.asset('assests/create.png'),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10.0, bottom: 20),
                        child: Text(
                          'Canteen',
                          style: GoogleFonts.poppins(
                              fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Container(
                      height: 15,
                      width: 82,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      // color: Colors.white70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 15,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Color(0xFFfd2630),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            padding: const EdgeInsets.only(left: 7),
                            child: Text(
                              'Open',
                              style: GoogleFonts.poppins(
                                  fontSize: 9, color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 40,
                            padding: const EdgeInsets.only(left:2,),
                            decoration: const BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            child: Text(
                              'Closed',
                              style: GoogleFonts.poppins(
                                  fontSize: 9, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
  Widget BuildEvent(){
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              right: 30,
              left: 40,
            ),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: photolist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                        height: 91,
                        decoration: BoxDecoration(
                            color: const Color(0xFF434445),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              Center(
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
                                            color:
                                            const Color(0xFF676767),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 2.0),
                                          child: Column(
                                            children: const [
                                              Text(
                                                "30",
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 8),
                                              ),
                                              Text(
                                                "feb",
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 8),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1, left: 10, bottom: 0),
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        const Text(
                                          "Colifornia party:2022",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight:
                                              FontWeight
                                                  .bold),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        SizedBox(
                                          height: 20,
                                          child: Row(children: [
                                            Image.asset(
                                              'assests/clock.png',
                                              scale: 3.1,
                                              height: 14,
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            const Text(
                                              '05:25 PM',
                                              style: TextStyle(
                                                  color: Colors
                                                      .white,
                                                  fontSize: 10),
                                            ),
                                          ]),
                                        ),
                                        SizedBox(
                                          height: 20,
                                          child: Row(children: [
                                            Image.asset(
                                                'assests/cd.png',
                                                color: Colors
                                                    .white70,
                                                scale: 3,
                                                height: 14
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            const Text(
                                              'Sufi,Foke',
                                              style: TextStyle(
                                                  color: Colors
                                                      .white,
                                                  fontSize: 10),
                                            ),
                                          ]),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                          child: Row(children: [
                                            Container(
                                              padding:
                                              const EdgeInsets.all(1),
                                              child: Image.asset(
                                                'assests/map2.png',
                                                scale: 4,
                                                color: Colors.white,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            const Text(
                                              'Colifornia,CA',
                                              style: TextStyle(
                                                  color: Colors
                                                      .white,
                                                  fontSize: 10),
                                            ),
                                          ]),
                                        ),
                                      ])),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 55, left: 10),
                                child: InkWell(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //       const Artist_request()),
                                    // );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF666667),
                                        borderRadius:
                                        BorderRadius.circular(
                                            3)),
                                    child: const Text(
                                      '₹5000/-',
                                      style: (TextStyle(
                                          color: Colors.white,
                                          fontSize: 9)),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                })));
  }
  Widget Build_offer(){
    return   ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        // physics: AlwaysScrollableScrollPhysics(),
        // physics: ScrollableScrollPhysics(),

        itemCount: 4,
        itemBuilder: (context, index) {
          return      Padding(
            padding: const EdgeInsets.only( left: 40.0, right: 40,bottom: 15),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                  color: const Color(0xFF434445),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 8),
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
                            padding: const EdgeInsets.only(right: 6.0),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 6, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: FractionalOffset(0.1, 0.1),
                                    end: FractionalOffset(0.7, 0.1),
                                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                                  ),
                                  borderRadius: BorderRadius.circular(3)),
                              child: const Text(
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
                      // SizedBox(
                      //   height: 3,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          const SizedBox(
                            height: 3,
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
                                      color: Colors.white30,
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
                                '  ₹',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 9, color: Colors.white),
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
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: const [
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
                      const SizedBox(
                        height: 3,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
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

                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                      'Colifornia Club',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                        fontSize:10, color: Colors.white70,)
                                  ),  ],
                              ),),
                            const SizedBox(
                              width: 6,
                            ), Padding(
                              padding: const EdgeInsets.only(right: 6.0),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 7,top: 1,bottom: 1),
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
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
          );});
  }
  Widget Build_about(){
    return
      SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.only(left: 30,right: 14,top: 10),
          child: Column(
            children: [
              Text("It is a long established fact that a reader will be distra"
                  "cted by the readable content of a page when looking at its layout.The"
                  "point of using Lorem Ipsum is that it has a more-or-less normal distribution",
                  textAlign: TextAlign.justify,
                  // textScaleFactor: 1.02,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12, color: Colors.white,)),
              const SizedBox(height: 2,),
              Text("It is a long established fact that a reader will be distra cted by"
                  "the readable content of a page when looking at its layout. The point of using Lorem"
                  "Ipsum is that it has a more-or-less normal distribution",
                  textAlign: TextAlign.justify,
                  // textScaleFactor: 1.02,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12, color: Colors.white,)),
            ],
          ),
        ),
      );
  }
  Widget build_photo(){
    return   Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 40,right: 28),
      child: SizedBox(
        width: double.infinity,
          // height: 400,
          child: StaggeredGrid.count(
            axisDirection: AxisDirection.down,
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children:  [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset('assests/dance.png',fit: BoxFit.fill,)),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child:Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Image.asset('assests/dance.png',fit: BoxFit.fill,),
              ),
            ],
          )


      ),
    );
  }


}

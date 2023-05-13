import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../ArtistRagistration/Upload_Bands.dart';

class Send_request extends StatefulWidget {
  const Send_request({Key? key}) : super(key: key);

  @override
  State<Send_request> createState() => _Send_requestState();
}

class _Send_requestState extends State<Send_request>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
bool  select=false;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
List follow=[];
  List<PhotoModel> photolist = [
    PhotoModel(title: 'createen', image: 'assests/party_img.png', isSelect: false),
    PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
    PhotoModel(title: 'createen', image: 'assests/dance.png', isSelect: false),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
          shrinkWrap: false, children: [
        Container(
          height: 30,
          width: width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: InkWell(
                      // onTap: () {
                      //   attentionAdmin();
                      // },
                      child: Image.asset(
                        'assests/forward.png',
                        fit: BoxFit.fill,
                        scale: 3.2,
                      ),
                    ),
                  ),
                ]),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 235.0),
              child: Container(
                width: width,
                color: Colors.black54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Adwerd Shwn",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,)
                      ),
                    ),
                    Center(
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(Ionicons.heart_sharp,color: Color(0xFFFE262F),size: 18),
                          Text(
                            " 1523 Favourites",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, '/wallet_page');
                          },
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade700 ,width: 0.4),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                "Send Request",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            // setState(() {
                            //   select=!select;
                            // });
                          },
                          child: Container(
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset(0.1, 0.1),
                                  end: FractionalOffset(0.7, 0.1),
                                  colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                                ),
                                border: Border.all(color: Colors.grey.shade700 ,width: 0.4),
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // select?Container(): Icon(Ionicons.heart_outline,color: Colors.white,size: 18,),
                                  // SizedBox(width: 2,),
                                  Text("Follow",
                                    // select?"Follow":'Favourites',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 28,
                      child: Align(
                        child: TabBar(
                          unselectedLabelColor: Colors.white,
                          controller: _tabController,
                          labelColor: Color(0xFFFD2F71),
                          isScrollable: false,
                          labelPadding: EdgeInsets.only(bottom: 0, right: 3),
                          padding:
                              EdgeInsets.only(left: 18, right: 10, bottom: 2),
                          automaticIndicatorColorAdjustment: false,
                          indicatorPadding: EdgeInsets.only(bottom: 0, top: -4),
                          indicatorColor: Color(0xFFFD2F71),
                          indicatorWeight: 1,
                          labelStyle: GoogleFonts.poppins(
                            color: Colors.white,
                          ),
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(text: 'Events'),
                            Tab(text: 'Clubs'),
                            Tab(text: 'About'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:12.0),
                      child: Container(
                        height: 320,
                        width: double.maxFinite,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            BuildEvent(),
                            Build_clubs(),
                            Build_about(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 210,
              width: width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.white])),
              child: Image.asset(
                'assests/tribute.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Container(width: width,
                height: 70,decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87])
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 210),
              child: Container(width: width,
                height: 40,decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white12,Colors.transparent, ])
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: Container(width: width,
                height: 80,decoration: BoxDecoration(
                  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.grey.shade700])
                ),),
            ),
              Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(width: width,
                height: 40,decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.grey.shade700,Colors.transparent, ])
                ),),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 140.0,
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.black,
                  // foregroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 42,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    foregroundImage: AssetImage('assests/create.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
  Widget BuildEvent() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.only(
              bottom: 15.0,
              right: 30,
              left: 40,
            ),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics:AlwaysScrollableScrollPhysics(),
                itemCount: photolist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                        height: 91,
                        decoration: BoxDecoration(
                            color: Color(0xFF434445),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Row(
                            children: [
                              Container(
                                child: Center(
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          photolist[index].image,
                                          fit: BoxFit.fill,
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          width: 26,
                                          height: 28,
                                          decoration: BoxDecoration(
                                              color: Color(0xFF676767),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(top:3.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "30",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 8),
                                                ),
                                                Text(
                                                  "feb",
                                                  style: TextStyle(
                                                      color: Colors.white,
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
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1, left: 10, bottom: 0),
                                  child: Container(
                                    child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Colifornia party:2022",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
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
                                                child: Image.asset(
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
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ]),
                                          ),
                                          Container(
                                            height: 20,
                                            child: Row(children: [
                                              Container(
                                                width: 20,
                                                height: 18,
                                                child: Image.asset(
                                                  'assests/cd.png',
                                                  color: Colors.white70,
                                                  scale: 3.3,
                                                  height: 10,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                'Sufi,Foke',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ]),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 20,
                                            child: Row(children: [
                                              Container(
                                                padding: EdgeInsets.all(1),
                                                child: Image.asset(
                                                  'assests/map2.png',
                                                  scale: 3,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Text(
                                                'Colifornia,CA',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ]),
                                          ),
                                        ]),
                                  )),
                            ],
                          ),
                        )),
                  );
                })));
  }
  Widget Build_clubs(){
    return    Padding(
      padding: const EdgeInsets.only(bottom:20,left: 25.0, right: 15),
      child: Container(
          width: double.infinity,
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: photolist.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 20.0),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          photolist[index].isSelect =
                          !photolist[index].isSelect;

                          // tapped_index=true;
                          //   if (tapped_index == true) {
                          //     tapped_index = false;
                          //   } else
                          //     tapped_index = true;
                        });
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: photolist[index].isSelect
                                    ? Colors.red
                                    : Colors.black,
                                width: 2),
                            // tapped_index ? Colors.red : Colors.black,width: 2),

                            borderRadius:
                            BorderRadius.circular(12)),
                        child: ClipRRect(
                            clipBehavior:
                            Clip.antiAliasWithSaveLayer,
                            borderRadius:
                            BorderRadius.circular(10.0),
                            child: Stack(
                              children: [
                                new Image.asset(
                                  photolist[index].image,
                                  fit: BoxFit.cover,
                                ),
                                // Center(
                                //     child: Container(
                                //         height: 22,
                                //         width: 22,
                                //         decoration: BoxDecoration(
                                //           // border: Border.all(color: Colors.transparent,width:0),
                                //             color: Colors.grey,
                                //             borderRadius:
                                //             BorderRadius
                                //                 .circular(
                                //                 70)),
                                //         child: Positioned(
                                //           child: Icon(
                                //             Ionicons
                                //                 .play,
                                //             size: 10,
                                //             color: Colors.white,
                                //           ),
                                //         ))),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                        photolist[index].title,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize:14, color: Colors.white)
                    ),
                  ],
                );
              })),
    );
  }
 Widget Build_about() {
    return Container(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 14, bottom: 10),
        child: Column(
          children: [
            Container(
              child: Text(
                  "It is a long established fact that a reader will be distra"
                  "cted by the readable content of a page when looking at its layout.The"
                  "point of using Lorem Ipsum is that it has a more-or-less normal distribution",
                  textAlign: TextAlign.justify,
                  // textScaleFactor: 1.02,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              child: Text(
                  "It is a long established fact that a reader will be distra cted by"
                  "the readable content of a page when looking at its layout. The point of using Lorem"
                  "Ipsum is that it has a more-or-less normal distribution",
                  textAlign: TextAlign.justify,
                  // textScaleFactor: 1.02,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }


}

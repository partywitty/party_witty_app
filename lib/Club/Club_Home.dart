
// ignore_for_file: camel_case_types
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Club/allArtistScreen.dart';
import 'package:flutter_app/Club/clubArtistProfile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/AllArtistApi.dart';
import '../ApiServices/api_link.dart';
import '../ClubRagistration/clubDrawer.dart';
import '../Controller/appBarArtist.dart';
import '../Controller/style.dart';

class ClubHomePage extends StatefulWidget {
  const ClubHomePage({Key? key}) : super(key: key);

  @override
  State<ClubHomePage> createState() => _ClubHomePageState();
}

class _ClubHomePageState extends State<ClubHomePage> {
  @override
  int currentPos = 0;
  double? ratingValue;
  List<String> listPaths = [
    "assests/home1.png",
    "assests/home1.png",
    "assests/home1.png",
    "assests/home1.png",
    "assests/home1.png",
  ];
  final double _height = Get.height, _width = Get.width;

  final _getFollowUpCont = Get.put(GetAllArtistApi1());

  @override
  void initState() {
    _getFollowUpCont.getArtistUpApi().then((value) {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF18191a),
      drawer: ClubDrawer().getDrawer(context),
      appBar: Appbars().getArtistAppBar(context: context,title: ""),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Stack(
            children: [
              SizedBox(
                  height: height/2.5,
                  child: Stack(
                    children: [
                      Image.asset("assests/home1.png",height: height/3,width: width,fit: BoxFit.fill)
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("My Deals",style: cardSubTitle,),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Text("Artist Booking",style: cardSubTitle),
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 18,)
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Text("My Pick",style: cardSubTitle),
                          Icon(Icons.arrow_drop_down,color: Colors.white,size: 18,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Text("MUSIC GIGS",style: GoogleFonts.robotoMono(textStyle: mono),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                           border: Border.all(color: Colors.white,width: 1),
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white70
                        ),
                        child: const Icon(Icons.add,color: Colors.white,size: 24),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70
                        ),
                        child: const Icon(Icons.thumb_up_alt_outlined,color: Colors.white,size: 24),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 2),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white70
                        ),
                        child: const Icon(Icons.play_arrow,color: appColor,size: 40),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70
                        ),
                        child: const Icon(Icons.share,color: Colors.white,size: 24),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white,width: 1),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white70
                        ),
                        child: const Icon(Icons.info_outline,color: Colors.white,size: 24),
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          chooseArtist(),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Padding(
                padding: EdgeInsets.only(left: 10.0,top :0.0),
                child: Text('Our Artist', style: bigTitle),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const allArtistScreen(),));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 0.0,top: 0,right: 10.0),
                  child: Text('View all',style:rowButton),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: height/2,
            child: mainWidget(),
          ),
          const SizedBox(height: 20.0,),
          Container(
            color: Colors.black,
            height: height/3.0,
            child: Stack(
              children: [
                Image.asset("assests/singer1.png",fit: BoxFit.fill,width: width,height: height/4),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: appColor.withOpacity(0.7),
                  ),
                  height: height/4,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          bottom: 20,
                          right: 0,
                          child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Genres",style: GoogleFonts.robotoSlab(textStyle:  cardTitle)),
                                      Text("Musical",style: GoogleFonts.robotoSlab(textStyle:  extraBold)),
                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                  Image.asset("assests/pink2.png",fit: BoxFit.fill,height: 90,width: 150,),
                                ],
                              ),
                          )
                          // child: Center(child: Text("Genres",style: GoogleFonts.robotoSlab(textStyle:  extraBold)))
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    height: 120,
                    width: width,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer2.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("Sufi \nSitdown",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center)))
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer3.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("BollyWood",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center,)))
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer1.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("Western\nMusic",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center,)))
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer2.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Text("Rock\nNight",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center,)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10.0,top :0.0),
                child: Text('Favorites MAGNETS', style: bigTitle),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0,top: 0,right: 10.0),
                child: Text('View all',style:rowButton),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            color: Colors.black,
            height: height/3.3,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                    child: Image.asset("assests/purle.png",fit: BoxFit.fill,width: width,height: height/4),),
                Positioned(
                  top: 0,
                  child: SizedBox(
                    height: 120,
                    width: width,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer2.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                        Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                                      ],
                                    )
                                )
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer3.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                        Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                                      ],
                                    )
                                )
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer1.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                        Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                                      ],
                                    )
                                )
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset("assests/singer2.png",height: 120,width: 100,fit: BoxFit.fill,),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                top: 0,
                                right: 0,
                                child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                        Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                                      ],
                                    )
                                )
                            ),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                        top: 80,
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Trending",style: GoogleFonts.robotoSlab(textStyle:  cardTitle)),
                                Text("Lately",style: GoogleFonts.robotoSlab(textStyle:  extraBold)),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Text("It is a long established fact that a \nreader will be distracted by the\n  readable content",style: GoogleFonts.robotoSlab(textStyle:  cardTitle)),
                          ],
                        )
                      // child: Center(child: Text("Genres",style: GoogleFonts.robotoSlab(textStyle:  extraBold)))
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,top :0.0),
            child: Text('Highlighly Recommend Artist', style: GoogleFonts.poppins(textStyle: bigTitle)),
          ),
          const SizedBox(height: 10.0),
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                enlargeFactor: 0.35,
                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                autoPlayCurve: Curves.fastOutSlowIn,
                // enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction:0.80,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPos = index;});
                }),
            items:listPaths. map((item) =>
                Padding(
                  padding: const EdgeInsets.only(left:10,top:8.0),
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           SizedBox(
                             width: width/2.2,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Treavi",style: GoogleFonts.robotoSlab(textStyle : cardTitle),),
                                 Text("Barieo",style: GoogleFonts.robotoSlab(textStyle : extraBold),),
                                 Text("It is a long established fact that a reader will be distracted.",
                                   style: GoogleFonts.robotoSlab(textStyle : cardSubTitle),),
                               ],
                             ),
                           ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: const [
                               CircleAvatar(
                                 radius: 35,
                                 foregroundImage: AssetImage(
                                   'assests/shawli.png',
                                 ),
                                 // maxRadius: 28,
                                 backgroundColor:
                                 Colors.blueGrey,
                                 // child:
                               ),
                             ],
                           ),
                         ],
                      ),
                  ),
                ),
            ).toList(),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0,top :0.0),
                child: Text('Formation Wise', style: GoogleFonts.poppins(textStyle: bigTitle)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 0.0,top: 0,right: 10.0),
                child: Text('View all',style:rowButton),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset("assests/singer2.png",fit: BoxFit.fill,width: width/2.3),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Text("SOLO",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset("assests/singer3.png",fit: BoxFit.fill,width: width/2.3),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Text("DUO",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset("assests/singer3.png",fit: BoxFit.fill,width: width/2.3),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Text("TRIO",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset("assests/singer2.png",fit: BoxFit.fill,width: width/2.3),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Text("FULL BAND",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,top :0.0),
            child: Text('New category', style: GoogleFonts.poppins(textStyle: bigTitle)),
          ),
          SizedBox(
            height: height/3.2,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset("assests/singer2.png",fit: BoxFit.fill,width: width/1.3,height: height/3.2,),
                    ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 20)
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Gailesro",style:  GoogleFonts.robotoSlab(textStyle: extraBold))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.asset("assests/singer3.png",fit: BoxFit.fill,width: width/1.3,height: height/3.2,),
                    ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 20)
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      left: 0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Gailesro",style:  GoogleFonts.robotoSlab(textStyle: extraBold))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,top :10.0),
            child: Text("""B'coz u have ----""", style: GoogleFonts.poppins(textStyle: bigTitle)),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 180,
            width: width,
            child: ListView(
              padding: const EdgeInsets.only(left: 10.0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      child: Image.asset("assests/singer2.png",height: 180,width: 120,fit: BoxFit.fill,),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                              ],
                            )
                        )
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      child: Image.asset("assests/singer3.png",height: 180,width: 120,fit: BoxFit.fill,),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                              ],
                            )
                        )
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      child: Image.asset("assests/singer1.png",height: 180,width: 120,fit: BoxFit.fill,),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                              ],
                            )
                        )
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(5.0),
                      child: Image.asset("assests/singer2.png",height: 180,width: 120,fit: BoxFit.fill,),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        top: 0,
                        right: 0,
                        child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.play_circle,color: Colors.white,size: 24,),
                                Text("Show Name",style: GoogleFonts.righteous(textStyle: cardTitle),textAlign: TextAlign.center)
                              ],
                            )
                        )
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget mainWidget(){
    return Obx((){
      if(_getFollowUpCont.isLoading.value){
        return const Center(child: CircularProgressIndicator());
      }else{
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            var data = _getFollowUpCont.All_Artist_list[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: (){
                  Get.to(clubArtiestProfile(artistId: data.id,profileId: data.profileId));
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network("${Api_link.imageUrl}${data.profile}",
                          loadingBuilder:  (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                          fit: BoxFit.fill,width: _width*0.70,height: _height*0.80),
                    ),
                    Positioned(
                        top: 5,
                        right: 5,
                        child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 20)
                    ),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Row(
                        children: [
                          data.isLike == "1" ?
                          const Icon(Icons.favorite,color: Colors.red,size: 22):
                          const Icon(Icons.favorite_border,color: Colors.red,size: 22),
                          Text(data.totalLike,style: cardTitle)
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white54
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data.username,style: bigTitle,),
                                    const SizedBox(height: 3.0),
                                    const Text("Guitarist, Singer",style: cardSubTitle,),
                                    const SizedBox(height: 3.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.maps_home_work_outlined,color: appColor,size: 20,),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 10.0),
                                          child: Row(
                                            children: [
                                              RatingBar(
                                                  initialRating:
                                                  0,
                                                  itemSize: 10,
                                                  direction: Axis
                                                      .horizontal,
                                                  allowHalfRating:
                                                  true,
                                                  glowRadius: 10,
                                                  itemCount: 5,
                                                  ratingWidget:
                                                  RatingWidget(
                                                      full: const Icon(Icons.star, size: 10, color: Colors.orange),
                                                      half: const Icon(Icons.star_half, size: 10, color: Colors.orange,),
                                                      empty: const Icon(Icons.star_outline, size: 10, color: Colors.orange,)
                                                  ),
                                                  onRatingUpdate:
                                                      (value) {
                                                    setState(() {
                                                      ratingValue = value;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 2.0),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.0),
                                            color: Colors.white,
                                          ),
                                          child: Text(data.rating,style: const TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 3.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.groups,color: appColor,size: 20,),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 10.0),
                                          child: Row(
                                            children: [
                                              RatingBar(
                                                  initialRating:
                                                  0,
                                                  itemSize: 10,
                                                  direction: Axis
                                                      .horizontal,
                                                  allowHalfRating:
                                                  true,
                                                  glowRadius: 10,
                                                  itemCount: 5,
                                                  ratingWidget:
                                                  RatingWidget(
                                                      full: const Icon(
                                                          Icons
                                                              .star,
                                                          size:
                                                          10,
                                                          color: Colors
                                                              .orange),
                                                      half:
                                                      const Icon(
                                                        Icons
                                                            .star_half,
                                                        size:
                                                        10,
                                                        color:
                                                        Colors.orange,
                                                      ),
                                                      empty:
                                                      const Icon(
                                                        Icons.star_outline,
                                                        size:
                                                        10,
                                                        color:
                                                        Colors.orange,
                                                      )),
                                                  onRatingUpdate:
                                                      (value) {
                                                    setState(() {
                                                      ratingValue = value;
                                                    });
                                                  })
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 2.0),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4.0),
                                            color: Colors.white,
                                          ),
                                          child: const Text("4.5",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assests/meter.png",fit: BoxFit.fill,height: 50),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.0),
                                        color: Colors.white,
                                      ),
                                      child: const Text("Prize : 4500",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                    ),
                                    const SizedBox(height: 2.0),
                                    Row(
                                      children: const [
                                        Icon(Icons.mic,color: appColor,size: 20,),
                                        SizedBox(width: 2.0),
                                        Text("12",style: cardTitle),
                                      ],
                                    ),
                                    const SizedBox(height: 2.0),
                                    Row(
                                      children: const [
                                        Icon(Icons.person,color: appColor,size: 20,),
                                        SizedBox(width: 2.0),
                                        Text("12",style: cardTitle),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }

  Widget chooseArtist(){
    return Obx((){
      if(_getFollowUpCont.isLoading.value){
        return const Center(child: CircularProgressIndicator());
      }else{
        return Container(
          color: gridColor,
          padding:  const EdgeInsets.only(left: 5.0,right: 5.0,bottom: 5.0,top: 5.0),
          child: Column(
            children: [
              Text('Artist to choose from',style: GoogleFonts.robotoSlab( textStyle: extraBold)),
              const SizedBox(height: 10.0),

              SizedBox(
                width: double.infinity,
                child:  GridView.builder(
                  itemCount: 9,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  semanticChildCount: _getFollowUpCont.All_Artist_list.length,
                  gridDelegate: SliverQuiltedGridDelegate(
                    crossAxisCount: 3,
                    repeatPattern: QuiltedGridRepeatPattern.inverted,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    pattern: [
                      const QuiltedGridTile(2,2),
                      const QuiltedGridTile(1,1),
                      const QuiltedGridTile(1,1),
                      const QuiltedGridTile(1,1),
                      const QuiltedGridTile(1,1),
                      const QuiltedGridTile(1,1),
                    ],),
                  itemBuilder: (context,i){
                    return InkWell(
                      onTap: (){
                        Get.to(clubArtiestProfile(
                          artistId: _getFollowUpCont.All_Artist_list[i].id,
                          profileId: _getFollowUpCont.All_Artist_list[i].profileId,));
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(Api_link.imageUrl+_getFollowUpCont.All_Artist_list[i].profile,fit: BoxFit.fill,
                            loadingBuilder:  (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )
                      ),
                    );
                  },
                ),
              ),

              // GridView.builder(
              //   shrinkWrap: true,
              //   physics:  const ScrollPhysics(),
              //   itemCount: 9,
              //   gridDelegate :
              //   const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 3,
              //       crossAxisSpacing: 5.0,
              //       mainAxisSpacing: 5.0),
              //   itemBuilder: (context, index) {
              //     var data = _getFollowUpCont.All_Artist_list[index];
              //     return InkWell(
              //       onTap: (){
              //         Get.to(clubArtiestProfile(artistId: data.id,profileId: data.profileId,));
              //       },
              //       child: ClipRRect(
              //         clipBehavior:
              //         Clip.antiAliasWithSaveLayer,
              //         borderRadius:
              //         BorderRadius.circular(5.0),
              //         child: Image.network("${Api_link.imageUrl}${data.profile}",fit: BoxFit.fill,height: _height* 0.14,width: _width*0.30,
              //           loadingBuilder:  (BuildContext context, Widget child,
              //               ImageChunkEvent? loadingProgress) {
              //             if (loadingProgress == null) return child;
              //             return Center(
              //               child: CircularProgressIndicator(
              //                 value: loadingProgress.expectedTotalBytes != null
              //                     ? loadingProgress.cumulativeBytesLoaded /
              //                     loadingProgress.expectedTotalBytes!
              //                     : null,
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     );
              //   },
              // ),
              const SizedBox(height: 10.0),
            ],
          ),
        );
      }
    });
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

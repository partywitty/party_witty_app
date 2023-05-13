

// ignore_for_file: camel_case_types

import 'package:dotted_border/dotted_border.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/artistProfileDetails.dart';
import '../Modal/artistTypeM.dart';
import '../ScheduleScreen/bookingArtist.dart';

class artistAbout extends StatefulWidget {
  String artistId,profileId;
  artistAbout({Key? key,required this.artistId,required this.profileId}) : super(key: key);

  @override
  State<artistAbout> createState() => _artistAboutState();
}

class _artistAboutState extends State<artistAbout> {
  final double _height = Get.height, _width = Get.width;
  List<Artist> categoryList = [];
  List<GenresProfile> getGenresDetails = [];
  List<BudgetsProfile> getBudgetsProfile = [];
  load(){
    GetArtistList().artistProfileDetailsApi(artistId: widget.artistId,profileId: widget.profileId).then((value) {
      setState(() {
        getGenresDetails = value.data!.genres!;
        getBudgetsProfile = value.data!.budgets!;
      });
    });
    GetArtistList().artistType().then((value) {
      setState(() {
        categoryList = value.data!.artist!;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return ListView(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        const SizedBox(height: 10.0),
        Row(
          children: const [
            SizedBox(width: 10.0,),
            Icon(Icons.location_on,color: Colors.white,size: 24,),
            SizedBox(width: 5.0,),
            Text("Select Location",style: textLabel,),
            SizedBox(width: 5.0,),
            Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 24,),
          ],
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          height: 220,
          child: FlickVideoPlayer(
            flickManager: FlickManager(
              autoPlay: false,
              videoPlayerController: VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"),
              // VideoPlayerController.network(Api_link.imageUrl  + "${widget.videoUrl}"),
            ),
            flickVideoWithControls: const FlickVideoWithControls(
              controls: FlickPortraitControls(),
            ),
            flickVideoWithControlsFullscreen: const FlickVideoWithControls(
              controls: FlickLandscapeControls(),
            ),
          ),
        ),
        const SizedBox(height: 20.0,),
        Container(
          color: Colors.black,
          height: height/3.8,
          child: Stack(
            children: [
              Image.asset("assests/singer1.png",fit: BoxFit.fill,width: width,height: height/5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: appColor.withOpacity(0.7),
                ),
                height: height/5,
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        bottom: 20,
                        right: 0,
                        child: Center(child: Text("Genres",style: GoogleFonts.robotoSlab(textStyle:  extraBold)))
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: SizedBox(
                  height: 120,
                  width: width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: getGenresDetails.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var genreData = getGenresDetails[index];
                      return Stack(
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
                                  child: Text("${genreData.name}",style: GoogleFonts.robotoSerif(textStyle: cardTitle),textAlign: TextAlign.center)))
                        ],
                      );
                  },),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: appBarColor,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: appColor)
          ),
          child: Row(
            children: const [
              SizedBox(width: 15.0,),
              Icon(Icons.calendar_month,color: Colors.white,size: 24),
              Spacer(),
              Text("Availability Check",style: textLabel,),
              SizedBox(width: 10.0,),
              Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 24),
              SizedBox(width: 15.0,),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        SizedBox(
          height: 100,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 70,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: appColor),
                  color: const Color(0xFFffb3d9).withOpacity(0.8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Fri",style: rowButton,),
                    Text("27",style: rowButton,),
                  ],
                ),
              ),
              const SizedBox(width: 10.0,),
              Container(
                width: 70,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey.withOpacity(0.8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Sat",style: popupTitle,),
                    Text("28",style: popupTitle,),
                  ],
                ),
              ),
              const SizedBox(width: 10.0,),
              Container(
                width: 70,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.grey.withOpacity(0.8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Sun",style: popupTitle,),
                    Text("29",style: popupTitle,),
                  ],
                ),
              ),
              const SizedBox(width: 10.0,),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: const Color(0xFF005788)),
                    color: const Color(0xFF3DA7E0).withOpacity(0.7)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Mon",style: popupTitle,),
                    Text("30",style: popupTitle,),
                  ],
                ),
              ),
              const SizedBox(width: 10.0,),
              Container(
                width: 70,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: appColor),
                    color: const Color(0xFFffb3d9).withOpacity(0.8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Fri",style: rowButton,),
                    Text("27",style: rowButton,),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        const Divider(color: Colors.grey,),
        const SizedBox(height: 20.0,),
        FutureBuilder<ArtistProfileDetails>(
          future: GetArtistList().artistProfileDetailsApi(artistId: widget.artistId,profileId: widget.profileId),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var userData = snapshot.data;
              return Text("${userData!.data!.profiles!.introduction}",style: GoogleFonts.poppins(textStyle: textLabel));
            }
            return const SizedBox();
          },
        ),
        const SizedBox(height: 20.0,),
        const Divider(color: Colors.grey,),
        const SizedBox(height: 10.0,),
        Container(
          decoration: BoxDecoration(
              color: appBarColor,
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: ExpansionTile(
            trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
            title: Text("Categories",style: GoogleFonts.poppins(textStyle: appTitle),),
            children: [
              const Divider(color: Colors.white),
              const SizedBox(height: 5.0),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: categoryList.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder:  (context, index) {
                    var budgetData = categoryList[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Text("${budgetData.name}",style: buttonText),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        Container(
          decoration: BoxDecoration(
              color: appBarColor,
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(5.0)
          ),
          child: ExpansionTile(
            trailing: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white),
            title: Text("Formation",style: GoogleFonts.poppins(textStyle: appTitle),),
            children: [
              const Divider(color: Colors.white),
              const SizedBox(height: 5.0),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemCount: getBudgetsProfile.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var forData = getBudgetsProfile[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${forData.subcategoryName}",style: buttonText),
                          const Divider(color: Colors.grey,),
                          Text("₹ ${forData.price}/-",style: buttonText)
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        Text("Artist Features",style: GoogleFonts.poppins(textStyle: appTitle),),
        const SizedBox(height: 10.0,),
        SizedBox(
          height: 130,
          child: ListView(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                children: [
                  DottedBorder(
                    color: appColor,
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: drawerColor,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Image.asset("assests/avrage.png",height: 50,fit: BoxFit.fill,width: 50,),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Text("last month avg",style: GoogleFonts.poppins(textStyle: cardSubTitle),),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  DottedBorder(
                    color: appColor,
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: drawerColor,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Image.asset("assests/humer.png",height: 50,fit: BoxFit.fill,width: 50,),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Text("Hightest bid",style: GoogleFonts.poppins(textStyle: cardSubTitle),),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  DottedBorder(
                    color: appColor,
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: drawerColor,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Image.asset("assests/star.png",height: 50,fit: BoxFit.fill,width: 50,),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Text("Favorites",style: GoogleFonts.poppins(textStyle: cardSubTitle),),
                ],
              ),
              const SizedBox(width: 10,),
              Column(
                children: [
                  DottedBorder(
                    color: appColor,
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          color: drawerColor,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Image.asset("assests/percent.png",height: 50,fit: BoxFit.fill,width: 50,),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Text("Avg Coupons Solds",style: GoogleFonts.poppins(textStyle: cardSubTitle),),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0,),
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
        const SizedBox(height: 10.0,),
        // Row(
        //   children: const [
        //     Icon(Icons.location_on,color: Colors.white,size: 24,),
        //     SizedBox(width: 5.0,),
        //     Text("Pincode",style: textLabel,),
        //     SizedBox(width: 5.0,),
        //     Icon(Icons.keyboard_arrow_down,color: Colors.white,size: 24,),
        //   ],
        // ),
        const SizedBox(height: 10.0,),
        GestureDetector(
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context) => const setupDetails(),));
            Navigator.push(context, MaterialPageRoute(builder: (context) => const bookingArtistFirst(),));
          },
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: boxDecoration(),
            child: const Text('Book Now', style: buttonText),
          ),
        ),
        const SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("*Terms & Condition applied",
              style: TextStyle(color:Colors.red,fontSize: 9 ,fontWeight: FontWeight.normal)),
            Text("**Stage Performance time limited to 120 minute",style: gitarist,),
          ],
        ),
        const SizedBox(height: 20.0,),
        Container(
          height: 250,
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 10.0),
          decoration: BoxDecoration(
            color: appBarColor,
            border: Border.all(color: appColor),
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: drawerColor,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                 height: 150,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assests/singer2.png",height: 150,fit: BoxFit.fill,width: 150),
                    const SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Malvika",style: textHint,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0 ),
                            decoration: BoxDecoration(
                                color: appBarColor,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Row(
                              children: [
                                Text("4.1",style: textHint,),
                                Icon(Icons.star,color: Colors.yellow,size: 14,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("₹ 2000/-",style: textHint,),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Inc. of all taxes",style: textHint,),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10.0,),
              const Center(child: Text("VS",style: extraBold,)),
              const SizedBox(width: 10.0,),
              Container(
                decoration: BoxDecoration(
                    color: drawerColor,
                    borderRadius: BorderRadius.circular(5.0)
                ),
                height: 150,
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assests/singer3.png",height: 150,fit: BoxFit.fill,width: 150),
                    const SizedBox(height: 5.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Malvika",style: textHint,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0 ),
                            decoration: BoxDecoration(
                                color: appBarColor,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Row(
                              children: [
                                Text("4.1",style: textHint,),
                                Icon(Icons.star,color: Colors.yellow,size: 14,)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("₹ 2000/-",style: textHint,),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Inc. of all taxes",style: textHint,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20.0,),
        SizedBox(
          height: height/2.5,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset("assests/new1.png",fit: BoxFit.fill,height: 190,width: 160),
                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 20)
                      ),
                    ],
                  ),
                  Text("Artist Name",style: GoogleFonts.poppins(textStyle: extraBold),),
                  const Text("₹ 2000/-",style: textHint,),
                  const Text("Inc. of all taxes",style: textHint,),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset("assests/new2.png",fit: BoxFit.fill,height: 190,width: 160),
                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 20)
                      ),
                    ],
                  ),
                  Text("Artist Name",style: GoogleFonts.poppins(textStyle: extraBold),),
                  const Text("₹ 2000/-",style: textHint,),
                  const Text("Inc. of all taxes",style: textHint,),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset("assests/new3.png",fit: BoxFit.fill,height: 190,width: 160),
                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 20)
                      ),
                    ],
                  ),
                  Text("Artist Name",style: GoogleFonts.poppins(textStyle: extraBold),),
                  const Text("₹ 2000/-",style: textHint,),
                  const Text("Inc. of all taxes",style: textHint,),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

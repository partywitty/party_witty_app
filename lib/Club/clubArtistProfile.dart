
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_app/Club/clubArtistReview.dart';
import 'package:flutter_app/Club/myChannel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../ArtistScreen/artistAbout.dart';
import '../Controller/style.dart';
import '../Modal/artistProfileDetails.dart';

class clubArtiestProfile extends StatefulWidget {
  String artistId,profileId;
  clubArtiestProfile({Key? key,required this.artistId,required this.profileId}) : super(key: key);

  @override
  State<clubArtiestProfile> createState() => _clubArtiestProfileState();
}

class _clubArtiestProfileState extends State<clubArtiestProfile>with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    print("${widget.artistId}-----------artist id");
    print("${widget.profileId}-----------profile id");
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            FutureBuilder<ArtistProfileDetails>(
              future: GetArtistList().artistProfileDetailsApi(artistId: widget.artistId,profileId: widget.profileId),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  var userData = snapshot.data;
                  return Column(
                    children: [
                      SizedBox(
                        height: height/2.2,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: height/2.8,
                              child: Stack(
                                children: [
                                  userData!.data!.coverPhoto == null ?
                                  Image.network("https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=",fit: BoxFit.fill,height: height/2.8,width: width,):
                                  Image.network("${Api_link.imageUrl}${userData.data!.coverPhoto!.filePath}",fit: BoxFit.fill,height: height/2.8,width: width,),
                                  Positioned(
                                      left: 7,
                                      top: 7,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.home_work_outlined,color: appColor,size: 16),
                                                Icon(Icons.star,size: 16,color: Colors.yellow),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.groups,color: appColor,size: 16),
                                                Icon(Icons.star,size: 16,color: Colors.yellow),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  Positioned(
                                      top: 7,
                                      right: 10,
                                      child: Row(
                                        children: const [
                                          Icon(Icons.share,color: Colors.white,size: 24,),
                                          SizedBox(width: 10),
                                          Icon(Icons.volume_off,size: 24,color: Colors.white,)
                                        ],
                                      )),
                                  Positioned(
                                      left: 7,
                                      bottom : 7,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.mic,size: 16,color: appColor),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.white38,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: const [
                                                Icon(Icons.person,size: 16,color: appColor),
                                                Text("4.5k",style: cardSubTitle,)
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                  Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Column(
                                        children: [
                                          Image.asset("assests/meter.png",fit: BoxFit.fill,height: 70),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(5.0)
                                            ),
                                            child: const Text("Prize : 4500",style: blackSubTitle,),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: OctoImage.fromSet(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          userData.data!.profilePhoto == null ?
                                          "https://www.pngfind.com/pngs/m/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.png" :
                                          "${Api_link.imageUrl}${userData.data!.profilePhoto!.filePath}"),
                                      octoSet: OctoSet.circleAvatar(
                                          backgroundColor: appColor,
                                          text: Text(userData.data!.user!.username![0].split("").last.toUpperCase(),
                                            style: GoogleFonts.poppins(color: Colors.white,fontSize: 50))
                                      )
                                  ),
                                ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Center(
                          child: Column(
                            children: [
                              Text("${userData.data!.user!.username}",style: GoogleFonts.poppins(textStyle: extraBold),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.favorite,size: 16,color: Colors.red),
                                  SizedBox(width: 5,),
                                  Text("4.5k",style: textLabel,)
                                ],
                              ),
                            ],
                          )
                      ),
                    ],
                  );
                }
                return const SizedBox();
                },
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
               //alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              height: 50,
              child: TabBar(
                labelColor: Colors.white,
                controller: _tabController,
                isScrollable: true,
                indicatorWeight: 0.0,
                indicatorColor: appColor,
                unselectedLabelColor: appColor,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                padding:  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
                indicator:  const UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: appColor,
                      width: 3,
                    )
                ),
                tabs: <Widget>[
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 5.0),
                      child: const Text('About', style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),),),
                  ),
                  Tab(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                        child: const Text("My Channel", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500))
                    ),
                  ),
                  Tab(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                        child: const Text("Review", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height/1.2,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  artistAbout(artistId: widget.artistId,profileId: widget.profileId),
                  myChannel(artistId: widget.artistId,profileId: widget.profileId),
                  artistReview(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

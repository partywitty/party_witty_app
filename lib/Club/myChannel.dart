
// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/style.dart';
import '../Controller/videoPlayer.dart';
import '../Modal/artistProfileDetails.dart';

class myChannel extends StatefulWidget {
  String artistId,profileId;
  myChannel({Key? key,required this.artistId,required this.profileId}) : super(key: key);

  @override
  State<myChannel> createState() => _myChannelState();
}

class _myChannelState extends State<myChannel> {
  final double _height = Get.height, _width = Get.width;
  List<PhotographsProfile> getPhotographsProfile = [];
  List<VideoProfile> getVideoProfile = [];
  List<PhotoWithBrands> getPhotoWithBrands = [];
  List<OriganalVideoSong> getOriginalVideoSong = [];
  List<VideoCoverSong> getVideoCoverSong = [];

  load(){
    GetArtistList().artistProfileDetailsApi(artistId: widget.artistId,profileId: widget.profileId).then((value) {
      setState(() {
        getPhotographsProfile = value.data!.photographs!;
        getVideoProfile = value.data!.video!;
        getPhotoWithBrands = value.data!.photoWithBrands!;
        getOriginalVideoSong = value.data!.origanalVideoSong!;
        getVideoCoverSong = value.data!.videoCoverSong!;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text("My Images",style: GoogleFonts.poppins(textStyle : appTitle)),
        const SizedBox(height: 10),

        SizedBox(
          width: double.infinity,
          child:  GridView.builder(
            itemCount: getPhotographsProfile.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            semanticChildCount: getPhotographsProfile.length,
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 3,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              pattern: [
                QuiltedGridTile(2,2),
                QuiltedGridTile(1,1),
                QuiltedGridTile(1,1),
                QuiltedGridTile(1,1),
                QuiltedGridTile(1,1),
                QuiltedGridTile(1,1),
              ],),
            itemBuilder: (context,i){
              return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(Api_link.imageUrl+getPhotographsProfile[i].filePath.toString(),fit: BoxFit.fill,)
              );
            },
          ),
        ),


        // GridView.builder(
        //     shrinkWrap: true,
        //     physics: const ScrollPhysics(),
        //     itemCount: getPhotographsProfile.length,
        //     gridDelegate:
        //     const SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 3,
        //         crossAxisSpacing: 5.0,
        //         mainAxisSpacing: 5.0),
        //     itemBuilder: (BuildContext context, int index){
        //       var data = getPhotographsProfile[index];
        //       return ClipRRect(
        //           clipBehavior:
        //           Clip.antiAliasWithSaveLayer,
        //           borderRadius:
        //           BorderRadius.circular(5.0),
        //           child:  Image.network("${Api_link.imageUrl}${data.filePath}",fit: BoxFit.fill,height: _height* 0.14,width: _width*0.30,));
        //     }
        // ),
        const SizedBox(height: 20),
        Text("My Video",style: GoogleFonts.poppins(textStyle : appTitle)),
        const SizedBox(height: 10),
        SizedBox(
          height: height/4,
          child: ListView.builder(
            itemCount: getVideoProfile.length,
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = getVideoProfile[index];
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image.asset("assests/singer2.png",fit: BoxFit.fill,),
                      ),
                      Positioned(
                          top: 5,
                          left: 5,
                          child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 20)
                      ),
                      const Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Center(
                            child: Icon(Icons.play_circle,color: Colors.white,size: 35,)
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text("Milestone",style: GoogleFonts.poppins(textStyle : appTitle)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset("assests/singer2.png",fit: BoxFit.fill,width: width/2.5),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                      child: Text("CLUBS",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset("assests/singer3.png",fit: BoxFit.fill,width: width/2.5),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                      child: Text("BANDS",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset("assests/singer2.png",fit: BoxFit.fill,width: width/2.5),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Text("CELEB",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset("assests/singer3.png",fit: BoxFit.fill,width: width/2.5),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Text("BRANDS",style: GoogleFonts.robotoSlab(textStyle : appTitle)),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Original Song",style: GoogleFonts.poppins(textStyle : appTitle)),
            const Text('View all',style:rowButton),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: const LinearGradient(
              begin: FractionalOffset(0.1, 0.1),
              end: FractionalOffset(0.7, 0.1),
              colors: [
                Color(0xFFC53838),
                Color(0xFFF1E7B6),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width/2.8,
                    child: Column(
                      children: [
                        Text("Original\n Song",style: GoogleFonts.poppins(textStyle : appTitle)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("“It is a long established fact that a reader will be distracted by the readable content.”",
                              style: GoogleFonts.poppins(textStyle : likes)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    width: width/2.0,
                    height: 200,
                    child: GridView.builder(
                      itemCount: getOriginalVideoSong.length,
                      gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0),
                        itemBuilder: (context, index) {
                        var data = getOriginalVideoSong[index];
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset("assests/singer3.png",fit: BoxFit.fill),
                              ),
                              Positioned(
                                  top: 5,
                                  left: 5,
                                  child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 10)
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Center(
                                    child: InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                                      },
                                        child: const Icon(Icons.play_circle,color: Colors.white,size: 35,))
                                ),
                              ),
                            ],
                          );
                        },),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                color: const Color(0xFFFF5B6C),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("It is a long established fact that a",style: GoogleFonts.poppins(textStyle : buttonText)),
                    const Icon(Icons.arrow_forward_ios,size: 24,color: Colors.white,)
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          decoration: BoxDecoration(
            color: appBarColor,
            border: Border.all(color: appColor),
            borderRadius: BorderRadius.circular(5.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assests/img.png",height: 25,fit: BoxFit.fill,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'It is a long',style:  textLabel),
                        TextSpan(
                          text: ' established fact that a',
                          style: GoogleFonts.robotoFlex(color: Colors.green,fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Text("It is a long established fact that a",style: likes),
                ],
              ),
              const Text("Apply",style: TextStyle(color: Colors.blue,fontSize: 12,fontWeight: FontWeight.w400)),
              const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.white),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cover Song",style: GoogleFonts.poppins(textStyle : appTitle)),
            const Text('View all',style:rowButton),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: const LinearGradient(
              begin: FractionalOffset(0.1, 0.1),
              end: FractionalOffset(0.7, 0.1),
              colors: [
                Color(0xFFFD8BA1),
                Color(0xFFC056D9),
                Color(0xFFE99DAE),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: width/2.8,
                    child: Column(
                      children: [
                        Text("Cover\n Song",style: GoogleFonts.poppins(textStyle : appTitle)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("“It is a long established fact that a reader will be distracted by the readable content.”",
                              style: GoogleFonts.poppins(textStyle : likes)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    width: width/2.0,
                    height: 200,
                    child: GridView.builder(
                      itemCount: getVideoCoverSong.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0),
                      itemBuilder: (context, index) {
                        var data = getVideoCoverSong[index];
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset("assests/singer3.png",fit: BoxFit.fill),
                            ),
                            Positioned(
                                top: 5,
                                left: 5,
                                child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 10)
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Center(
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => videoPlayer(videoUrl: data.filePath),));
                                    },
                                      child: const Icon(Icons.play_circle,color: Colors.white,size: 35)
                                  )
                              ),
                            ),
                          ],
                        );
                      },),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                color: const Color(0xFF930050),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("It is a long established fact that a",style: GoogleFonts.poppins(textStyle : buttonText)),
                    const Icon(Icons.arrow_forward_ios,size: 24,color: Colors.white,)
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

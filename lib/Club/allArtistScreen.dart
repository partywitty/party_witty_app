
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../ApiServices/AllArtistApi.dart';
import '../ApiServices/api_link.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'clubArtistProfile.dart';

class allArtistScreen extends StatefulWidget {
  const allArtistScreen({Key? key}) : super(key: key);

  @override
  State<allArtistScreen> createState() => _allArtistScreenState();
}

class _allArtistScreenState extends State<allArtistScreen> {

  final _getFollowUpCont = Get.put(GetAllArtistApi1());

  final double _height = Get.height, _width = Get.width;
  double? _ratingValue;
  @override
  void initState() {
    _getFollowUpCont.getArtistUpApi().then((value) {});
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191a),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('All Artist',style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: mainWidget(),
    );
  }
  Widget mainWidget(){
    return Obx((){
      if(_getFollowUpCont.isLoading.value){
        return const Center(child: CircularProgressIndicator());
      }else{
        return ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          itemCount: _getFollowUpCont.All_Artist_list.length,
          itemBuilder: (context, index) {
            var data = _getFollowUpCont.All_Artist_list[index];
            return InkWell(
              onTap: (){
                Get.to(clubArtiestProfile(artistId: data.id,profileId: data.profileId,));
              },
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  Stack(
                    children: [
                      Image.network("${Api_link.imageUrl}${data.profile}",
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
                          fit: BoxFit.fill,height: _height*0.50,width: _width),
                      data.gender == "male" ?
                      Positioned(
                          top: 10,
                          left: 10,
                          child: Row(
                            children: [
                              data.isLike == "1" ?
                              const Icon(Icons.favorite,size: 24,color: Colors.red) :
                              const Icon(Icons.favorite_border,size: 24,color: Colors.red),
                              const SizedBox(width: 2.0),
                              Text(data.totalLike,style: appTitle),
                              const SizedBox(width: 5.0),
                              Image.asset("assests/share.png",fit: BoxFit.fill,height: 15),
                            ],
                          )
                      ) :
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Image.asset("assests/img.png",fit: BoxFit.fill,height: 25),
                      ),
                      data.gender == "male" ?
                      Positioned(
                          bottom: 10.0,
                          right: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset("assests/img.png",fit: BoxFit.fill,height: 25),
                              Text(data.username,style: GoogleFonts.poppins(textStyle: appTitle)),
                              Text(data.typeOfArtistName,style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 80,
                                    child: SizedBox(
                                      width: 100, height: 100, //height and width of guage
                                      child:SfRadialGauge(
                                          enableLoadingAnimation: true, //show meter pointer movement while loading
                                          animationDuration: 4500, //pointer movement speed
                                          axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                                            RadialAxis(
                                                minimum: 0,maximum: 15,
                                                ranges: <GaugeRange>[ //Guage Ranges
                                                  GaugeRange(startValue: 0,endValue: 5, color: const Color(0xFF7AFF77), startWidth: 10,endWidth: 10),
                                                  GaugeRange(startValue: 5,endValue: 10,color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
                                                  GaugeRange(startValue: 10,endValue: 15,color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
                                                ],
                                                pointers: const <GaugePointer>[
                                                  /// pointer dynamic value
                                                  NeedlePointer(value:8,
                                                    needleColor: Colors.white,
                                                    needleEndWidth: 5,
                                                    knobStyle: KnobStyle(color: Colors.deepOrange,borderColor: Colors.lightBlue,),
                                                  )
                                                ],
                                                annotations: const <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Text('',style: TextStyle(fontSize: 0,fontWeight:FontWeight.bold,color: Colors.white)),
                                                      angle: 90,
                                                      positionFactor: 0.5),
                                                  //add more annotations 'texts inside guage' here
                                                ]
                                            )]
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.white,
                                    ),
                                    child: const Text("Prize : 4500",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(5.0),
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white54
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.maps_home_work_outlined,color: appColor,size: 20,),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 10.0),
                                          child: RatingBar(
                                              initialRating: 4.5,
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
                                                  _ratingValue = value;
                                                });
                                              }),
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
                                        const SizedBox(width: 10.0),
                                        const Icon(Icons.mic,size: 20,color: appColor,),
                                        const Text("12",style: cardSubTitle),
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
                                          child: RatingBar(
                                              initialRating: 4,
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
                                                  _ratingValue = value;
                                                });
                                              }),
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
                                        const SizedBox(width: 2.0),
                                        const Icon(Icons.person,size: 20,color: appColor,),
                                        const Text("1.5K",style: cardSubTitle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  alignment: Alignment.center,
                                  height: 30.0,
                                  decoration: boxDecoration(),
                                  child: Text('Book Now',style: GoogleFonts.poppins(textStyle: cardSubTitle)
                                  ),
                                ),
                              ),
                            ],
                          )
                      ) :
                      Positioned(
                          bottom: 10.0,
                          left: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  data.isLike == "1" ?
                                  const Icon(Icons.favorite,size: 24,color: Colors.red) :
                                  const Icon(Icons.favorite_border,size: 24,color: Colors.red),
                                  const SizedBox(width: 2.0),
                                  Text(data.totalLike,style: appTitle),
                                  const SizedBox(width: 5.0),
                                  Image.asset("assests/share.png",fit: BoxFit.fill,height: 15),
                                ],
                              ),
                              Text(data.username,style: GoogleFonts.poppins(textStyle: appTitle)),
                              Text(data.typeOfArtistName,style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 80,
                                    child: SizedBox(
                                      width: 100, height: 100, //height and width of guage
                                      child:SfRadialGauge(
                                          enableLoadingAnimation: true, //show meter pointer movement while loading
                                          animationDuration: 4500, //pointer movement speed
                                          axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                                            RadialAxis(
                                                minimum: 0,maximum: 15,
                                                ranges: <GaugeRange>[ //Guage Ranges
                                                  GaugeRange(startValue: 0,endValue: 5, color: const Color(0xFF7AFF77), startWidth: 10,endWidth: 10),
                                                  GaugeRange(startValue: 5,endValue: 10,color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
                                                  GaugeRange(startValue: 10,endValue: 15,color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
                                                ],
                                                pointers: const <GaugePointer>[
                                                  /// pointer dynamic value
                                                  NeedlePointer(
                                                    value:8,
                                                    needleColor: Colors.white,
                                                    needleEndWidth: 5,
                                                    knobStyle: KnobStyle(color: Colors.deepOrange,borderColor: Colors.lightBlue,),
                                                  )
                                                ],
                                                annotations: const <GaugeAnnotation>[
                                                  GaugeAnnotation(
                                                      widget: Text('',style: TextStyle(fontSize: 0,fontWeight:FontWeight.bold,color: Colors.white)),
                                                      angle: 90,
                                                      positionFactor: 0.5),
                                                  //add more annotations 'texts inside guage' here
                                                ]
                                            )]
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: Colors.white,
                                    ),
                                    child: const Text("Prize : 4500",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black),),
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(5.0),
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: Colors.white54
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.maps_home_work_outlined,color: appColor,size: 20,),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(
                                              left: 10.0),
                                          child: RatingBar(
                                              initialRating: 4.5,
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
                                                  _ratingValue = value;
                                                });
                                              }),
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
                                        const SizedBox(width: 10.0),
                                        const Icon(Icons.mic,size: 20,color: appColor,),
                                        const Text("12",style: cardSubTitle),
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
                                          child: RatingBar(
                                              initialRating: 4,
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
                                                  _ratingValue = value;
                                                });
                                              }),
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
                                        const SizedBox(width: 2.0),
                                        const Icon(Icons.person,size: 20,color: appColor,),
                                        const Text("1.5K",style: cardSubTitle),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  alignment: Alignment.center,
                                  height: 30.0,
                                  decoration: boxDecoration(),
                                  child: Text('Book Now',style: GoogleFonts.poppins(textStyle: cardSubTitle)
                                  ),
                                ),
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            );
          },
        );
      }
    });
  }
}

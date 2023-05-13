// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/artistListApi.dart';
import '../Modal/filterArtistM.dart';
import '../Screens/filter.dart';
import '../Controller/style.dart';

class filterArtist extends StatefulWidget {
  var artistId;
  String startPrice,endPrice,genreName,venueName,subCategory,instrumentIds;
  filterArtist({Key? key,this.artistId,
    required this.startPrice,
    required this.endPrice,
    required this.genreName,
    required this.venueName,
    required this.subCategory,
    required this.instrumentIds
  }) : super(key: key);

  @override
  State<filterArtist> createState() => _filterArtistState();
}

class _filterArtistState extends State<filterArtist> {

  List<filterData> getFilterArtist = [];

  bool loader = false;

  load(){
    GetArtistList().artistFilterApi(
      artistTypeId: widget.artistId == "" ? "" : widget.artistId,
      subName: widget.subCategory == "" ? "" : widget.subCategory,
      instrumentId: widget.instrumentIds == "" ? "" : widget.instrumentIds,
      genresName: widget.genreName == "" ? "" : widget.genreName,
      venueName: widget.venueName == "" ? "" : widget.venueName,
      startPrice: widget.startPrice == null ? "" : widget.startPrice,
      endPrice: widget.endPrice == null ? "" : widget.endPrice,
    ).then((value) {
      setState(() {
        loader = true;
        getFilterArtist = value.data!;
      });
    });
  }
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    load();
    print("artist id---------------//-------${widget.artistId}");
    print("subcategory---------------//-------${widget.subCategory}");
    print("instrument---------------//-------${widget.instrumentIds}");
    print("genres Name---------------//-------${widget.genreName}");
    print("venue Name---------------//-------${widget.venueName}");
    print("start Price---------------//-------${widget.startPrice}");
    print("end Price---------------//-------${widget.endPrice}");
  }
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191a),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Artist List",style: TextStyle(fontSize: 18,color: Colors.white),),
      ),
      body:
      //loader == false ? const Center(child: CircularProgressIndicator()) :
      getFilterArtist.isEmpty ?
      const Center(
          child: Text('Data not found',
            style: TextStyle(color: Colors.white,fontSize: 14),)) :
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assests/Vector.png'),
            fit: BoxFit.fill
          )
        ),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            shrinkWrap: true,
            itemCount: getFilterArtist.length,
            itemBuilder: (context, index) {
              var data = getFilterArtist[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF747576),
                      border: Border.all(
                          color: Colors.red, width: 0.9),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              foregroundImage: AssetImage(
                                'assests/shawli.png',
                                // fit: BoxFit.fill,
                              ),
                              // maxRadius: 28,
                              backgroundColor:
                              Colors.blueGrey,
                              // child:
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 8.0,top: 10),
                                    child: Container(
                                      child: Text("${data.username}",
                                          // fit: BoxFit.fill,
                                          style: GoogleFonts.poppins(
                                              fontWeight:
                                              FontWeight
                                                  .w400,
                                              fontSize: 15 ,
                                              color: Colors
                                                  .white)),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 10.0),
                                    child: Container(
                                      // width: 100,
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
                                                      Icons
                                                          .star_outline,
                                                      size:
                                                      10,
                                                      color:
                                                      Colors.orange,
                                                    )),
                                                onRatingUpdate:
                                                    (value) {
                                                  setState(() {
                                                    _ratingValue =
                                                        value;
                                                  });
                                                })
                                          ],
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "${data.artistName}",
                                      style: gitarist,
                                    ),
                                  ),
                                  const SizedBox(height: 7,),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                              'assests/mic.png'),
                                        ),
                                        const Text('12',style: likes),
                                        const SizedBox(width: 6,),
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                              'assests/man.png'),
                                        ),
                                        const Text('1.5k',
                                            style: likes)
                                      ],
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 68.0,
                              right: 7,bottom: 5),
                          child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(3)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Filter_page(
                                      artistId: data.id.toString(),
                                    ),)).then((value) {
                                    load();
                                  });
                                  // GetArtistList().send_request(
                                  //     recieverId: "${data.id}",
                                  //     context: context).then((value){
                                  //   load();
                                  //});
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => const Booking_request()),
                                  // );
                                },
                                child: const Center(
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(
                                        left: 4.0,
                                        right: 4),
                                    child: Text("Referred Code Request",
                                      style: (TextStyle(
                                          color: Colors.black,
                                          fontSize: 9)),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}

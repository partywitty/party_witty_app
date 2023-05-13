import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/filter.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import '../ApiServices/artistListApi.dart';
import '../Auth/searchFilter.dart';
import '../Modal/AritistM.dart';

class Booking_request extends StatefulWidget {
  const Booking_request({Key? key}) : super(key: key);

  @override
  State<Booking_request> createState() => _Booking_requestState();
}

class _Booking_requestState extends State<Booking_request> {

  TextEditingController searchArtist = TextEditingController();

  bool loader = false;

  bool sufi = false;
  bool foke = false;
  bool instru1 = false;
  bool instru2 = false;
  bool trio = false;
  bool duo = false;
  bool solo = false;
  List<Artists> getArtistLists = [];
  List<Artists> searchArtistLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getArtistList.getArtistUpApi(userId: 1.toString()).then((value) {});
    load();
  }

  load(){
    GetArtistList().getArtist().then((value) {
      setState(() {
        loader = true;
        getArtistLists =searchArtistLists= value.data!.artists!;
      });
    });
  }

  String? gender;
  bool value = false;
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191a),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Artist List',style: appBarText),
        actions: [
          SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width/2,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  searchArtistLists = getArtistLists
                      .where((name) => name.username!
                      .toLowerCase()
                      .contains(value.toLowerCase()))
                      .toList();
                });
              },
              controller: searchArtist,
              keyboardType: TextInputType.text,
              autofocus: false,
              style: const TextStyle(
                  fontSize: 14.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                hintText: "Search artist",
                hintStyle: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),
                fillColor: const Color(0xFF434445),
                filled: true,
                contentPadding: const EdgeInsets.only(
                    left: 25.0, bottom: 12.0, top: 0.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color(0xFF434445)),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color(0xFF434445)),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => searchFilter(),));
                  //filter_page();
                },
                icon: Image.asset(
                    'assests/menu.png', scale: 4,
                    fit: BoxFit.fill)),
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shrinkWrap: true,
          // itemCount: getArtistLists.length,
          itemCount: searchArtistLists.isEmpty ? 0 : searchArtistLists.length,
          itemBuilder: (context, index) {
            var data = searchArtistLists[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                  height: 100,
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
                                      "${data.typeOfArtistName}",
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
                                        const Icon(Icons.person,color: appColor,size: 18,),
                                        const Text('1.5k',style: likes)
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
                  )),
            );
          }),
    );
  }

  filter_page() {
    return showDialog(
        barrierDismissible: true,
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                insetPadding:
                EdgeInsets.only( left: 30, right: 28,),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xFF434445),
                  ),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        // width: double.maxFinite,
                        color: const Color(0xFF535353),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assests/menu.png',
                                      scale: 4,
                                      fit: BoxFit.fill,
                                    ),
                                    const SizedBox(width: 5,),
                                    Text(
                                      'Filter',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    sufi = false;
                                    foke = false;
                                    instru1 = false;
                                    instru2 = false;
                                    trio = false;
                                    duo = false;
                                    solo = false;
                                  });
                                },
                                icon: Icon(
                                  Ionicons.close,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            )
                          ],
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
                                    Text('Age',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.white),),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1),
                                      child: Container(
                                        width: 90,
                                        height: 30,
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
                                    Padding(
                                      padding: const EdgeInsets.only(),
                                      child: Text(
                                        'Gender',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8,),
                                      child: Container(
                                        height: 30,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF666667),
                                            borderRadius: BorderRadius.circular(20)),
                                        // color: Colors.white70,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Male',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 9, color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              width: 10,
                                              child: Radio(
                                                // activeColor:  Color(0xFFfd2630),
                                                fillColor:
                                                MaterialStateProperty.resolveWith<Color>(
                                                        (Set<MaterialState> states) {
                                                      return (value)
                                                          ? Colors.white
                                                          : Color(0xFFfd2630);
                                                    }),
                                                focusColor: Colors.white,
                                                hoverColor: Colors.white,
                                                autofocus: true,
                                                value: "Male",
                                                groupValue: gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    gender = value.toString();
                                                  });
                                                },
                                              ),
                                            ),

                                            Container(
                                              height: 40, width: 1, color: Colors.white,),
                                            Padding(
                                              padding: const EdgeInsets.only(),
                                              child: Text(
                                                'Female',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 9, color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              width: 8,
                                              child: Radio(
                                                activeColor: Color(0xFFfd2630),
                                                fillColor:
                                                MaterialStateProperty.resolveWith<Color>(
                                                        (Set<MaterialState> states) {
                                                      return (value)
                                                          ? Colors.white
                                                          : Color(0xFFfd2630);
                                                    }),
                                                value: "female",
                                                groupValue: gender,
                                                onChanged: (value) {
                                                  setState(() {
                                                    gender = value.toString();
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 20),
                        child: Text(
                          'Music Type',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFormField(
                            autofocus: false,
                            style: TextStyle(
                                fontSize: 15.0, color: Color(0xFFbdc6cf)),
                            decoration: InputDecoration(
                              hintText: 'Enter a music type..',
                              hintStyle: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.white54),
                              suffixIcon: Icon(
                                Ionicons.close,
                                color: Colors.white,
                                size: 25,
                              ),
                              fillColor: Color(0xFF666667),
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 25.0, bottom: 12.0, top: 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFF434445)),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Color(0xFF434445)),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            sufi ? Container(width: 40, height: 15,) :
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 35,
                                padding: EdgeInsets.only(left: 3,),
                                 decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                    begin: FractionalOffset(0.1, 0.1),
                                    end: FractionalOffset(0.7, 0.1),
                                    colors: [
                                      Color(0xFFFE262F),
                                      Color(0xFFFD2F71),
                                    ],
                                  ),),
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left:13.0),
                                        child: Text('sufi',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.white,)),
                                      ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: IconButton(onPressed: () {
                                      setState((){
                                        sufi=!sufi;
                                      });
                                    }, icon: Icon(
                                      Ionicons.close,color: Colors.white,size: 20,
                                      )),
                                  )
                                    ],
                                  )),
                            ),
                            SizedBox(width: 15,),
                            foke ? Container(width: 40, height: 15,) :
                            Container(
                                height: 35,
                                padding: EdgeInsets.only(left: 3,),
                                decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: FractionalOffset(0.1, 0.1),
                                    end: FractionalOffset(0.7, 0.1),
                                    colors: [
                                      Color(0xFFFE262F),
                                      Color(0xFFFD2F71),
                                    ],
                                  ),),
                                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:13.0),
                                      child: Text('foke',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: Colors.white,)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 10.0),
                                      child: IconButton(onPressed: () {
                                        setState(() {
                                          foke = !foke;
                                        });
                                      }, icon: Icon(
                                        Ionicons.close,color: Colors.white,size: 20,
                                      )),
                                    )
                                  ],
                                )),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

}

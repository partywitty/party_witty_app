import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ArtistRagistration/Upload_clubs.dart';

class Days_page extends StatefulWidget {
  const Days_page({Key? key}) : super(key: key);

  @override
  State<Days_page> createState() => _Days_pageState();
}

List<PhotoModel> photolist = [
  PhotoModel(title: 'M', image: "assests/music_img.png", isSelect: false),
  PhotoModel(title: 'T', image: "assests/friday.png", isSelect: false),
  PhotoModel(title: 'W', image: "assests/restra_img.png", isSelect: false),
  PhotoModel(title: 'T', image: "assests/music_img.png", isSelect: false),
  PhotoModel(title: 'F', image: "assests/friday.png", isSelect: false),
  PhotoModel(title: 'S', image: "assests/restra_img.png", isSelect: false),
  PhotoModel(title: 'S', image: "assests/music_img.png", isSelect: false),
];

class _Days_pageState extends State<Days_page> {
  String? gender;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: axisDirectionToAxis(
          AxisDirection.down,
        ),
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height * 0.63,
                child: Image.asset(
                  'assests/light.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  // bottom: height*0.2,

                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      // height: 200,
                      width: width,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text(
                                  "How Many Days in a Week Do We have Live Music",
                                  textScaleFactor: 1,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                      color: Colors.white)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 35, top: 8),
                              child: Container(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 7,
                                  itemBuilder: (context, i) {
                                    return Wrap(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              photolist[i].isSelect =
                                                  !photolist[i].isSelect;
                                            });
                                          },
                                          child: Container(
                                            height: 25,
                                            width: 25,
                                            child: Center(
                                                child: Text(
                                              photolist[i].title,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: FractionalOffset(
                                                        0.1, 0.1),
                                                    end: FractionalOffset(
                                                        0.8, 0.1),
                                                    colors: photolist[i]
                                                            .isSelect
                                                        ? [
                                                            Color(0xFFFE262F),
                                                            Color(0xFFFD2F71),
                                                          ]
                                                        : [
                                                            Colors.black,
                                                            Colors.black,
                                                          ]),
                                                border: Border.all(
                                                  color: Color(0xFFFE262F),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(1)),
                                          ),
                                        ),
                                      ),
                                    ]);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Container(
                                  child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/musical_page');
                                },
                                child: Container(
                                  width: 140,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: FractionalOffset(0.1, 0.1),
                                      end: FractionalOffset(0.8, 0.1),
                                      colors: [
                                        Color(0xFFFE262F),
                                        Color(0xFFFD2F71),
                                      ],
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  child: Center(
                                    child: Text('Submit',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white)),
                                  ),
                                ),
                              )),
                            ),
                            SizedBox(
                              height: 73,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

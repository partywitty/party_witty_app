// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class clubEditDetails extends StatefulWidget {
  const clubEditDetails({Key? key}) : super(key: key);

  @override
  State<clubEditDetails> createState() => _clubEditDetailsState();
}

class _clubEditDetailsState extends State<clubEditDetails> {
  String selected = "Morning Slot";
  String selectedEvent = "Upload a Poster";
  final double _height = Get.height, _width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Live Music",
            style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: appColor),
              color: appBarColor,
            ),
            child: ExpansionTile(
              title: Row(
                children: [
                  Image.asset("assests/calender.png",
                      height: 30, fit: BoxFit.fill, width: 25)
                ],
              ),
              trailing: const Icon(Icons.keyboard_arrow_down_outlined,
                  size: 24, color: Colors.white),
              children: [
                HorizontalCalendar(
                  date: DateTime.now(),
                  textColor: Colors.black45,
                  backgroundColor: Colors.white,
                  selectedColor: appColor,
                  showMonth: true,
                  onDateSelected: (date) {
                    // print(date.toString());
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Text("Choose Slot", style: GoogleFonts.poppins(textStyle: appTitle)),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Morning Slot';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    decoration: selected == 'Morning Slot'
                        ? BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                        : BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                    child: Text("Morning Slot",
                        style: GoogleFonts.poppins(textStyle: cardTitle))),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Afternoon Slot';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    decoration: selected == 'Afternoon Slot'
                        ? BoxDecoration(
                            color: appColor,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                        : BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                    child: Text("Afternoon Slot",
                        style: GoogleFonts.poppins(textStyle: cardTitle))),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = 'Evening Slot';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  decoration: selected == 'Evening Slot'
                      ? BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(20.0),
                        )
                      : BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                  child: Text("Evening Slot",
                      style: GoogleFonts.poppins(textStyle: cardTitle)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Text("Event Details",
                  style: GoogleFonts.poppins(textStyle: appTitle)),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedEvent = 'Upload a Poster';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    decoration: selectedEvent == 'Upload a Poster'
                        ? BoxDecoration(
                            border: Border.all(color: appColor),
                            color: appColor,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20)))
                        : BoxDecoration(
                            border: Border.all(color: appColor),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                    child: Text("Upload a Poster",
                        style: GoogleFonts.poppins(textStyle: cardSubTitle))),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedEvent = 'Make a Poster';
                  });
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    decoration: selectedEvent == 'Make a Poster'
                        ? BoxDecoration(
                            color: appColor,
                            border: Border.all(color: appColor),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20)))
                        : BoxDecoration(
                            border: Border.all(color: appColor),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20))),
                    child: Text("Make a Poster",
                        style: GoogleFonts.poppins(textStyle: cardSubTitle))),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Event Name",
                  style: GoogleFonts.poppins(textStyle: cardTitle)),
              Text("Gailesro",
                  style: GoogleFonts.poppins(textStyle: cardTitle)),
            ],
          ),
          const Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Artist Name",
                  style: GoogleFonts.poppins(textStyle: cardTitle)),
              Text("Sunny", style: GoogleFonts.poppins(textStyle: cardTitle)),
            ],
          ),
          const Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Formation",
                  style: GoogleFonts.poppins(textStyle: cardTitle)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0), color: appColor),
                child: Row(
                  children: [
                    Text("Trio",
                        style: GoogleFonts.poppins(textStyle: cardTitle)),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Genres", style: GoogleFonts.poppins(textStyle: cardTitle)),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0), color: appColor),
                child: Row(
                  children: [
                    Text("Sufi",
                        style: GoogleFonts.poppins(textStyle: cardTitle)),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0), color: appColor),
                child: Row(
                  children: [
                    Text("Sufi",
                        style: GoogleFonts.poppins(textStyle: cardTitle)),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Start Time",
                  style: GoogleFonts.poppins(textStyle: cardTitle)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0), color: appColor),
                child: Row(
                  children: [
                    Text("8 pm",
                        style: GoogleFonts.poppins(textStyle: cardTitle)),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white),
          Stack(
            children: [
              Image.asset("assests/set.png",
                  fit: BoxFit.fill, height: _height * 0.28, width: _width),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Column(
                    children: [
                      Image.asset("assests/img.png",
                          fit: BoxFit.fill, height: 25),
                      const SizedBox(height: 10.0),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assests/star1.png"),
                            fit: BoxFit.fill,
                          )),
                          child: const Text("Sufi", style: cardTitle)),
                    ],
                  )),
              Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      Text(
                        "Gailesro",
                        style: GoogleFonts.robotoSlab(textStyle: extraBold),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "Trio",
                        style: GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                      ),
                      const SizedBox(height: 5.0),
                      Text("Performance by Sunny",
                          style: GoogleFonts.robotoSlab(textStyle: cardTitle)),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Friday",
                            style:
                                GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "27.03.2023",
                            style:
                                GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "8pm Onwards",
                            style:
                                GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.white, size: 24),
                          const SizedBox(width: 5),
                          Text(
                            "4th Floor, Mall of India, Sector 18, Noida",
                            style: GoogleFonts.poppins(textStyle: cardSubTitle),
                          )
                        ],
                      ),
                    ],
                  )),
              Positioned(
                bottom: 5,
                right: 7,
                child: CircularPercentIndicator(
                  radius: 25.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 5.0,
                  percent: 0.50,
                  center: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      "50%",
                      style: GoogleFonts.poppins(color: appColor, fontSize: 14),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: const Color(0xFF450E10),
                  progressColor: appColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: appBarColor,
                border: Border.all(color: appColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upload Club Poster",
                    style: GoogleFonts.poppins(textStyle: cardTitle)),
                const Icon(Icons.cloud_download_outlined,
                    size: 24, color: appColor),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Stack(
            children: [
              Image.asset("assests/set.png",
                  fit: BoxFit.fill, height: _height * 0.28, width: _width),
              Positioned(
                  top: 5,
                  right: 5,
                  child: Column(
                    children: [
                      Image.asset("assests/img.png",
                          fit: BoxFit.fill, height: 25),
                      const SizedBox(height: 10.0),
                      Container(
                          alignment: Alignment.center,
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assests/star1.png"),
                            fit: BoxFit.fill,
                          )),
                          child: const Text("Sufi", style: cardTitle)),
                    ],
                  )),
              Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      Text(
                        "Gailesro",
                        style: GoogleFonts.robotoSlab(textStyle: extraBold),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        "Trio",
                        style: GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                      ),
                      const SizedBox(height: 5.0),
                      Text("Performance by Sunny",
                          style: GoogleFonts.robotoSlab(textStyle: cardTitle)),
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Friday",
                            style:
                                GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "27.03.2023",
                            style:
                                GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "8pm Onwards",
                            style:
                                GoogleFonts.robotoSlab(textStyle: cardSubTitle),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.white, size: 24),
                          const SizedBox(width: 5),
                          Text(
                            "4th Floor, Mall of India, Sector 18, Noida",
                            style: GoogleFonts.poppins(textStyle: cardSubTitle),
                          )
                        ],
                      ),
                    ],
                  )),
              Positioned(
                bottom: 5,
                right: 7,
                child: CircularPercentIndicator(
                  radius: 25.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 5.0,
                  percent: 0.50,
                  center: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      "50%",
                      style: GoogleFonts.poppins(color: appColor, fontSize: 14),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: const Color(0xFF450E10),
                  progressColor: appColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 15.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: appBarColor,
                border: Border.all(color: appColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Upload MP4/GIF",
                    style: GoogleFonts.poppins(textStyle: cardTitle)),
                const Icon(Icons.cloud_download_outlined,
                    size: 24, color: appColor),
              ],
            ),
          ),
          const SizedBox(height: 15.0),

          /// submit button
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              height: 45.0,
              decoration: boxDecoration(),
              child: Text('Submit',
                  style: GoogleFonts.poppins(textStyle: buttonText)),
            ),
          ),
          const SizedBox(height: 15.0),
          Text("Upcoming Event",
              style: GoogleFonts.poppins(textStyle: appTitle)),
          SizedBox(
            height: _height * 0.45,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5.0),
                    Text("26 March", style: GoogleFonts.poppins(textStyle: cardTitle)),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'Morning Slot';
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              decoration: selected == 'Morning Slot'
                                  ? BoxDecoration(
                                      color: appColor,
                                      borderRadius: BorderRadius.circular(20.0),
                                    )
                                  : BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                              child: Text("Morning Slot",
                                  style: GoogleFonts.poppins(
                                      textStyle: cardTitle))),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'Afternoon Slot';
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              decoration: selected == 'Afternoon Slot'
                                  ? BoxDecoration(
                                      color: appColor,
                                      borderRadius: BorderRadius.circular(20.0),
                                    )
                                  : BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                              child: Text("Afternoon Slot",
                                  style: GoogleFonts.poppins(
                                      textStyle: cardTitle))),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = 'Evening Slot';
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            decoration: selected == 'Evening Slot'
                                ? BoxDecoration(
                                    color: appColor,
                                    borderRadius: BorderRadius.circular(20.0),
                                  )
                                : BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                            child: Text("Evening Slot",
                                style:
                                    GoogleFonts.poppins(textStyle: cardTitle)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Stack(
                      children: [
                        Image.asset(
                          "assests/set.png",
                          fit: BoxFit.fill,
                          height: _height * 0.28,
                          width: _width * 0.80,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.black.withOpacity(0.4),
                          ),
                          height: _height * 0.28,
                          width: _width * 0.80,
                        ),
                        Positioned(
                            top: 5,
                            left: 5,
                            child: Image.asset("assests/img.png",
                                fit: BoxFit.fill, height: 25)),
                        Positioned(
                            right: 5,
                            top: 5,
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 2.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white),
                                child:
                                    const Text("4.5", style: blackSubTitle))),
                        Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 0,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Event",
                                            style: GoogleFonts.robotoSlab(
                                                textStyle: appTitle),
                                          ),
                                          Text(
                                            "Name",
                                            style: GoogleFonts.robotoSlab(
                                                textStyle: extraBold),
                                          ),
                                        ],
                                      ),
                                      Image.asset("assests/singer1.png",
                                          fit: BoxFit.fill,
                                          height: 70,
                                          width: 150),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Friday", style: cardSubTitle),
                                      SizedBox(width: 15),
                                      Text("27.03.2023", style: cardSubTitle),
                                      SizedBox(width: 15),
                                      Text("8Pm Onwards", style: cardSubTitle),
                                    ],
                                  ),
                                  const SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.location_on,
                                          color: Colors.white, size: 24),
                                      const SizedBox(width: 15),
                                      Text(
                                        "4th Floor, Mall of India, Sector 18, Noida",
                                        style: GoogleFonts.poppins(
                                            textStyle: cardSubTitle),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 15.0),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

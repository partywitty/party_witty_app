

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/getBookingList.dart';
import '../Controller/appBarArtist.dart';
import '../Controller/style.dart';

class numberOfBooking extends StatefulWidget {
  const numberOfBooking({Key? key}) : super(key: key);

  @override
  State<numberOfBooking> createState() => _numberOfBookingState();
}

class _numberOfBookingState extends State<numberOfBooking> {

  final _getBookingUpCont = Get.put(GetBookingListApi());
  final double _height = Get.height, _width = Get.width;
  @override
  void initState() {
    _getBookingUpCont.getBookingListApi().then((value){});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191a),
      appBar: Appbars().getArtistAppBar(context: context,title: "Booking List"),
      body: mainWidget(),
    );
  }
  Widget mainWidget(){
    return Obx((){
      if(_getBookingUpCont.isLoading.value){
        return const Center(child: CircularProgressIndicator());
      }else{
        return ListView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          itemCount: _getBookingUpCont.All_Booking_List.length,
          itemBuilder: (context, index) {
            var data = _getBookingUpCont.All_Booking_List[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
              width: _width,
              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: appBarColor
              ),
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(20),
                },
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Booking Date",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.bookDate,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Booking Slot",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.bookSlot == "1" ? "Morning Slot" : data.bookSlot == "2" ? "Afternoon Slot" : "Evening Slot",
                          style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Show Start Time",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.showStartTime,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Show End Time",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.showEndTime,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Sound Check Time",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.soundCheckTime,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Main Course",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.mainCourse == "null" ? "NA" : data.mainCourse,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Starter",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.starter == "null" ? "NA" : data.starter,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Alcoholic Beverages",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.alcoholic == "null" ? "NA" : data.alcoholic,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Non Alcoholic Beverages",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.nonAlcoholic == "null" ? "NA" : data.nonAlcoholic,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Formation",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.formation,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text("Genres",style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 2.0),
                        child: Text(data.genres,style: cardSubTitle, textAlign: TextAlign.start,),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }
    });
  }
}

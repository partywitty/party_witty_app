
// ignore_for_file: camel_case_types
import 'dart:convert';

import 'package:cc_avenue/cc_avenue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/bookingProcesses.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/getBookingDetailsM.dart';


class bookingPolicy extends StatefulWidget {
  const bookingPolicy({Key? key}) : super(key: key);

  @override
  State<bookingPolicy> createState() => _bookingPolicyState();
}

class _bookingPolicyState extends State<bookingPolicy> {

  final double _height = Get.height, _width = Get.width;

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await CcAvenue.cCAvenueInit(
          transUrl: 'https://secure.ccavenue.com/transaction/initTrans',
          accessCode: '4YRUXLSRO20O8NIH',
          amount: '1',
          cancelUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          currencyType: 'INR',
          merchantId: '2',
          orderId: '519',
          redirectUrl: 'http://122.182.6.216/merchant/ccavResponseHandler.jsp',
          rsaKeyUrl: 'https://secure.ccavenue.com/transaction/jsp/GetRSA.jsp'
      );
    } on PlatformException {
      print('PlatformException---------------plat');
    }
  }

  bool check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          FutureBuilder<GetBookingDetailsM>(
            future: ArtistBookingProcess().getBookingDetailsApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData){
                var userData = snapshot.data!.data;
                final genresData = snapshot.data!.data!.genres;
                final genresList = genresData!.split(",");
                for(int i = 0; i< genresList.length; i++) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          width: _width,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: appBarColor
                          ),
                          child: Table(
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(140),
                              1: FixedColumnWidth(20),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Booking Date",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData!.bookDate}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Booking Slot",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(
                                      userData.bookSlot == "1" ?
                                      "Morning Slot" : userData.bookSlot == "2" ?
                                      "Afternoon Slot" : "Evening Slot",
                                      style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Show Start Time",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.showStartTime}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Show End Time",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.showEndTime}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Sound Check Time",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.soundCheckTime}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Pin code",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("452016",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Category",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Vocalist",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Formation",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.formation}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Genres",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.genres}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: _width,
                          padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.blueGrey
                          ),
                          child: Table(
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(140),
                              1: FixedColumnWidth(20),
                            },
                            children: [
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Main Course",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.mainCourse}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Starter",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.starter}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Alcoholic Beverages",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.alcoholicBeverages}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("Non Alcoholic Beverages",style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text(":",  textAlign: TextAlign.start,style: GoogleFonts.poppins(textStyle: cardTitle)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,top: 5.0),
                                    child: Text("${userData.nonAlcoholicBeverages}",style: cardSubTitle, textAlign: TextAlign.start,),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        // const Text("Formation",style: buttonText),
                        // const SizedBox(height: 10),
                        // Container(
                        //     padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                        //     decoration: BoxDecoration(
                        //         color: appColor,
                        //         borderRadius: BorderRadius.circular(5.0)
                        //     ),
                        //     child: Text("${userData.formation}",style: textLabel)),
                        // const SizedBox(height: 20),
                        // const Text("Genres",style: buttonText),
                        // const SizedBox(height: 20),
                        // SizedBox(
                        //   width: _width*0.40,
                        //   child: ListView.builder(
                        //     shrinkWrap: true,
                        //     physics: const ScrollPhysics(),
                        //     itemCount: genresList.length,
                        //     itemBuilder: (context, index) {
                        //       var name = genresList[index];
                        //       return Container(
                        //           alignment: Alignment.center,
                        //           margin: const EdgeInsets.all(10.0),
                        //           padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                        //           decoration: BoxDecoration(
                        //               color: appColor,
                        //               borderRadius: BorderRadius.circular(5.0)
                        //           ),
                        //           child: Text(name,style: textLabel));
                        //     },
                        //   ),
                        // )
                      ],
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ),
          const SizedBox(height: 100,)
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 100,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: const Color(0xFFFE262F),
                  checkColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  value: check,
                  onChanged: (value) {
                    setState(() {
                      check = value!;
                    });
                  },
                ),
                const Text('Service Agreement',style: likes)
              ],
            ),
            GestureDetector(
              onTap: (){
               // CommonToast(context: context, title: 'Artist Booked', alignCenter: false);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const bottomSheet(),));
                //dispatchPayment();
                initPlatformState();
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const bottomSheet(),));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.center,
                height: 40.0,
                decoration: boxDecoration(),
                child: const Text('Conform now', style: buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

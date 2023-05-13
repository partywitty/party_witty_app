
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/style.dart';
import '../Modal/summaryPriceM.dart';

class totalBuget extends StatefulWidget {
  const totalBuget({Key? key}) : super(key: key);

  @override
  State<totalBuget> createState() => _totalBugetState();
}

class _totalBugetState extends State<totalBuget> {

  List<summaryPrice> priceSummaryList = [];

  load(){
    GetArtistList().priceSummaryApi().then((value) => {
      setState((){
        priceSummaryList = value.data!;
      })
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
        itemCount: priceSummaryList.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          var data = priceSummaryList[index];
          return Card(
            color: data.subcategoryName == "solo" ? appBarColor :
            data.subcategoryName == "duo" ?  Colors.blueGrey :
            data.subcategoryName == "Trio" ?  Colors.grey : const Color(0xFF91c2cc),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5.0,),
                  Text("  Formation on stage : ${data.subcategoryName}", style: GoogleFonts.poppins(textStyle: textLabel)),
                  data.venueName == null ?
                  const SizedBox() :
                  Text("   For party : ${data.venueName}",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                  data.intrumentName == null ?
                  const SizedBox() :
                  Text("   Instrument play :  ${data.intrumentName ?? ""}",style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                  Text("   Price : ${data.price}/-", style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                  const SizedBox(height: 5.0,),
                ],
              ),
            ),
          );
        },),
    );
  }
}

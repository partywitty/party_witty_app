
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/artistListApi.dart';
import 'artist_address.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/summaryPriceM.dart';

class budgetSummary extends StatefulWidget {
  const budgetSummary({Key? key}) : super(key: key);

  @override
  State<budgetSummary> createState() => _budgetSummaryState();
}

class _budgetSummaryState extends State<budgetSummary> {

  List<summaryPrice> priceSummaryList = [];

  load(){
    GetArtistList().priceSummaryApi().then((value) => {
      setState((){
        priceSummaryList = value.data!;
      })
    });
  }

  bool checkBox = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back_ios_new,size: 24,color: Colors.white,)),
        title: const Text("Summary of price range", style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(
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
                        const SizedBox():
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
          ),
          const SizedBox(height: 50,)
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
          color: Colors.black,
          height: 50,
          alignment: Alignment.bottomCenter,
          child: Center(
            child: GestureDetector(
              onTap: () {
                Get.to(const artistAddress());
              },
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50.0,
                decoration: boxDecoration(),
                child: Text('Next', style: GoogleFonts.poppins(textStyle: buttonText)),
              ),
            ),
          ),
        ),
    );
  }
}

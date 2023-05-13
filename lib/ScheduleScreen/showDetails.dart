
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class showDetails extends StatefulWidget {
  const showDetails({Key? key}) : super(key: key);

  @override
  State<showDetails> createState() => _showDetailsState();
}

class _showDetailsState extends State<showDetails> {
  final double _height = Get.height, _width = Get.width;

  TextEditingController venueController = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 20.0),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.center,
                width: _width*0.50,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white
                ),
                child: Text('Show details',style: GoogleFonts.poppins(textStyle: blackSubTitle)
                ),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text("Show details to be show on an artist want to perform and check details",style: extraBold),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('reached the venue',style: GoogleFonts.poppins(textStyle: buttonText)
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: venueController,
            style: textFill,
            readOnly: true,
            decoration: inputDecoration(
              context,
              hint: "open the scanner"
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('Sound check',style: GoogleFonts.poppins(textStyle: buttonText)
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            controller: venueController,
            style: textFill,
            readOnly: true,
            decoration: inputDecoration(
                context,
                hint: "Motion the time for time check"
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: _width*0.40,
                child: TextFormField(
                  controller: venueController,
                  style: textFill,
                  readOnly: true,
                  decoration: inputDecoration(
                      context,
                      hint: "notification"
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('Otp',style: GoogleFonts.poppins(textStyle: buttonText)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

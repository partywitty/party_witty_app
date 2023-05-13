

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class currentLocation extends StatefulWidget {
  const currentLocation({Key? key}) : super(key: key);

  @override
  State<currentLocation> createState() => _currentLocationState();
}

class _currentLocationState extends State<currentLocation> {

  TextEditingController cityController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: appColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.my_location,size: 24,color: Colors.white,),
                  const SizedBox(width: 10,),
                  Text("Use my Current Location",style: GoogleFonts.poppins(textStyle: bigTitle),)
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter city';
                }
                return null;
              },
              controller: cityController,
              style: textFill,
              decoration: inputDecoration(context,
              prefixIcon: const Icon(Icons.search,color: Colors.white,size: 18,),
                suffixIcon: const Icon(Icons.mic,size: 18,color: appColor,),
                hint: "Type a city to find your location"
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
               decoration: BoxDecoration(
                 color: drawerColor,
                 borderRadius: BorderRadius.circular(5.0),
               ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Popular cities",style: cardTitle),
                  SizedBox(height: 20.0),
                  Text("New Delhi",style: cardTitle),
                  Divider(color: Colors.grey),
                  Text("Gurgaon",style: cardTitle),
                  Divider(color: Colors.grey),
                  Text("Noida",style: cardTitle),
                  Divider(color: Colors.grey),
                  Text("Bengaluru",style: cardTitle),
                  Divider(color: Colors.grey),
                  Text("Kolkata",style: cardTitle),
                  Divider(color: Colors.grey),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

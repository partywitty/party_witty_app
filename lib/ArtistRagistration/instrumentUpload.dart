
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/music_type.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class instrumentUpload extends StatefulWidget {
  const instrumentUpload({Key? key}) : super(key: key);

  @override
  State<instrumentUpload> createState() => _instrumentUploadState();
}

class _instrumentUploadState extends State<instrumentUpload> {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Selected Instrument", style: GoogleFonts.poppins(textStyle: appBarText)),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 24)),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children:  [
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 40),
            child: Text("Solo", style: signUpTitle),
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter full name';
              }
              return null;
            },
            controller: nameController,
            style: textFill,
            decoration: inputDecoration(context),
          ),

          const SizedBox(height: 10.0),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 40),
            child: Text("Private", style: signUpTitle),
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter full name';
              }
              return null;
            },
            controller: nameController,
            style: textFill,
            decoration: inputDecoration(context),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: Colors.black,
        height: 60,
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Music_type(),));
          //  Navigator.pushNamed(context, '/upload_band');
          },
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: boxDecoration(),
            child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)
            ),
          ),
        ),
      ),
    );
  }
}

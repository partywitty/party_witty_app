import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Offer_tile extends StatefulWidget {
  const Offer_tile({Key? key}) : super(key: key);

  @override
  State<Offer_tile> createState() => Offer_tileState();
}

class Offer_tileState extends State<Offer_tile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon:Icon(Icons.arrow_back_ios) ,),
      ),
      body: Column(
        children: [
       Padding(
         padding: const EdgeInsets.all(20.0),
         child: TextFormField(
           maxLines: 7,

           decoration: InputDecoration(
             hintText: 'Write...',
             hintStyle: TextStyle(color: Colors.black26,fontSize: 12),
             filled: true,
             fillColor: Color(0xFF807E7E),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(4),
               // borderSide: BorderSide(color: Colors.red)
             )
           ),
         ),
       ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/venue_music');
                      },
                  child: Container(
                    width: 140,
                    height: 50.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset(0.1, 0.1),
                        end: FractionalOffset(0.7, 0.1),
                        colors: [
                          Color(0xFFFE262F),
                          Color(0xFFFD2F71),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Center(
                      child: Text('Create Offer',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white)),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

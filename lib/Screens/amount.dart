import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Amount extends StatefulWidget {
  const Amount({Key? key}) : super(key: key);

  @override
  State<Amount> createState() => _AmountState();
}

class _AmountState extends State<Amount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left:33.0,top:23),
          child: IconButton(
            onPressed: ( ){
              Navigator.pop(context);
            },
            icon:Icon(Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),
          ),),
        Padding(
          padding: const EdgeInsets.only(left:60,top:15),
          child: Text(
              "Amount",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.white,)
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 42.0,right: 43),
          child: TextFormField(

            autofocus: true,
            style: TextStyle(
                fontSize: 15.0, color: Color(0xFFbdc6cf)),
            decoration: InputDecoration(
              hintText: '₹ 5000/-',
              hintStyle:GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.white,),
              fillColor:Color(0xFF434445),
              filled: true,
              contentPadding: const EdgeInsets.only(
                  left: 25.0, bottom: 12.0, top: 0.0),
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Color(0xFF434445)),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Color(0xFF434445)),
                borderRadius: BorderRadius.circular(25.7),
              ),
            ),
          ),
        ),
        SizedBox(height: 60,),
        Center(
          child: Container(
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/about_page');
                },
                child: Container(
                  width: 140,
                  height: 50.0,
                  decoration: BoxDecoration(

                    gradient: LinearGradient(
                      begin: FractionalOffset(0.1, 0.1),
                      end: FractionalOffset(0.7, 0.1),
                      colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ), ),
                ),
              )
          ),
        ),
      ],)
      ,
    );
  }
}

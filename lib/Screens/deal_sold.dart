import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Dealsold extends StatefulWidget {

  @override
  State<Dealsold> createState() => DealsoldState();
}

class DealsoldState extends State<Dealsold> {


  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:  Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: IconButton(onPressed: (){}, icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),),
        ),
        centerTitle:true,title: Text("Deal Sold",  style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.white,),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 28, left: 30,
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              color: Color(0xFF1F1E2E),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0,bottom: 10,top: 10),
                                child: Row(
                                  children: [
                                    Column( mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('32',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w200, fontSize: 18, color: Colors.white)),
                                        Text('Dec',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w200, fontSize: 18, color: Colors.white)),
                                        Text('2022',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w200, fontSize: 18, color: Colors.white))
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width: 1,
                                      height: 100,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width:width*0.6,
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('New Year Deal',style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                                                Container(
                                                  padding: EdgeInsets.only(left: 6,right: 4),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(color: Colors.green),
                                                      borderRadius: BorderRadius.circular(2)
                                                  ),
                                                  child: Text('Claimed',style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w400, fontSize: 8, color: Colors.green)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      'Couple :',
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                  ),
                                                  Text(
                                                      'Stag :',
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                  ),
                                                  Text(
                                                      'Kids :',
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                  ),

                                                ],
                                              ),
                                              // SizedBox(width: 30,),
                                              SizedBox(width: 20,),
                                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      '2',
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                  ),
                                                  Text(
                                                      '2',
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                  ),
                                                  Text('1',
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),
                                          Text('8pm Onwards',style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400, fontSize: 10, color: Colors.green)),
                                          Container(
                                            width:width*0.6,
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('purchased by Adwerd Shwn',style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400, fontSize: 9, color: Colors.white)),
                                                Container(
                                                  padding: EdgeInsets.only(left: 8,right: 4,top: 2,bottom: 2),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xFF494855),
                                                      borderRadius: BorderRadius.circular(2)
                                                  ),
                                                  child: Text('₹5000/-',style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }))),
        ],),
      ),
    );
  }

}

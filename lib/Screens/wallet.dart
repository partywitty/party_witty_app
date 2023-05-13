
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/style.dart';

class Wallet_page extends StatefulWidget {
  const Wallet_page({Key? key}) : super(key: key);

  @override
  State<Wallet_page> createState() => _Wallet_pageState();
}

class _Wallet_pageState extends State<Wallet_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Wallet",style: GoogleFonts.poppins(textStyle: appBarText),),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 10.0),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/amount');
            },
            child: Container(
              height: 65,
              width: 285,
              decoration: BoxDecoration(
                  color: const Color(0xFF444546),
                  borderRadius: BorderRadius.circular(9)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      "Balance",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,)
                  ),
                  const SizedBox(width: 20,),
                  Row(
                    children: [
                      Text(
                          "₹",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,)
                      ),
                      Text(
                          "5000/-",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF444546),
                borderRadius: BorderRadius.circular(9)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 6),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                            "History",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white,)
                        ),
                        const SizedBox(width: 25,),
                        Container(
                          padding: const EdgeInsets.only(left: 2,),
                          width: 111,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                            child: Text(
                                "Request withdrawal",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 9,
                                  color: Colors.white,)
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "For event in Hotel",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11,
                                  color: Colors.white,)
                            ),
                            const SizedBox(height: 5,),
                            Text(
                                " 30-02-2022  05:30 PM  ",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 9,
                                  color: Colors.white60,)
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Row(
                          children: [
                            Text(
                                "+ ₹",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.green,)
                            ),
                            Text(
                                " 5000/-",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.green,)
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Container(width: double.infinity,
                      height: 1,color: Colors.grey,),
                  ),
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Withdrawal",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 11,
                                  color: Colors.white,)
                            ),
                            const SizedBox(height: 5,),
                            Text(" 30-02-2022  05:30 PM  ",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 9,
                                  color: Colors.white60,)
                            ),
                          ],
                        ),
                        const SizedBox(width: 20,),
                        Row(
                          children: [
                            Text(
                                "- ₹",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.red,)
                            ),
                            Text(
                                " 500/-",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.red,)
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: (){
              launch('tel:+918299619469');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(" Help",style: cardSubTitle),
                  const SizedBox(
                      height: 25,
                      child: VerticalDivider(width: 20,color: Colors.white,)),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: const Icon(Icons.support_agent_sharp,color: Colors.white,size: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

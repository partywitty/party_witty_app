
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_app/Club/EditManagement.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class dealManagment extends StatefulWidget {
  const dealManagment({Key? key}) : super(key: key);

  @override
  State<dealManagment> createState() => _dealManagmentState();
}

class _dealManagmentState extends State<dealManagment> {

  final double _height = Get.height, _width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Deals Management",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          SizedBox(
            width: _width,
            height: _height*0.20,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: drawerColor,
                    radius: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assests/dPizza.png",fit: BoxFit.fill,height: 30),
                            const SizedBox(width: 5.0),
                            Image.asset("assests/dWine.png",fit: BoxFit.fill),
                          ],
                        ),
                        Text("Club\nDeals",style: GoogleFonts.poppins(textStyle: cardTitle),)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: drawerColor,
                    radius: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assests/dMeal.png",fit: BoxFit.fill,height: 30),
                        Text("Restaurant\nDeals",style: GoogleFonts.poppins(textStyle: cardTitle),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: drawerColor,
                    radius: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assests/dWhiskey.png",fit: BoxFit.fill,height: 30),
                        Text("Full Bottles\nDeals",style: GoogleFonts.poppins(textStyle: cardTitle),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: CircleAvatar(
                    backgroundColor: drawerColor,
                    radius: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assests/dSnacks.png",fit: BoxFit.fill,height: 30),
                        Text("Jump Start\nMenus",style: GoogleFonts.poppins(textStyle: cardTitle),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: _width*0.40,
                  height: _height*0.065,
                  decoration: boxDecorationSquare(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_downward_sharp,color: Colors.white,size: 18,),
                      const Icon(Icons.arrow_upward,color: Colors.white,size: 18),
                      const SizedBox(width: 10.0),
                      Text('Sort', style: GoogleFonts.poppins(textStyle: buttonText))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: _width*0.40,
                  height: _height*0.065,
                  decoration: boxDecorationSquare(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.filter_list_outlined,color: Colors.white,size: 18),
                      const SizedBox(width: 10.0),
                      Text('Filter', style: GoogleFonts.poppins(textStyle: buttonText))
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height : 10.0),
          Text('Existing Deals', style: GoogleFonts.poppins(textStyle: bigTitle)),
          const SizedBox(height : 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            decoration: BoxDecoration(
              color: drawerColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: _width*0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("188 Bought",style: GoogleFonts.poppins(textStyle: grayText)),
                      Text("4IMFL(30ml)/4 BEAR +1 Starter/Pint",style: GoogleFonts.poppins(textStyle: textLabel)),
                      Text('Free Cancellation', style: GoogleFonts.poppins(textStyle: greenText)),
                      Text('Valid on   All Days', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                      Row(
                        children: [
                          Text('Timing     12:00 PM', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                          const SizedBox(width: 5.0,),
                          const Icon(Icons.arrow_drop_down_circle_outlined,size: 24,color: cardButtonColor,)
                        ],
                      ),
                      Text('Valid        2 people', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: cardButtonColor),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text("Inclusions",style: GoogleFonts.poppins(textStyle: blueText)),
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: cardButtonColor),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text("Details",style: GoogleFonts.poppins(textStyle: blueText)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                           onTap: (){
                             Get.to(const editManagement());
                           },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: exitColor,
                            child: Image.asset("assests/eFluent.png",fit: BoxFit.fill,height: 20),
                          ),
                        ),
                        const SizedBox(width: 3.0,),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          child: Image.asset("assests/eSetting.png",fit: BoxFit.fill,height: 20),
                        ),
                        const SizedBox(width: 3.0,),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 15,
                          child: Image.asset("assests/eTrash.png",fit: BoxFit.fill,height: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60,),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: _width*0.30,
                        height: _height*0.05,
                        decoration: boxDecorationSquare(),
                        child: Text('Current Price', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                      ),
                    ),
                    Text("₹ 4500/-",style: GoogleFonts.poppins(textStyle: bigTitle)),
                    Text("Inc. of all taxes",style: GoogleFonts.poppins(textStyle: grayText)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height : 20.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            decoration: BoxDecoration(
              color: drawerColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: _width*0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("188 Bought",style: GoogleFonts.poppins(textStyle: grayText)),
                      Text("6IMFL(30ml)/4 BEAR +1 Starter/Pint",style: GoogleFonts.poppins(textStyle: textLabel)),
                      Text('Free Cancellation', style: GoogleFonts.poppins(textStyle: greenText)),
                      Text('Valid on   All Days', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                      Row(
                        children: [
                          Text('Timing     12:00 PM', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                          const SizedBox(width: 5.0,),
                          const Icon(Icons.arrow_drop_down_circle_outlined,size: 24,color: cardButtonColor,)
                        ],
                      ),
                      Text('Valid        2 people', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: cardButtonColor),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text("Inclusions",style: GoogleFonts.poppins(textStyle: blueText)),
                          ),
                          const SizedBox(width: 10.0),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: cardButtonColor),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text("Details",style: GoogleFonts.poppins(textStyle: blueText)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: exitColor,
                          radius: 15,
                          child: Image.asset("assests/eFluent.png",fit: BoxFit.fill,height: 20),
                        ),
                        const SizedBox(width: 3.0,),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          child: Image.asset("assests/eSetting.png",fit: BoxFit.fill,height: 20),
                        ),
                        const SizedBox(width: 3.0,),
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 15,
                          child: Image.asset("assests/eTrash.png",fit: BoxFit.fill,height: 20),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60,),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: _width*0.30,
                        height: _height*0.05,
                        decoration: boxDecorationSquare(),
                        child: Text('Current Price', style: GoogleFonts.poppins(textStyle: cardSubTitle)),
                      ),
                    ),
                    Text("₹ 4500/-",style: GoogleFonts.poppins(textStyle: bigTitle)),
                    Text("Inc. of all taxes",style: GoogleFonts.poppins(textStyle: grayText)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height : 20.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: _width*0.30,
              height: _height*0.06,
              decoration: boxDecoration(),
              child: Text('Add New Deal', style: GoogleFonts.poppins(textStyle: buttonText)),
            ),
          ),
          const SizedBox(height : 20.0),
        ],
      ),
    );
  }
}

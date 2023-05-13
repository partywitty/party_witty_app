

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistScreen/priceManage.dart';
import 'package:flutter_app/ArtistScreen/primary.dart';
import 'package:flutter_app/ArtistScreen/primaryAddress.dart';
import 'package:flutter_app/ArtistScreen/primaryLocation.dart';
import 'package:flutter_app/ArtistScreen/profileBank.dart';
import 'package:flutter_app/ArtistScreen/profileInstrument.dart';
import 'package:flutter_app/ArtistScreen/streamPlafrom.dart';
import 'package:flutter_app/ArtistScreen/totalBudget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/style.dart';
import 'artistChannel.dart';
import 'managerEdit.dart';
import 'otherDetalis.dart';

class artistProfile extends StatefulWidget {
  const artistProfile({Key? key}) : super(key: key);

  @override
  State<artistProfile> createState() => _artistProfileState();
}

class _artistProfileState extends State<artistProfile> with SingleTickerProviderStateMixin {

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 10);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Profile",style: GoogleFonts.poppins(textStyle: appBarText)),
        actions: [
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            onTap: (){
              launch('tel:+918299619469');
            },
            child: Container(
              height: 25,
              margin: const EdgeInsets.all(10.0),
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            // color: Colors.black12,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            height: 40,
            child: TabBar(
              labelColor: Colors.white,
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 0.0,
              indicatorColor: Colors.grey,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 5.0),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                // border: Border.all(color: tabBorderColor),
                color: appColor,
              ),
              tabs: <Widget>[
                Tab(
                  child:Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: appColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text('Primary Details', style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Artist Profile",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("My Channel",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                // Tab(
                //   child:Container(
                //       padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: appColor),
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       child: const Text("Manage Price",
                //           style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                //   ),
                // ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Location",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Address",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Bank Details",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Budget Summary",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Other Details",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Streams",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text("Manager",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                primaryDetails(),
                profileInstrument(),
                artistChannel(),
                //managePrice(),
                primaryLocation(),
                primaryAddress(),
                artistBank(),
                totalBuget(),
                otherDetails(),
                streamPlatforms(),
                managerEdits()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

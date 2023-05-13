import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:flutter_app/Modal/eventM.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ApiServices/eventApi.dart';
import 'bottomSheet.dart';


class Event_page extends StatefulWidget {
  const Event_page({Key? key}) : super(key: key);

  @override
  State<Event_page> createState() => _Event_pageState();
}

class _Event_pageState extends State<Event_page> {
  @override
  void initState() {
    load();

    super.initState();
  }
  List <EventData> getevent=[];
  bool loader=false;
  var ic;
  load(){
    Getevent_api().getevent_api(ic).then((value) {
      setState(() {
        setState(() {
          getevent=value.data!;
          loader=true;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => bottomSheet()),(route)=> false);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading:  IconButton(onPressed: (){}, icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),),
          centerTitle:true,title: Text("Event",  style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/create_event');
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFfFD2E6E)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Create Event +",  style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Colors.white)),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body:SingleChildScrollView(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 30, left: 40,
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      reverse: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: getevent.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(color: Color(0xFF1F1E2E),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Center(
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 120,
                                                width: 80,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image.network('${
                                                      Api_link.imageUrl + getevent[index].photo.toString()}',
                                                    fit: BoxFit.fill,
                                                    height: 120,
                                                    width: 80,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(5.0),
                                                child:Container(
                                                  width: 26,
                                                  height: 28,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white38,
                                                      borderRadius: BorderRadius.circular(5)),
                                                  child: Padding(padding: const EdgeInsets.only(top: 2.0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "30",
                                                          style: TextStyle(color: Colors.white,fontSize: 8),
                                                        ),
                                                        Text("feb",
                                                          style: TextStyle(color: Colors.white, fontSize: 8),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(top: 1, left: 10, bottom: 0),
                                          child: Container(
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Colifornia party:2022",
                                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(height: 2,),
                                                  Container(
                                                    height: 20,
                                                    child: Row(children: [
                                                      Container(
                                                        width: 20,
                                                        height: 18,
                                                        child: Image.asset(
                                                          'assests/clock.png', scale: 3.9, height: 10,
                                                        ),
                                                      ),
                                                      SizedBox(width: 2,
                                                      ),
                                                      Text(
                                                          '12 PM_4 PM, 7 PM-11PM',
                                                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)
                                                      ),
                                                    ]),
                                                  ),
                                                  Container(
                                                    height: 20,
                                                    child: Row(children: [
                                                      Container(
                                                        width: 20,
                                                        height: 18,
                                                        child: Icon(Icons.person,color: Colors.white,size: 20,),
                                                      ),
                                                      SizedBox(width: 2,
                                                      ),
                                                      Text(
                                                          getevent[index].artistName.toString(),
                                                          style: GoogleFonts.poppins(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 10,
                                                              color: Colors.white)
                                                      ),
                                                    ]),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 5.0),
                                                    child: Container(
                                                      width: 140,
                                                      padding: EdgeInsets.only(right: 0),
                                                      child:  Text(
                                                          'It is a long established fact that a reader will be distracteby the readable content',
                                                          textScaleFactor: 1.1,
                                                          softWrap: true,
                                                          overflow: TextOverflow.clip,
                                                          textAlign:TextAlign.justify,
                                                          style: GoogleFonts.poppins(
                                                              fontWeight: FontWeight.w400,
                                                              fontSize: 8,
                                                              color: Colors.white)
                                                      ),
                                                    ),
                                                  ),

                                                  Padding(
                                                    padding:
                                                    const EdgeInsets.only(),
                                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Row(
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets.all(1),
                                                                child:
                                                                Image.asset('assests/map2.png', scale: 2.5, fit: BoxFit.cover, color: Colors.white,
                                                                ),
                                                              ),
                                                              SizedBox(width: 6,),
                                                              Text(
                                                                'Colifornia,CA',
                                                                overflow: TextOverflow.ellipsis,
                                                                style: TextStyle(color: Colors.white,fontSize: 10),
                                                              ),
                                                            ]),
                                                        SizedBox(width: 25,),
                                                        Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Container(
                                                            alignment: Alignment.center,
                                                            height: 26,
                                                            width: 66,
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5),
                                                                color: Colors.white30
                                                            ),
                                                            child: Text(
                                                              '${getevent[index].entryFees.toString()}/-',
                                                              style: TextStyle(color: Colors.white,fontSize: 10),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]),
                                          )),
                                    ],
                                  ),
                                )),
                          ),
                        );
                      }))),),
      ),
    );
  }
}
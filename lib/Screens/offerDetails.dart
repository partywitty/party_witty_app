import 'package:flutter/material.dart';
import 'package:flutter_app/Modal/offerM.dart';
import 'package:flutter_app/Modal/singleofferdetailsM.dart';
import 'package:flutter_app/Screens/DealTabBar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ApiServices/offerApi.dart';
import 'bottomSheet.dart';
class Offer_detail extends StatefulWidget {
  const Offer_detail({Key? key}) : super(key: key);

  @override
  State<Offer_detail> createState() => Offer_detailState();
}
class Offer_detailState extends State<Offer_detail> {

  @override
  void initState() {
    load();
    super.initState();
  }
  Detailsdata detailsdata=Detailsdata();
  List<offerData> offerlist=[];
  List<Detailsdata> details=[];
  load(){
    Offer_Api().Offer_api().then((value){
      setState(() {
        offerlist=value.data!;
      });
    });
  }

  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => bottomSheet()));
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading:  Padding(
            padding: const EdgeInsets.only(left:15),
            child: IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => bottomSheet()));
            }, icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20,
            ),),
          ),
          centerTitle:true,title: Text("Offer",  style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white)),
          // actions: [
          //   Row(
          //     children: [
          //       InkWell(
          //         onTap: (){
          //           Navigator.pushNamed(context,'/create_offer');
          //         },
          //         child: Container(
          //           width: 110,
          //           height: 30,
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(4),
          //               color: Color(0xFfFD2E6E)
          //           ),
          //           child: Align(
          //             alignment: Alignment.center,
          //             child: Text("Create offer +",  style: GoogleFonts.poppins(
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 10,
          //                 color: Colors.white)),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ],
        ),
        body:SingleChildScrollView(
            child:      Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 45.0,right: 44),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Offers Tile',
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)
                      ),
                      Text('View more',
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.red)
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 30, left: 30,
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: offerlist.length,
                        itemBuilder: (context, index) {
                          // var discont=int.parse(offerlist[index].stageMrp.toString()) - int.parse(offerlist[index].stageSell.toString())/int.parse(offerlist[index].stageMrp.toString())*100;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>DealSoldTabbar( club_id: offerlist[index].id.toString(),)));
                                print(offerlist[index].id.toString());
                              },
                              child: Container(
                                  decoration: BoxDecoration(color: Color(0xFF1F1E2E),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(9),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width:140,
                                              child: Text(offerlist[index].offerName.toString(),
                                                  overflow: TextOverflow.clip,
                                                  softWrap: true,
                                                  textScaleFactor: 1.1,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w500,
                                                      fontSize: 12,
                                                      color: Colors.white)
                                              ),
                                            ),
                                            Container(
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    height:15,
                                                    padding: EdgeInsets.only(left: 7,right: 5,),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(3),
                                                        border: Border.all(color: Colors.green)
                                                    ),
                                                    child:
                                                    Text(
                                                        '56% OFF',
                                                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                    ),),
                                                  SizedBox(height: 6,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                            '₹ ${offerlist[index].stageMrp.toString()}/-',
                                                            style: TextStyle(
                                                                decoration: TextDecoration.lineThrough,
                                                                decorationThickness: 2.3,
                                                                decorationColor: Colors.white60,
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: 8,
                                                                color: Colors.white54)
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                          '₹',
                                                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 9, color: Colors.white)
                                                      ),
                                                      Text(
                                                          '${offerlist[index].stageSell.toString()}/-',
                                                          style: TextStyle(
                                                              fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 3,),
                                                  Text('Inc.of all taxes',
                                                      overflow: TextOverflow.clip,
                                                      softWrap: true,
                                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white54)
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            'Free Cancellation',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            textScaleFactor: 1.1,
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.green)
                                        ),
                                        SizedBox(height: 8,),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'Valid on',
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                ),
                                                Text(
                                                    'Date',
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                ),
                                                Text(
                                                    'Timming',
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                ),
                                                Text(
                                                    'Valid for',
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400, fontSize:8, color: Colors.white)
                                                ),
                                              ],
                                            ),
                                            // SizedBox(width: 30,),
                                            SizedBox(width: 25,),
                                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    offerlist[index].days.toString(),
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,
                                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        offerlist[index].startDate.toString(),
                                                        overflow: TextOverflow.clip,
                                                        softWrap: true,
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                    ),
                                                    Text(' | ',
                                                        overflow: TextOverflow.clip,
                                                        softWrap: true,
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                    ),
                                                    Text(
                                                        offerlist[index].endDate.toString(),
                                                        overflow: TextOverflow.clip,
                                                        softWrap: true,
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        offerlist[index].startTime.toString(),
                                                        overflow: TextOverflow.clip,
                                                        softWrap: true,

                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 8,
                                                            color: Colors.white)
                                                    ),
                                                    Text('-',
                                                        overflow: TextOverflow.clip,
                                                        softWrap: true,

                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 8,
                                                            color: Colors.white)
                                                    ),
                                                    Text(
                                                        offerlist[index].endTime.toString(),
                                                        overflow: TextOverflow.clip,
                                                        softWrap: true,

                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 8,
                                                            color: Colors.white)
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                    offerlist[index].endDate.toString(),
                                                    overflow: TextOverflow.clip,
                                                    softWrap: true,

                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 8,
                                                        color: Colors.white)
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 30,
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap:(){
                                                    setState(() {
                                                      isLoading=false;
                                                      Offer_Api().Detail_Api( offerlist[index].id.toString(),).then((value) {
                                                        setState(() {
                                                          detailsdata = value.data!;
                                                          isLoading=true;
                                                          showDialog(
                                                              context: context,
                                                              builder: (BuildContext context) => _buildPopupDialog(context));
                                                        });
                                                      });
                                                    });

                                                  },
                                                  child: Container(
                                                    height:15,
                                                    padding: EdgeInsets.only(left: 7,right: 6,),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(3),
                                                        border: Border.all(color: Colors.blue)
                                                    ),
                                                    child:
                                                    Text(
                                                        'Details',
                                                        style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 8,
                                                            color: Colors.blue)
                                                    ),),
                                                ),
                                                SizedBox(width: 8,),
                                                Container(
                                                  height:15,
                                                  padding: EdgeInsets.only(left: 8,right: 6,),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(3),
                                                      border: Border.all(color: Colors.red)
                                                  ),
                                                  child:
                                                  Text(
                                                      'Menu',
                                                      style: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 8,
                                                          color: Colors.red)
                                                  ),),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )),),
                          );
                        })),
              ],
            )),
      ),
    );
  }
  Widget _buildPopupDialog(BuildContext context,) {
    return  AlertDialog(
      title: Text('Details'),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Free Cancellation'),
          SizedBox(height: 10,),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Valid On',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 11, color: Colors.black)
                  ),
                  Text(
                      'Date',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 11, color: Colors.black)
                  ),
                  Text(
                      'Timing',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: 11, color: Colors.black)
                  ),
                  Text(
                      'Valid For',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize:11, color: Colors.black)
                  ),
                  Text(
                      'Deal Type',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize:11, color: Colors.black)
                  ),
                  Text(
                      'Offer Price',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize:11, color: Colors.black)
                  ),
                ],
              ),
              // SizedBox(width: 30,),
              SizedBox(width: 18,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      detailsdata.validOn.toString(),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                  ),
                  Row(
                    children: [
                      Text(
                          detailsdata.startDate.toString(),
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                      ),
                      Text(' | ',
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                      ),
                      Text(
                          detailsdata.endDate.toString(),
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                          detailsdata.startTime.toString(),
                          overflow: TextOverflow.clip,
                          softWrap: true,

                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                      ),
                      Text('-',
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                      ),
                      Text(
                          detailsdata.endTime.toString(),
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                      ),
                    ],
                  ),
                  Text(
                      detailsdata.allowPersons.toString(),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                  ), Text(
                      detailsdata.dealType.toString(),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                  ),Text(
                      detailsdata.offerPrice.toString(),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.black)
                  ),
                ],
              ),
            ],
          ),

          // Text(
          //     detailsdata.id.toString()),
        ],
      ),

    );
  }
}
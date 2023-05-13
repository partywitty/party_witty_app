// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/appBarArtist.dart';
import '../Controller/imageView.dart';
import '../Modal/requestM.dart';
import '../Controller/style.dart';

class Artist_request extends StatefulWidget {
  const Artist_request({Key? key}) : super(key: key);

  @override
  State<Artist_request> createState() => _Artist_requestState();
}

class _Artist_requestState extends State<Artist_request> {

  List<Requests> totalRequest = [];

  bool loader = false;
  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
  }
  load(){
    GetArtistList().requestListApi().then((value) {
      setState(() {
        loader = true;
        totalRequest = value.data!.requests!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Appbars().getArtistAppBar(context: context,title: ""),
      body: loader == false ?
      const Center(child: CircularProgressIndicator()) :
      totalRequest.isEmpty ?
      const Center(child: Text("Request not found",style: appBarText,)) :
      ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        itemCount: totalRequest.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          var data = totalRequest[index];
          return Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(color: appColor),
            ),
            child: ListTile(
              leading:InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => imageDetial(url: ""),));
                },
                child: OctoImage.fromSet(
                  height: 55,
                    width: 55,
                    fit: BoxFit.fill,
                    image: NetworkImage("${Api_link.imageUrl}${data.userProfile}"),
                    octoSet: OctoSet.circleAvatar(
                        backgroundColor: appColor,
                        text: Text(data.username![0].split("").last.toUpperCase())
                    )
                ),
              ),
              title:Text("${data.username}",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w400,fontSize:15, color: Colors.white)
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gender : Male",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize:13, color: Colors.white)
                  ),
                  data.status == "1" ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: greenButton
                        ),
                        child: Text("Accepted",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize:13, color: Colors.white)
                        ),
                      )
                    ],
                  ) :
                  data.status == "2" ?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: redButton
                        ),
                        child: Text("Rejected",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize:13, color: Colors.white)
                        ),
                      )
                    ],
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          GetArtistList().acceptRequest(
                              recieverId: data.requestBy.toString(),
                              status: "1",
                              context: context).then((value) {
                            load();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: greenButton
                          ),
                          child: Text("Accept",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize:13, color: Colors.white)
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      InkWell(
                        onTap: (){
                          GetArtistList().acceptRequest(
                              recieverId: "${data.requestBy}",
                              status: "2",
                              context: context).then((value) {
                            load();
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: redButton
                          ),
                          child: Text("Denied",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w300, fontSize:13, color: Colors.white)
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },),
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

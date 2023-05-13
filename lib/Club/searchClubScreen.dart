

// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/style.dart';
import '../Controller/utils.dart';

class searchClub extends StatefulWidget {
  const searchClub({Key? key}) : super(key: key);

  @override
  State<searchClub> createState() => _searchClubState();
}

class _searchClubState extends State<searchClub> {

  TextEditingController clubController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            const SizedBox(height: 20.0),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter city';
                }
                return null;
              },
              controller: clubController,
              style: textFill,
              decoration: inputDecoration(context,
                  prefixIcon: const Icon(Icons.search,color: Colors.white,size: 18,),
                  suffixIcon: const Icon(Icons.mic,size: 18,color: appColor,),
                  hint: "Search Clubs, locations or cuisines"
              ),
            ),
            const SizedBox(height: 20.0),
            Text("Top searched clubs",style: GoogleFonts.poppins(textStyle: textLabel)),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 300,
              child: GridView.builder(
                itemCount : 10,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2.5 / 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
               //   var data = searchArtist[index];
                  return InkWell(
                    onTap: (){
                      setState(() {
                        // selectedBox = true;
                        // artistSelect = data.name;
                        // artistId = data.id;
                        // subcategoryId = data.subcategory;
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        decoration: BoxDecoration(
                            color: drawerColor,
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.arrow_upward,color: Colors.white,size: 16),
                            Text("Stounge", style: textFill,textAlign: TextAlign.center,)
                          ],
                        )
                    ),
                  );
                },),
            ),

            const SizedBox(height: 20.0),
            Text("Most booked restaurants",style: GoogleFonts.poppins(textStyle: textLabel),),

            SizedBox(
              height: height/3,
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset("assests/party_img.png",fit: BoxFit.fill,height: height/5,width: 200),
                          ),
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Column(
                                children: [
                                  Text("40%",style:  bigTitle),
                                  Text("OFF",style:  extraBold),
                                ],
                              )
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 2.0),
                              child: const Text("4.5",style: blackSubTitle,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text("Castle Barbeque",style: GoogleFonts.poppins(textStyle: textLabel),),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset("assests/restra_img.png",fit: BoxFit.fill,height: height/5,width: 200),
                          ),
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Column(
                                children: [
                                  Text("40%",style:  bigTitle),
                                  Text("OFF",style:  extraBold),
                                ],
                              )
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 2.0),
                              child: const Text("4.5",style: blackSubTitle,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text("Castle Barbeque",style: GoogleFonts.poppins(textStyle: textLabel),),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset("assests/dance.png",fit: BoxFit.fill,height: height/5,width: 200),
                          ),
                          Positioned(
                              top: 5,
                              left: 5,
                              child: Column(
                                children: [
                                  Text("40%",style:  bigTitle),
                                  Text("OFF",style:  extraBold),
                                ],
                              )
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 2.0),
                              child: const Text("4.5",style: blackSubTitle,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text("Castle Barbeque",style: GoogleFonts.poppins(textStyle: textLabel),),
                    ],
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/youPlay.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/utils.dart';
import '../Modal/venueM.dart';

class Venue_music extends StatefulWidget {
  const Venue_music({Key? key}) : super(key: key);

  @override
  State<Venue_music> createState() => _Venue_musicState();
}

class _Venue_musicState extends State<Venue_music> {

  bool onSelect = false;

  List<venueData> friends = [];
  List<venueData> _selectedAnimals2 = [];
  List<SelectedVenue> selectedList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load(){
    GetArtistList().venueApi().then((value) {
      setState(() {
        friends =value.data!.genres!;
      });
    });
    GetArtistList().venueApi().then((value) {
      setState(() {
        selectedList =  value.data!.selected!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: 500,
                      child: Image.asset(
                        'assests/A_img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Text(" Event you Wish to Perform At?",style: GoogleFonts.poppins(textStyle: textLabel)),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF434445),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: MultiSelectDialogField<venueData>(
                                dialogHeight:MediaQuery.of(context).size.height/2.2,
                                confirmText: const Text("OK",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                                cancelText: const Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {return 'Please select team member';}
                                  return null;
                                },
                                searchable: true,
                                items: friends.map((data) =>
                                    MultiSelectItem<venueData>(data, data.name.toString(),),).toList(),
                                initialValue: _selectedAnimals2,
                                title: const Text("Search venue",style: TextStyle(color: Colors.black,fontSize: 14),),
                                selectedColor: const Color(0xFFFD2F71),
                                itemsTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
                                chipDisplay: MultiSelectChipDisplay(
                                  textStyle: const TextStyle(color: Colors.black),),
                                selectedItemsTextStyle: const TextStyle(color: Colors.red),
                                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),),
                                buttonIcon: const Icon(Icons.search, color: Colors.grey,),
                                buttonText: const Text("Search venue..",style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,maxLines: 1),
                                onConfirm: (val) {
                                  setState((){
                                    _selectedAnimals2 = val;
                                  });
                                },
                              ),
                            ),
                            selectedList == null ?
                            const SizedBox() :
                            SizedBox(
                              height: 300,
                              child: ListView.builder(
                                itemCount: selectedList.length,
                                itemBuilder: (context, index) {
                                  var data = selectedList[index];
                                  return Row(
                                    children: [
                                      Container(
                                        margin : EdgeInsets.all(5.0),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: appColor,
                                            borderRadius: BorderRadius.circular(25.0)
                                        ),
                                        child: Text("${data.venueName}",
                                          style: TextStyle(color: Colors.white,fontSize: 12),),
                                      ),
                                    ],
                                  );
                                },),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Positioned(
                    //   child: IconButton(
                    //     color: Colors.white,
                    //     icon: const Icon(Icons.arrow_back_ios),
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //   ),
                    // ),
                  ]),
            )),
        bottomSheet: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.black,
            height: 70,
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                if(_selectedAnimals2.isEmpty){
                  CommonToast(context: context, title: 'Please select one perform At', alignCenter: false);
                }else{
                  GetArtistList().venueSubmit(
                      venueId: _selectedAnimals2.map((e) => e.id).join(','),
                      venueName: _selectedAnimals2.map((e) => e.name).join(','),
                      context: context).then((value) {
                  }).whenComplete((){
                    load();
                    Get.offAll(YouPlay(subCategoryId:  _selectedAnimals2.map((e) => e.id).join(',')));
                  });
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50.0,
                decoration: boxDecoration(),
                child: const Text('Submit',style: buttonText),
              ),
            )),
      ),
    );
  }
}



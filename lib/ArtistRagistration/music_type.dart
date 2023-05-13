// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_app/Modal/genreM.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/utils.dart';
import 'languageScreen.dart';

class Music_type extends StatefulWidget {
  Music_type({Key? key,}) : super(key: key);

  @override
  State<Music_type> createState() => _Music_typeState();
}

class _Music_typeState extends State<Music_type> {
  bool onSelect = false;

  List<Genres> friends = [];
  List<Genres> _selectedAnimals2 = [];
  List<Selected> selectedList =[];
  final double _height = Get.height, _width = Get.width;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load(){
    GetArtistList().genreApi().then((value) {
      setState(() {
        friends = value.data!.genres!;
      });
    });
    GetArtistList().genreApi().then((value) {
      setState(() {
        selectedList = value.data!.selected!;
      });
    });
  }
  List<selectedGenre> totalSelected = [];
  List selectedPrompts = [];
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
                  children: [
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
                        width: double.infinity,
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
                            const SizedBox(height: 20.0),
                            Text(" Music Type/Genre of Music",style: GoogleFonts.poppins(textStyle: textLabel),),
                            const SizedBox(height: 15),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xFF434445),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: MultiSelectDialogField<Genres>(
                                dialogHeight:MediaQuery.of(context).size.height/2.2,
                                confirmText: const Text("OK",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                                cancelText: const Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {return 'Please select team member';}
                                  return null;
                                },
                                searchable: true,
                                items: friends.map((data) =>
                                    MultiSelectItem<Genres>(
                                      data, data.name.toString(),),).toList(),
                                initialValue: _selectedAnimals2,
                                title: const Text("Search music/genre",style: TextStyle(color: Colors.black,fontSize: 14),),
                                selectedColor: const Color(0xFFFD2F71),
                                itemsTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
                                chipDisplay: MultiSelectChipDisplay(textStyle: const TextStyle(color: Colors.black),),
                                selectedItemsTextStyle: const TextStyle(color: Colors.red),
                                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),),
                                buttonIcon: const Icon(Icons.search, color: Colors.grey,),
                                buttonText: const Text("Search music/genre..",style: TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis,maxLines: 1),
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
                              height: _height*0.40,
                              child: ListView.builder(
                                itemCount: selectedList.length,
                                itemBuilder: (context, index) {
                                  var data = selectedList[index];
                                return Row(
                                  children: [
                                    Container(
                                      margin : const EdgeInsets.all(5.0),
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: appColor,
                                          borderRadius: BorderRadius.circular(25.0)
                                      ),
                                      child: Text("${data.genresName}",
                                        style: TextStyle(color: Colors.white,fontSize: 12),),
                                    ),
                                  ],
                                );
                              },),
                            ),

                            // ListView.builder(
                            //   shrinkWrap: true,
                            //     physics: ScrollPhysics(),
                            //     itemCount: _selectedAnimals2.length,
                            //     itemBuilder:  (context, index) {
                            //     var data = _selectedAnimals2[index];
                            //       return Container(
                            //         margin : const EdgeInsets.all(5.0),
                            //         padding: const EdgeInsets.all(10),
                            //         decoration: BoxDecoration(
                            //             color: appColor,
                            //             borderRadius: BorderRadius.circular(25.0)
                            //         ),
                            //         child: InkWell(
                            //           onTap: (){},
                            //             child: Text("${data.name}",style: textHint,)),
                            //       );
                            //     },)


                            // MultiSelectContainer(
                            //     items: friends.map((e) {
                            //       return  MultiSelectCard(
                            //         decorations: MultiSelectItemDecorations(
                            //           decoration: BoxDecoration(
                            //               color: const Color(0xFFF9F6F4),
                            //               borderRadius: BorderRadius.circular(20)),
                            //           selectedDecoration: BoxDecoration(
                            //               color: appColor,
                            //               borderRadius: BorderRadius.circular(20)),
                            //         ),
                            //         value: e.name,
                            //         label: e.name,
                            //         contentPadding: const EdgeInsets.all(12),
                            //         highlightColor: appColor,
                            //       );
                            //     }).toList(),
                            //     onChange: (allSelectedItems, selectedItem) {
                            //       selectedPrompts =  allSelectedItems;
                            //     },
                            //     splashColor: Colors.blue),
                            // const SizedBox(height: 70.0),
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
            )
        ),
        bottomSheet: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.black,
            height: 70,
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                if(_selectedAnimals2.isEmpty){
                  CommonToast(context: context, title: 'Please select one type', alignCenter: false);
                }else{
                  GetArtistList().submitGenre(
                      artistId: _selectedAnimals2.map((e) => e.id).join(','),
                      artistName: _selectedAnimals2.map((e) => e.name).join(','),
                      context: context).then((value) {
                    Get.offAll(const languageScreen())!.whenComplete(() => {
                    load(),
                    });
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => languageScreen(),)).whenComplete((){
                    //   load();
                    // });
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
            )
        ),
      ),
    );
  }
}
class selectedGenre {
  String name;
  String id;
  bool isSelected;

  selectedGenre({required this.name,required this.id, required this.isSelected});
}

class Friend {
  String label;

  // Color color;
  bool isSelected;

  Friend({required this.label, required this.isSelected});
}


// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistScreen/editvenue.dart';
import 'package:flutter_app/Controller/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../ApiServices/artistListApi.dart';
import '../Modal/genreM.dart';
import '../Modal/languageM.dart';
import '../Modal/selectedLanguageM.dart';
import '../Modal/venueM.dart';
import '../Controller/style.dart';
import '../Modal/youPlayM.dart';
import 'editFormation.dart';

class profileInstrument extends StatefulWidget {
  const profileInstrument({Key? key}) : super(key: key);

  @override
  State<profileInstrument> createState() => _profileInstrumentState();
}

class _profileInstrumentState extends State<profileInstrument> {

  List<Selected> selectedGenre =[];
  List<SelectedVenue> selectedVenue = [];
  List<lanData> languageList = [];
  List<lanData> languageSearch = [];
  List<languageSelected> getLanguageList = [];
  List<SelectedYou> selectedList = [];

  TextEditingController languageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  var selected;

  load(){
    GetArtistList().artistSubtype(
        subArtist: "1").then((value) {
      setState(() {
        selectedList = value.data!.selected!;
      });
    });
    GetArtistList().artistType().then((value) {
      setState(() {
        selected = value.data!.selected!.artistName;
      });
    });
    GetArtistList().genreApi().then((value) {
      setState(() {
        selectedGenre = value.data!.selected!;
      });
    });
    GetArtistList().venueApi().then((value) {
      setState(() {
        selectedVenue =  value.data!.selected!;
      });
    });
    GetArtistList().getLanguage().then((value) {
      setState(() {
        languageList =languageSearch= value.data!;
      });
    });
    GetArtistList().selectedLanguageApi().then((value) {
      setState(() {
        getLanguageList = value.data!;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 10.0),
          Text("What Type of Artist",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
          const SizedBox(height: 2.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Chip(
              side: const BorderSide(color: appColor),
              backgroundColor: appBarColor,
              // deleteIcon: const Icon( Icons.clear,size: 24,color: Colors.white,),
              // onDeleted: () {setState(() {});
              // },
              label: Text("$selected",style: textLabel,),
            ),
          ),
          const SizedBox(height: 10.0,),
          const Divider(color: Colors.white),

          Text("Language",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
          const SizedBox(height: 2.0),
          SizedBox(
            height: 100,
            child: GridView.builder(
              itemCount: getLanguageList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //maxCrossAxisExtent: 100,
                  childAspectRatio: 3.5 / 1.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                var data = getLanguageList[index];
                return Chip(
                  side: const BorderSide(color: appColor),
                  backgroundColor: appBarColor,
                  deleteIcon: const Icon( Icons.clear,size: 24,color: Colors.white,),
                  onDeleted: () {
                    setState(() {
                      GetArtistList().deleteLanguage(
                          languageId: data.languageIds.toString(),
                          languageName: data.languages.toString(),
                          context: context).whenComplete((){
                            load();
                      });
                    });
                  },
                  label: Text("${data.languages}",style: textLabel,),
                );
              },),
          ),
          const SizedBox(height: 10.0,),
          addLanguage(),
          const Divider(color: Colors.white),

          Text("Formation on Stage",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
          const SizedBox(height: 2.0),
          SizedBox(
            height: 100,
            child: GridView.builder(
              itemCount: selectedList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //maxCrossAxisExtent: 100,
                  childAspectRatio: 3.6 / 1.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                var data = selectedList[index];
                return Chip(
                  side: const BorderSide(color: appColor),
                  backgroundColor: appBarColor,
                  // deleteIcon: const Icon( Icons.clear,size: 24,color: Colors.white,),
                  //onDeleted: () {},
                  label: Text("${data.subCategoryName}",style: textLabel,),
                );
              },),
          ),
          const SizedBox(height: 10.0,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => editFormation(),));
            },
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Icon(Icons.add,color: Colors.white,size: 24,)),
              ],
            ),
          ),
          const Divider(color: Colors.white),

          Text("Music Type/Genre of Music",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
          const SizedBox(height: 10.0,),
          SizedBox(
            height: 110,
            child: GridView.builder(
              itemCount: selectedGenre.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 6 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                var data = selectedGenre[index];
                return Chip(
                  side: const BorderSide(color: appColor),
                  backgroundColor: appBarColor,
                  // deleteIcon: const Icon( Icons.clear,size: 24,color: Colors.white,),
                  // onDeleted: () {setState(() {});
                  // },
                  label: Text("${data.genresName}",style: textLabel,),
                );
              },),
          ),
          const SizedBox(height: 10.0,),
         // addLanguage(),
          const Divider(color: Colors.white),

          Text("Venue you Wish To Perform At?",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
          const SizedBox(height: 5.0,),
          SizedBox(
            height: 50,
            child: GridView.builder(
              itemCount: selectedVenue.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  //maxCrossAxisExtent: 100,
                  childAspectRatio: 3.5 / 1.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                var data = selectedVenue[index];
                return Chip(
                  side: const BorderSide(color: appColor),
                  backgroundColor: appBarColor,
                  // deleteIcon: const Icon( Icons.clear,size: 24,color: Colors.white,),
                  // onDeleted: () {setState(() {});
                  // },
                  label: Text("${data.venueName}",style: textLabel,),
                );
              },),
          ),
          const SizedBox(height: 10.0,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => editVenue(),));
            },
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: const Icon(Icons.add,color: Colors.white,size: 24,)),
              ],
            ),
          ),
          const SizedBox(height: 10.0,),
        ],
      ),
    );
  }
  Widget addLanguage(){
    return InkWell(
      onTap: (){
        showDialog(
          context: context,
          barrierDismissible:false,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (context, setState){
                  return Dialog(
                      backgroundColor: appBarColor,
                      shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      elevation: 16,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                  // searchBank.clear();
                                  load();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 10.0,top: 5.0),
                                  child: Icon(Icons.clear,color: Colors.white,size: 24,),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin : const EdgeInsets.only(right: 10.0,left: 10.0,bottom: 5.0,top: 5.0),
                            child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    languageSearch = languageList
                                        .where((name) => name.language!
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                        .toList();
                                  });
                                },
                                keyboardType: TextInputType.text,
                                controller: languageController,
                                style: textFill,
                                decoration: inputDecoration(
                                    context,
                                    hint: "Search language")
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: languageSearch.isEmpty ? 0 : languageSearch.length,
                                itemBuilder: (context, index) {
                                  var data =languageSearch[index];
                                  return ListView(
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          setState((){
                                            GetArtistList().updateLanguage(
                                                languageId: data.id.toString(),
                                                languageName: data.language.toString(),
                                                context: context).whenComplete((){
                                                  load();
                                              Navigator.pop(context);
                                            });
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(data.language.toString(),
                                              style: textFill),
                                        ),
                                      ),
                                      const Divider(color: Colors.white)
                                    ],
                                  );
                                }),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     load();
                          //   },
                          //   child: Container(
                          //     alignment: Alignment.center,
                          //     width: 140,
                          //     height: 40.0,
                          //     decoration: boxDecoration(),
                          //     child: const Text('Update',style: buttonText),
                          //   ),
                          // ),
                          const SizedBox(height: 5.0),
                        ],
                      )
                  );
                }
            );
          },
        );
      },
        child: Row(
          children:  [
            Container(
              decoration: BoxDecoration(
                color: appColor,
                borderRadius: BorderRadius.circular(30)
              ),
                child: const Icon(Icons.add,color: Colors.white,size: 24,)),
            const SizedBox(width: 5.0),
            const Text("Add More",style: textLabel,)
          ],
        )
    );
  }
}

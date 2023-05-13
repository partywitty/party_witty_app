// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../ApiServices/artistListApi.dart';
import '../ArtistScreen/filterList.dart';
import '../Modal/artistTypeM.dart';
import '../Modal/filterInstrumentM.dart';
import '../Modal/genreM.dart';
import '../Modal/instrumentM.dart';
import '../Modal/venueM.dart';
import '../Modal/youPlayM.dart';

class searchFilter extends StatefulWidget {
  const searchFilter({Key? key}) : super(key: key);

  @override
  State<searchFilter> createState() => _searchFilterState();
}

class _searchFilterState extends State<searchFilter> {

  List<Artist> artistList = [];
  List<Artist> artistSelected =[] ;

  List<Genres> genreList = [];
  List<Genres> genreSelected = [];

  List<venueData> venueList = [];
  List<venueData> venueSelected = [];

  List<SubcategoryYou> subCategoryList = [];
  List<SubcategoryYou> subCategorySelected = [];

  List<insData> instrumentList = [];
  List<insData> instrument =[];

  TextEditingController startPrice = TextEditingController();
  TextEditingController endPrice = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load(){
    GetArtistList().artistType().then((value) {
      setState(() {
        artistList = value.data!.artist!;
      });
    });
    GetArtistList().genreApi().then((value) {
      setState(() {
        genreList = value.data!.genres!;
      });
    });
    GetArtistList().venueApi().then((value) {
      setState(() {
        venueList =value.data!.genres!;
      });
    });
  }
  String? subCategoryId;
  bool subCategory = false;
  String? subCategoryStatus;

  bool instrumentValue = false;
  String? instrumentId;
  String? instrumentStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18191a),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Filter",style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assests/Vector.png'),
          )
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
          children: [

            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF434445),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: MultiSelectDialogField<Artist>(
                dialogHeight:MediaQuery.of(context).size.height/2.2,
                confirmText: const Text("OK",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                cancelText: const Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                validator: (value) {
                  if (value == null || value.isEmpty) {return 'Please select team member';}
                  return null;
                },
                searchable: true,
                items: artistList.map((data) =>
                    MultiSelectItem<Artist>(
                      data, data.name.toString(),),).toList(),
                initialValue: artistSelected,
                title: const Text("Search artist",style: TextStyle(color: Colors.black,fontSize: 14),),
                selectedColor: const Color(0xFFFD2F71),
                itemsTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(color: Colors.black),),
                selectedItemsTextStyle: const TextStyle(color: Colors.red),
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),),
                buttonIcon: const Icon(Icons.search, color: Colors.grey,),
                buttonText: const Text("Search artist..",style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,maxLines: 1),
                onConfirm: (val) {
                  setState((){
                    artistSelected = val;
                    subCategoryStatus = artistSelected.map((e) => e.subcategory).join(",");
                    print(artistSelected.map((e) => e.subcategory).join(","));
                    subCategoryId = artistSelected.map((e) => e.id).join(",");
                    GetArtistList().artistSubtype(
                        subArtist: subCategoryId.toString()).then((value) {
                      setState(() {
                        subCategorySelected = value.data!.subcategory!;
                      });
                    });
                    subCategoryStatus == "0" ? const SizedBox() : subCategory = true;
                    subCategoryStatus == "0" ? subCategory = false : SizedBox();
                  });
                },
              ),
            ),

            Visibility(
              visible: subCategory,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: const Color(0xFF434445),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: MultiSelectDialogField<SubcategoryYou>(
                  dialogHeight:MediaQuery.of(context).size.height/2.2,
                  confirmText: const Text("OK",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                  cancelText: const Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {return 'Please select team member';}
                    return null;
                  },
                  searchable: true,
                  items: subCategorySelected.map((data) =>
                      MultiSelectItem<SubcategoryYou>(
                        data, data.name.toString(),),).toList(),
                  initialValue: subCategoryList,
                  title: const Text("Search subcategory",style: TextStyle(color: Colors.black,fontSize: 14),),
                  selectedColor: const Color(0xFFFD2F71),
                  itemsTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
                  chipDisplay: MultiSelectChipDisplay(
                    textStyle: const TextStyle(color: Colors.black),),
                  selectedItemsTextStyle: const TextStyle(color: Colors.red),
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),),
                  buttonIcon: const Icon(Icons.search, color: Colors.grey,),
                  buttonText: const Text("Search subcategory..",style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,maxLines: 1),
                  onConfirm: (val) {
                    setState((){
                      subCategoryList = val;
                      instrumentId = subCategoryList.map((e) => e.id).join(",");
                      print(instrumentId);
                      GetArtistList().filterInstrumentApi(instrumentId: instrumentId.toString()).then((value){
                        setState(() {
                          instrumentList = value.data!;
                        });
                      });
                     // instrumentStatus = subCategoryList.map((e) => e.)
                      instrumentStatus == "0" ? const SizedBox() : instrumentValue = true;
                      instrumentStatus == "0" ? instrumentValue = false : SizedBox();
                    });
                  },
                ),
              ),
            ),

            Visibility(
              visible: instrumentValue,
              child: Container(
                margin: EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                    color: Color(0xFF434445),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: MultiSelectDialogField<insData>(
                  dialogHeight:MediaQuery.of(context).size.height/2.2,
                  confirmText: const Text("OK",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                  cancelText: const Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {return 'Please select team member';}
                    return null;
                  },
                  searchable: true,
                  items: instrumentList.map((data) =>
                      MultiSelectItem<insData>(
                        data, data.name.toString(),),).toList(),
                  initialValue: instrument,
                  title: const Text("Search instrument",style: TextStyle(color: Colors.black,fontSize: 14),),
                  selectedColor: const Color(0xFFFD2F71),
                  itemsTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
                  chipDisplay: MultiSelectChipDisplay(
                    textStyle: const TextStyle(color: Colors.black),),
                  selectedItemsTextStyle: const TextStyle(color: Colors.red),
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),),
                  buttonIcon: const Icon(Icons.search, color: Colors.grey,),
                  buttonText: const Text("Search instrument..",style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,maxLines: 1),
                  onConfirm: (val) {
                    setState((){
                      instrument = val;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 20.0,),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFF434445),
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
                items: genreList.map((data) =>
                    MultiSelectItem<Genres>(
                      data, data.name.toString(),),).toList(),
                initialValue: genreSelected,
                title: const Text("Search genres",style: TextStyle(color: Colors.black,fontSize: 14),),
                selectedColor: const Color(0xFFFD2F71),
                itemsTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
                chipDisplay: MultiSelectChipDisplay(
                  textStyle: const TextStyle(color: Colors.black),),
                selectedItemsTextStyle: const TextStyle(color: Colors.red),
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),),
                buttonIcon: const Icon(Icons.search, color: Colors.grey,),
                buttonText: const Text("Search genres..",style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,maxLines: 1),
                onConfirm: (val) {
                  setState((){
                    genreSelected = val;
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0,),
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
                items: venueList.map((data) =>
                    MultiSelectItem<venueData>(data, data.name.toString(),),).toList(),
                initialValue: venueSelected,
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
                    venueSelected = val;
                  });
                },
              ),
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              controller: startPrice,
              keyboardType: TextInputType.number,
              autofocus: false,
              style: const TextStyle(
                  fontSize: 14.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                hintText: "Start price",
                hintStyle: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),
                fillColor: const Color(0xFF434445),
                filled: true,
                contentPadding: const EdgeInsets.only(
                    left: 25.0, bottom: 12.0, top: 0.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color(0xFF434445)),
                  borderRadius: BorderRadius.circular(20.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color(0xFF434445)),
                  borderRadius: BorderRadius.circular(20.7),
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
            TextFormField(
              controller: endPrice,
              keyboardType: TextInputType.number,
              autofocus: false,
              style: const TextStyle(
                  fontSize: 14.0, color: Color(0xFFbdc6cf)),
              decoration: InputDecoration(
                hintText: "End price",
                hintStyle: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),
                fillColor: const Color(0xFF434445),
                filled: true,
                contentPadding: const EdgeInsets.only(
                    left: 25.0, bottom: 12.0, top: 0.0),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color(0xFF434445)),
                  borderRadius: BorderRadius.circular(20.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color(0xFF434445)),
                  borderRadius: BorderRadius.circular(20.7),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                color: Colors.black,
                height: 70,
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    print(artistSelected.map((e) => e.id).join(","));
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => filterArtist(
                        artistId: artistSelected.map((e) => e.id).join(","),
                        genreName: genreSelected.map((e) => e.name).join(","),
                        instrumentIds: instrument.map((e) => e.id).join(","),
                        venueName: venueSelected.map((e) => e.name).join(","),
                        subCategory: subCategoryList.map((e) => e.name).join(","),
                        startPrice: startPrice.text,
                        endPrice: endPrice.text,
                      ),));
                  },
                  child: Container(
                    width: 140,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset(0.1, 0.1),
                        end: FractionalOffset(0.7, 0.1),
                        colors: [
                          Color(0xFFFE262F),
                          Color(0xFFFD2F71),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Center(
                      child: Text('Filter',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

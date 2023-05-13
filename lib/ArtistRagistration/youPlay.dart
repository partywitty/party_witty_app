
// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/trioScreen.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import 'artist_address.dart';
import '../Controller/SharePre.dart';
import 'budgetScreen.dart';
import '../Controller/utils.dart';
import '../Modal/youPlayM.dart';
import '../Controller/style.dart';
import 'duoBudget.dart';

class YouPlay extends StatefulWidget {
  var subCategoryId;
  YouPlay({Key? key,required this.subCategoryId}) : super(key: key);

  @override
  State<YouPlay> createState() => _YouPlayState();
}

class _YouPlayState extends State<YouPlay> {
  final _getUserDetail = GetUserDetail();
  List<SubcategoryYou> _selectedAnimals2 = [];
  List<SubcategoryYou> friends = [];
  List<SelectedYou> selectedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load() {
    GetArtistList().artistSubtype(
        subArtist: widget.subCategoryId.toString()).then((value) {
      setState(() {
        friends = value.data!.subcategory!;
     //   selectedList = value.data!.selected!;
      });
    });
    GetArtistList().artistSubtype(
        subArtist: widget.subCategoryId.toString()).then((value) {
      setState(() {
        selectedList = value.data!.selected!;
      });
    });
  }

  String? nextPage;
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
              child: Stack(children: [
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
                        Text(" Formation on Stage", style: GoogleFonts.poppins(textStyle: textLabel)),
                        const SizedBox(height: 15),
                        Container(
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
                            items: friends.map((data) =>
                                MultiSelectItem<SubcategoryYou>(
                                  data, data.name.toString(),),).toList(),
                            initialValue: _selectedAnimals2,
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
                                    margin : const EdgeInsets.all(5.0),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: appColor,
                                        borderRadius: BorderRadius.circular(25.0)
                                    ),
                                    child: Text("${data.subCategoryName}",
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
                  CommonToast(context: context, title: 'Please select stage ', alignCenter: false);
                }else{
                  artistSubTypeSubmit(
                      artistId: _selectedAnimals2.map((e) => e.id).join(','),
                      artistName: _selectedAnimals2.map((e) => e.name).join(','),
                      context: context).then((value) {
                  }).whenComplete(() {
                    load();
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
  Future<void> artistSubTypeSubmit({
    required String artistName,
    required String artistId,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.artistSubtypeSubmit));
      request.fields.addAll({
        'user_id': userId,
        'sub_category_id':artistId,
        'sub_category_name':artistName,
        'profile_id': DataManager.getInstance().getProfile().toString(),
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Artist Name is required', alignCenter: false);
        } else {
          print(responseDecode);
          nextPage = responseDecode['data']['num_of_intrument'];
          nextPage == "1" ?
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
              budgetScreen(
                heading: responseDecode['data']['name'],
                type: responseDecode['data']['num_of_intrument'],
                subCategoryId: responseDecode['data']['id'].toString(),
              ),),(route)=> false):
          nextPage == "2" ?
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
              duoBudgetScreen(
                heading: responseDecode['data']['name'],
                subCategoryId: responseDecode['data']['id'].toString(),
                type: responseDecode['data']['num_of_intrument'],
              ),),(route)=> false):
          nextPage == "3" ?
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
              trioScreen(
                heading: responseDecode['data']['name'],
                subCategoryId: responseDecode['data']['id'].toString(),
                type: responseDecode['data']['num_of_intrument'],
              ),),(route)=> false) :
          nextPage == "0" ?
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
              trioScreen(
                heading: responseDecode['data']['name'],
                type: responseDecode['data']['num_of_intrument'],
                subCategoryId: responseDecode['data']['id'].toString(),
              ),),(route)=> false) :
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
              artistAddress(),),(route)=> false);
        }
       // isLoading.value = false;
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("Error-----------------------true");
     // isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }
}

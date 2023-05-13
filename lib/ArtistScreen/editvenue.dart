

// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistScreen/editBudget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/venueM.dart';
import 'package:http/http.dart' as http;
import '../Screens/bottomSheet.dart';
import 'editDuoBudget.dart';
import 'editTrioBudget.dart';

class editVenue extends StatefulWidget {
  const editVenue({Key? key}) : super(key: key);

  @override
  State<editVenue> createState() => _editVenueState();
}

class _editVenueState extends State<editVenue> {
  final _getUserDetail = GetUserDetail();
  List<venueData> friends = [];
  List<venueData> _selectedAnimals2 = [];

  load(){
    GetArtistList().venueApi().then((value) {
      setState(() {
        friends =value.data!.genres!;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Venue",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
        ],
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              editVenueSubmitApi(
                    venueId: _selectedAnimals2.map((e) => e.id).join(','),
                    venueName: _selectedAnimals2.map((e) => e.name).join(','),
                    context: context).then((value) {
                }).whenComplete((){
                  load();
                });
            },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: const Text('Submit',style: buttonText),
            ),
          )),
    );
  }

  Future<void> editVenueSubmitApi({required String venueName,required String venueId,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.editVenueSubmit));
      request.fields.addAll({
        'user_id': userId,
        'profile_id' : DataManager.getInstance().getProfile().toString(),
        'venue_id': venueId,
        'venue_name': venueName,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Venue Name is required', alignCenter: false);
        } else {
          var nextPage = responseDecode['data']['stage']['num_of_intrument'];
          print("$nextPage-----------end page--------");
          nextPage == "0" ?
          Navigator.push(context, MaterialPageRoute(builder: (context) => editBudget(
            title: responseDecode['data']['stage']['name'],
            type: responseDecode['data']['stage']['num_of_intrument'],
            subcategoryId: responseDecode['data']['stage']['id'].toString(),
            venuePage: "1",
          ),)) :
          nextPage == "1" ?
          Navigator.push(context, MaterialPageRoute(builder: (context) => editBudget(
            title: responseDecode['data']['stage']['name'],
            type: responseDecode['data']['stage']['num_of_intrument'],
            subcategoryId: responseDecode['data']['stage']['id'].toString(),
            venuePage: "1",
          ),)) :
          nextPage == "2" ?
          Navigator.push(context, MaterialPageRoute(builder: (context) => editDuoBudget(
           title: responseDecode['data']['stage']['name'],
           type: responseDecode['data']['stage']['num_of_intrument'],
           subcategoryId: responseDecode['data']['stage']['id'].toString(),
            venuePage: "1",
          ),)) :
          nextPage == "3" ?
          Navigator.push(context, MaterialPageRoute(builder: (context) => editTrioBudget(
            title: responseDecode['data']['stage']['name'],
            type: responseDecode['data']['stage']['num_of_intrument'],
            subcategoryId: responseDecode['data']['stage']['id'].toString(),
            venuePage: "1",
          ),)) :
          Navigator.push(context, MaterialPageRoute(builder: (context) => bottomSheet(),));
        }
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
     // isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }
}

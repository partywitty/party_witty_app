// ignore_for_file: camel_case_types
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../ArtistRagistration/budgetScreen.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Modal/instrumentM.dart';
import 'package:http/http.dart' as http;

class Solo_instrument extends StatefulWidget {
  const Solo_instrument({Key? key}) : super(key: key);

  @override
  State<Solo_instrument> createState() => _Solo_instrumentState();
}

class _Solo_instrumentState extends State<Solo_instrument> {

  final _getUserDetail = GetUserDetail();
  List<Instruments> friends = [];
  List<Instruments> instrument =[] ;


  var titles;
  var subInstrumentId;

  load(){
    GetArtistList().instrumentApi().then((value) {
      setState(() {
        friends = value.data!.instruments!;
        titles = value.data!.title;
        subInstrumentId = value.data!.subcategoryId;
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40, left: 30),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Container(
                      width: double.infinity,
                      // height: height*0.5,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,),
                              child: Text("$titles",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.white)),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20.0),
                              decoration: BoxDecoration(
                                  color: const Color(0xFF434445),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: MultiSelectDialogField<Instruments>(
                                dialogHeight:MediaQuery.of(context).size.height/2.2,
                                confirmText: const Text("OK",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                                cancelText: const Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {return 'Please select team member';}
                                  return null;
                                },
                                searchable: true,
                                items: friends.map((data) =>
                                    MultiSelectItem<Instruments>(
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
                            const SizedBox(height: 10,),
                          ],
                        ),
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
          child: Center(
            child: GestureDetector(
              onTap: () {
                if(instrument.length == 1){
                  instrument_submit(
                      subInstrument: subInstrumentId.toString(),
                      instrumentId: instrument.map((e) => e.id).join(','),
                      context: context);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => budgetScreen(type: 1.toString(),
                  // categoryId: subInstrumentId.toString()),));
                }else{
                  CommonToast(context: context, title: 'Please select one instrument', alignCenter: false);
                }
               // Navigator.pushNamed(context, '/dio');
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
                  child: Text('Submit',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white)),
                ),
              ),
            ),
          ),),
    );
  }

  Future instrument_submit({required String subInstrument,required String instrumentId,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.instrumentSubmit));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'intrument_id':instrumentId,
        'subcategory_id':subInstrument,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => budgetScreen(),));
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      print(e);
    }
  }
}


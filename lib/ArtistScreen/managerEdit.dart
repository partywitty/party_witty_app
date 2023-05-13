
// ignore_for_file: camel_case_types
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Streaming.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class managerEdits extends StatefulWidget {
  const managerEdits({Key? key}) : super(key: key);

  @override
  State<managerEdits> createState() => _managerEditsState();
}

class _managerEditsState extends State<managerEdits> {
  TextEditingController signatureController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  final _getUserDetail = GetUserDetail();
  load(){
    StreamingApi().getManagerDetails().then((value)  {
      var data = value.data;
      setState((){
        data!.signature == null ? signatureController.text : signatureController.text = data.signature!;
        data.name == null ? nameController.text : nameController.text = data.name!;
        data.contactNo == null ? contactController.text : contactController.text = data.contactNo!;
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 10.0),
          Text('Manager Details',style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: signatureController,
            keyboardType: TextInputType.text,
            autofocus: false,
            style: textFill,
            decoration: inputDecoration(context,hint: "Unique name"),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            autofocus: false,
            style: textFill,
            decoration: inputDecoration(context,hint: "Manager name"),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            controller: contactController,
            keyboardType: TextInputType.text,
            autofocus: false,
            style: textFill,
            decoration: inputDecoration(context,hint: "Manager contact"),
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              updateManagerApi(
                context: context,
                signature: signatureController.text,
                name: nameController.text,
                contact: contactController.text
              ).whenComplete((){
                load();
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('Update',style: GoogleFonts.poppins(textStyle: buttonText)),
            ),
          ),
        ],
      ),
    );
  }
  Future updateManagerApi({
    required String signature,
    required String name,
    required String contact,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.updateManagerDetails));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'signature': signature,
        'name': name,
        'contact_no':contact,
        'end_page' : "update"
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
        }
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
      print("----------------error");
      print(e);
    }
  }
}

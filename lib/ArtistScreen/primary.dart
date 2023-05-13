

// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Controller/SharePre.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistProfile.dart';
import '../Controller/utils.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;

class primaryDetails extends StatefulWidget {
  const primaryDetails({Key? key}) : super(key: key);

  @override
  State<primaryDetails> createState() => _primaryDetailsState();
}

class _primaryDetailsState extends State<primaryDetails> {
  final _getUserDetail = GetUserDetail();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  String? gender = "male";

  String numberValue = '+91';
  var items = ['+91', '+92', '+93', '+94', '+95'];

  int? buttonStatus;

  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
  }

  load(){
    artistProfileApi().getPrimaryView().then((value)  {
      var data = value.data;
      // buttonStatus = value.data!.tempUser!.temp.toString();
      setState((){
        data!.user!.username == null ? nameController.text : nameController.text = data.user!.username!;
        data.user!.email == null ? emailController.text : emailController.text = data.user!.email!;
        data.user!.contactNo == null ? numberController.text : numberController.text = data.user!.contactNo!;
        data.tempUser!.temp == null ?  buttonStatus : buttonStatus = data.tempUser!.temp as int?;
        setState(() {
          data.user!.gender == null ? gender : gender = data.user!.gender;
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children:  [
          const SizedBox(height: 10.0,),
          Text("Primary Details",style: GoogleFonts.poppins(textStyle: profileTitle),),
          const SizedBox(height: 10.0,),
          Text('Full Name',style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 5.0,),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            style: textFill,
            decoration: inputDecoration(context,),
          ),
          const SizedBox(height: 20.0,),
          Text('Email',style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 5.0,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            readOnly: true,
            style: textFill,
            decoration: inputDecoration(context,),
          ),
          const SizedBox(height: 20.0,),
          Text('Phone Number',style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 5.0,),
          Container(
            height: 50,
            // width: 300,
            decoration: (BoxDecoration(
                color: const Color(0xFF434445),
                borderRadius: BorderRadius.circular(30))),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'assests/ind_img.png',
                          ),
                        ),
                        const SizedBox(width: 10,),
                        SizedBox(
                          height: 33,
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 1,
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: numberValue,
                                dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    numberValue = newValue!;
                                  });
                                },
                              )),),
                        const SizedBox(width: 8,),
                        Container(
                          height: 25,
                          width: 1.5,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 49,
                          width: width*0.5,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter number';
                              }else if (numberController.text.length < 10){
                                return 'Please enter correct number';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10)],
                            controller: numberController,
                            autofocus: false,
                            keyboardType: TextInputType.number,
                            style: textFill,
                            decoration: inputDecoration(context,),
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0,),
          Text('Gender',style: GoogleFonts.poppins(textStyle: textLabel)),
          Theme(
            data: ThemeData(
              unselectedWidgetColor: appColor,
            ),
            child: Wrap(
              children: [
                RadioListTile(
                  activeColor: appColor,
                  title: const Text("Male",style: textFill,),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                RadioListTile(
                  activeColor: appColor,
                  title: const Text("Female",style: textFill,),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value){
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0,),
          buttonStatus == 0 ?
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                decoration: boxDecoration(),
                child: const Text('Wait for admin approval',style: buttonText),
              ),
            ),
          ) :
          Center(
            child: GestureDetector(
              onTap: () {
                primaryUpdate(
                    context: context,
                    gender: gender,
                    userName: nameController.text,
                    contactNo: numberController.text);
                load();
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50.0,
                decoration: boxDecoration(),
                child: const Text('Update',style: buttonText),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future primaryUpdate({
    required String userName,
    required String contactNo,
    required gender,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.primary));
      request.fields.addAll({
        'user_id': userId,
        'username':userName,
        'contact_no':contactNo,
        'gender':gender,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: "Email Not Exit!", alignCenter:false);
        } else {
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }
}

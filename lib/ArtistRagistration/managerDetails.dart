
// ignore_for_file: camel_case_types
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_app/ArtistRagistration/Upload_Celebs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/languageM.dart';

class managerDetails extends StatefulWidget {
  const managerDetails({Key? key}) : super(key: key);

  @override
  State<managerDetails> createState() => _managerDetailsState();
}

class _managerDetailsState extends State<managerDetails> {

  final _formKey = GlobalKey<FormState>();
  final _getUserDetail = GetUserDetail();
  TextEditingController signature = TextEditingController();
  TextEditingController managerName = TextEditingController();
  TextEditingController contactNo = TextEditingController();

  String? serviceValue;

  List<lanData> _currencies = [];

  load(){
    GetArtistList().getLanguage().then((value) {
      setState(() {
        _currencies = value.data!;
      });
    });
  }
  bool showFiled = false;
  String? gender;
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
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                width: width,
                height: height/2,
                child: Image.asset(
                  'assests/A_img.png',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: height/1,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0),
                        Text('  Manager Details',style: GoogleFonts.poppins(textStyle: bigTitle)),
                        const SizedBox(height: 10.0),
                        const Text('  Party Witty Signature (Unique name)', style: textLabel),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter signature';
                            }
                            return null;
                          },
                          controller: signature,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          style: textFill,
                          decoration: inputDecoration(context),
                        ),
                        const SizedBox(height: 10.0),
                        const Text('  Is your profile manage by an artist manager',style: textLabel),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: appColor,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width/2.5,
                                child: RadioListTile(
                                  activeColor: appColor,
                                  title: const Text("Yes",style: textFill,),
                                  value: "Yes",
                                  groupValue: gender,
                                  onChanged: (value){
                                    setState(() {
                                      gender = value;
                                      showFiled = true;
                                     // showVideo = false;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: width/2.5,
                                child: RadioListTile(
                                  activeColor: appColor,
                                  title: const Text("No",style: textFill,),
                                  value: "No",
                                  groupValue: gender,
                                  onChanged: (value){
                                    setState(() {
                                      gender = value;
                                      showFiled = false;
                                     // showAudio = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: showFiled,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, bottom: 3.0, top: 10),
                                  child: Text('Manager Name',
                                      style:textLabel),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter manager name';
                                      }
                                      return null;
                                    },
                                    controller: managerName,
                                    keyboardType: TextInputType.text,
                                    autofocus: false,
                                    style: textFill,
                                    decoration: inputDecoration(context),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, bottom: 3.0, top: 10),
                                  child: Text('Manager Contact no.',style: textLabel),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter contact number';
                                      }else if (contactNo.text.length < 10){
                                        return 'Please enter correct number';
                                      }
                                      return null;
                                    },
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(10)],
                                    controller: contactNo,
                                    keyboardType: TextInputType.phone,
                                    autofocus: false,
                                    style:textFill,
                                    decoration: inputDecoration(context),
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(height: 20),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if(_formKey.currentState!.validate()){
                                managerApi(
                                    signature: signature.text,
                                    name: managerName.text,
                                    contact: contactNo.text,
                                    context: context
                                ).then((value) {
                                });
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 140,
                              height: 50.0,
                              decoration: boxDecoration(),
                              child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  Future managerApi({
    required String signature,
    required String name,
    required String contact,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.managerDetails));
     request.fields.addAll({
       'user_id': userId,
       'profile_id': DataManager.getInstance().getProfile().toString(),
       'signature': signature,
       'name': name,
       'contact_no':contact,
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
          Get.to(const Upload_Celebs());
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

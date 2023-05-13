
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Streaming.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/utils.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;

class primaryAddress extends StatefulWidget {
  const primaryAddress({Key? key}) : super(key: key);

  @override
  State<primaryAddress> createState() => _primaryAddressState();
}

class _primaryAddressState extends State<primaryAddress> {
  final _getUserDetail = GetUserDetail();
  final _formKey = GlobalKey<FormState>();
  TextEditingController houseNo = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController town = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  TextEditingController adhar = TextEditingController();
  TextEditingController idProof = TextEditingController();

  String? _uploadImage;
  late File upImage;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load(){
    StreamingApi().getAddressDetails().then((value)  {
      var data = value.data;
      setState((){
        data!.flatNo == null ? houseNo.text : houseNo.text = data.flatNo;
        data.landmark == null ? landmark.text : landmark.text = data.landmark;
        data.state == null ? state.text : state.text = data.state;
        data.city == null ? town.text : town.text = data.city;
        data.pincode == null ? pinCode.text : pinCode.text = data.pincode;
        data.aadharNumber == null ? adhar.text : adhar.text = data.aadharNumber;
        data.idProof == null ? idProof.text : idProof.text = data.idProof!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, bottom: 3.0, top: 6),
            child: Text('Address',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white)),
          ),
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, bottom: 3.0, top: 6),
            child: Text('Flat No./House No.',style: textLabel),),
          TextFormField(
            controller: houseNo,
            keyboardType: TextInputType.phone,
            style: textFill,
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, bottom: 3.0, top: 6),
            child: Text('Landmark',style: textLabel),
          ),
          TextFormField(
            controller: landmark,
            style: textFill,
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, bottom: 3.0, top: 0),
            child: Text("State",style: textLabel),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter state';
              }
              return null;
            },
            controller: state,
            style: textFill,
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 12,),
          Row(
            children: [
              SizedBox(
                width: width * 0.38,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 3.0,
                      ),
                      child: Text('Town /city',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white)),
                    ),
                    TextFormField(
                      controller: town,
                      style: textFill,
                      decoration: inputDecoration(context),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12,),
              SizedBox(
                width: width * 0.35,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 3.0,
                      ),
                      child: Text('Pin Code',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white)),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter pincode';
                        }else if (pinCode.text.length < 6){
                          return 'Please enter pincode';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6)],
                      controller: pinCode,
                      keyboardType: TextInputType.phone,
                      style: textFill,
                      decoration: inputDecoration(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12,),
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, bottom: 3.0, top: 0),
            child: Text("Aadhar no",style: textLabel),
          ),
          TextFormField(
            controller: adhar,
            style: textFill,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(12)],
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 12,),
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, bottom: 3.0, top: 0),
            child: Text("ID Proof Image",
                style: textLabel),
          ),
          TextFormField(
            onTap: ()async{
              final result = await FilePicker.platform.pickFiles(type: FileType.image);
              upImage=File(result!.files.single.path!);
              setState(() {
                _uploadImage=result.files.single.path;
              }
              );
            },
            controller: idProof,
            autofocus: true,
            readOnly: true,
            maxLines: null,
            style: textFill,
            decoration: inputDecoration(context,
            hint: _uploadImage== null ? "" : upImage.path.split('/').last,
              suffixIcon: Image.asset(
                'assests/id_proof.png',
                scale: 4,
              )
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: GestureDetector(
              onTap: () {
                    addressPrimary(
                        flat: houseNo.text,
                        landmark: landmark.text,
                        state: state.text,
                        city: town.text,
                        pinCode: pinCode.text,
                        adhar: adhar.text,
                        file: _uploadImage  == null ? idProof.text : upImage.path,
                        context: context
                    ).whenComplete(() {
                      load();
                    });
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
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
  Future addressPrimary({file,flat,landmark,state,city,pinCode,adhar,required BuildContext context}) async{
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.addressSubmit));
      request.fields.addAll({
        'user_id': userId,
        'profile_id' : DataManager.getInstance().getProfile().toString(),
        'flat_no': flat,
        'landmark': landmark,
        'state': state,
        'city': city,
        'pincode': pinCode,
        'aadhar_number': adhar,
      });
      _uploadImage == null ? "" :   request.files.add(await http.MultipartFile.fromPath('id_proof', file));
      print(file);
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          print('The image response is ${responseDecode}');
          CommonToast(context: context, title: 'something wrong', alignCenter: false);
        }else{
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
          print('The image response else is ${responseDecode}');
        }
      }
      else {
        print(response.reasonPhrase);
      }
    }catch(e){
      print(e);
    }

  }
}

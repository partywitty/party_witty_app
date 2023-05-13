// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Streaming.dart';
import '../ApiServices/api_link.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class artistAddress extends StatefulWidget {
  const artistAddress({Key? key}) : super(key: key);

  @override
  State<artistAddress> createState() => _artistAddressState();
}

class _artistAddressState extends State<artistAddress> {

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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            child: Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height * 0.5,
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
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      width: width,
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
                            const SizedBox(height: 20),
                            Text('  Address', style: GoogleFonts.poppins(textStyle: bigTitle)),
                            const SizedBox(height: 5.0),
                            const Text('  Flat No./House No.',style: textLabel),
                            const SizedBox(height: 2.0),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter house no.';
                                }
                                return null;
                              },
                              controller: houseNo,
                              keyboardType: TextInputType.phone,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 10,),
                            const Text('  Landmark',style: textLabel),
                            const SizedBox(height: 2.0),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter landmark';
                                }
                                return null;
                              },
                              controller: landmark,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 10,),
                            const Text("  State", style: textLabel),
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
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: width * 0.38,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text('  Town /city', style: textLabel),
                                      const SizedBox(height: 2.0),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter city';
                                          }
                                          return null;
                                        },
                                        controller: town,
                                        style: textFill,
                                        decoration: inputDecoration(context)
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                SizedBox(
                                  width: width * 0.35,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const Text('  Pin Code', style: textLabel),
                                      const SizedBox(height: 2.0),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter pincode';
                                          }else if (pinCode.text.length < 6){
                                            return 'Please enter pincode';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                          LengthLimitingTextInputFormatter(6)],
                                        controller: pinCode,
                                        keyboardType: TextInputType.phone,
                                        style:textFill,
                                        decoration: inputDecoration(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text("  Aadhar no",style: textLabel),
                            const SizedBox(height: 2.0),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter aadhar no.';
                                }
                                return null;
                              },
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(12)],
                              controller: adhar,
                              keyboardType: TextInputType.number,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 10),
                            const Text("  ID Proof Image", style: textLabel),
                            const SizedBox(height: 2.0),
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
                                suffixIcon: Image.asset(
                                  'assests/id_proof.png',
                                  scale: 4,
                                ),),
                            ),
                            const SizedBox(height: 20),

                            const Text("  ID passport Image", style: textLabel),
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
                                suffixIcon: Image.asset(
                                  'assests/id_proof.png',
                                  scale: 4,
                                ),),
                            ),

                            const Text("  ID number", style: textLabel),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter aadhar no.';
                                }
                                return null;
                              },
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(12)],
                              controller: adhar,
                              keyboardType: TextInputType.number,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),

                            const Text("  ID pan card Image", style: textLabel),
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
                                suffixIcon: Image.asset(
                                  'assests/id_proof.png',
                                  scale: 4,
                                ),),
                            ),

                            isLoading ?
                            const Center(child: CircularProgressIndicator(color: appColor,)) :
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  if(_formKey.currentState!.validate()){
                                    if(_uploadImage == null){
                                      CommonToast(context: context, title: 'please upload file', alignCenter: false);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }else{
                                      StreamingApi().address_submit(
                                        flat: houseNo.text,
                                        landmark: landmark.text,
                                        state: state.text,
                                        city: town.text,
                                        pinCode: pinCode.text,
                                        adhar: adhar.text,
                                        file: upImage.path,
                                        context: context
                                      ).then((value) {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      });
                                    }
                                  }else{
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: const Text('Submit', style: buttonText),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

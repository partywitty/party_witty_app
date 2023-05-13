import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../Auth/oto_page.dart';
import '../Controller/SharePre.dart';
import '../Controller/utils.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;

class googleSiging extends StatefulWidget {
  String? name,email,id;
  googleSiging({Key? key,this.name,this.email,this.id}) : super(key: key);

  @override
  State<googleSiging> createState() => _googleSigingState();
}

class _googleSigingState extends State<googleSiging> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController whatsApp=TextEditingController();

  var gender;
  var male;
  bool isLoading = false;

  bool _passwordVisible = false;
  String dropdownvalue = '+91';
  var items = ['+91', '+92', '+93', '+94', '+95'];

  @override
  void initState() {
    // TODO: implement initState
    name.text = widget.name.toString();
    email.text = widget.email.toString();
    getToken();
    super.initState();
  }
  bool addWhatsApp = false;
  String? token;
  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    print('The generated Token is ${token}');
    return token;
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.black,
        title: Text("Sign Up",style: appBarText),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      left: 20.0, bottom: 1.0, top: 40),
                  child: Text('Full Name',style: textLabel),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter full name';
                    }
                    return null;
                  },
                  controller: name,
                  style: textFill,
                  decoration: inputDecoration(context),
                ),
                const SizedBox(height: 18,),
                const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 1.0,),
                  child: Text('Phone Number',style: textLabel),
                ),
                Container(
                  //height: 50,
                  // width: 300,
                  decoration: (BoxDecoration(
                      color: const Color(0xFF434445),
                      borderRadius: BorderRadius.circular(30))),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
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
                                      style: TextStyle(color: Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                      value: dropdownvalue,
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
                                          dropdownvalue = newValue!;
                                          print(dropdownvalue);
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
                                    }else if (number.text.length < 10){
                                      return 'Please enter correct number';
                                    }
                                    return null;
                                  },
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10)],
                                  controller: number,
                                  autofocus: false,
                                  keyboardType: TextInputType.number,
                                  style: textFill,
                                  decoration: InputDecoration(
                                    hintText: 'Phone Number',
                                    hintStyle: textHint,
                                    contentPadding:
                                    const EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 6.0,
                                        top: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF434445)),
                                      borderRadius:
                                      BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF434445)),
                                      borderRadius:
                                      BorderRadius.circular(25.7),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      )
                    ],
                  ),
                ),


                const SizedBox(height: 15.0),
                InkWell(
                  onTap: (){
                    setState(() {
                      addWhatsApp = true;
                    });
                  },
                  child: Row(
                    children: const [
                      SizedBox(width: 15.0),
                      Text("""Same WhatsApp number""" ,style: textLabel),
                      SizedBox(width: 10.0),
                      Icon(Icons.add,color: Colors.white,size: 24),
                    ],
                  ),
                ),
                const SizedBox(height: 5.0),
                Visibility(
                  visible: addWhatsApp,
                  child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)],
                      controller: whatsApp,
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      style: textFill,
                      decoration: inputDecoration(context)
                  ),
                ),


                const Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                    left: 20,
                  ),
                  child: Text('Gender',style: textLabel),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            gender='female' ;
                            // male = !male;
                            print(gender);
                            // male = !male;
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Color(0xFF434445),
                              border: Border.all(
                                  color: gender=='female'
                                      ? Colors.red
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 3),
                                child: Container(
                                  height: 45,
                                  width: 35,
                                  child: Image.asset(
                                    'assests/female_img.png',
                                    fit: BoxFit.contain,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF434445),
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                ),
                              ),
                              Text(
                                'Female',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: () {
                          setState(() {
                            gender='male';
                            print(gender);
                          });
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Color(0xFF434445),
                              border: Border.all(
                                  color:   gender=='male'
                                      ? Colors.red
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 3),
                                child: Container(
                                  height: 46,
                                  width: 45,
                                  child: Image.asset(
                                    'assests/boy_img.png',
                                    fit: BoxFit.contain,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Color(0xFF434445),
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                ),
                              ),
                              Text(
                                'Male',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 8,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    bottom: 1.0,
                    top: 20,
                  ),
                  child: Text('Email',style: textLabel),
                ),
                TextFormField(
                  validator: (mailVali) {
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regExp = RegExp(pattern);
                    if (mailVali!.isEmpty) {
                      return "Please enter your valid email address";
                    } else if (!(regExp.hasMatch(mailVali))) {
                      return "Email must be end from @gmail.com";
                    } else {
                      return null;
                    }
                  },
                  controller: email,
                  autofocus: true,
                  style: textFill,
                  decoration: inputDecoration(context),
                ),
                const SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 1.0,
                  ),
                  child: Text('Password',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white)),
                ),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  controller: password,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  obscureText: !_passwordVisible,
                  style: textFill,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF434445),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off,
                          color: Colors.white54, size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.only(
                          left: 25.0, bottom: 6.0, top: 0.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF434445)),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:Color(0xFF434445)),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.7),
                          borderSide: const BorderSide(width: 1,color: Color(0xFF434445)),gapPadding: 0)
                  ),
                ),

                // TextFormField(
                //     validator: (value) {
                //       if (value == null || value.isEmpty) {
                //         return 'Please enter password';
                //       }
                //       return null;
                //     },
                //     controller: password,
                //     autofocus: false,
                //     keyboardType: TextInputType.text,
                //     // controller: _userPasswordController,
                //     obscureText: !_passwordVisible,
                //     style: textFill,
                //     decoration: inputDecoration(context,
                //       suffixIcon: IconButton(
                //         icon: Icon(
                //           // Based on passwordVisible state choose the icon
                //           _passwordVisible
                //               ? Icons.visibility_outlined
                //               : Icons.visibility_off,
                //           color: Colors.white54, size: 18,
                //         ),
                //         onPressed: () {
                //           setState(() {
                //             _passwordVisible = !_passwordVisible;
                //           });
                //         },
                //       ),)
                // ),
                const SizedBox(height: 40,),
                /// sign up button
                isLoading ?
                const Center(child: CircularProgressIndicator()) :
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if(gender == null){
                        CommonToast(context: context, title: "Please select gender", alignCenter: false);
                      }else{
                        if(_formKey.currentState!.validate()){
                          googleSignUp(
                              userName: name.text,
                              coNumber: number.text,
                              gMender: gender.toString(),
                              pPassword: password.text,
                              whatsAppNo: whatsApp.text,
                              email: email.text,
                              context: context
                          );
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
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
                        borderRadius:
                        BorderRadius.all(Radius.circular(30.0)),
                      ),
                      child: Text('Submit',style: buttonText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future googleSignUp({
    required String email,
    required String userName,
    required String gMender,
    required String pPassword,
    required String whatsAppNo,
    required String coNumber,
    required BuildContext context,}) async {
    final _getUserDetail = GetUserDetail();
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.googleSiging));
      request.fields.addAll({
        'user_id': widget.id.toString(),
        'username':userName,
        'contact_no' : coNumber,
        'email' : email,
        'password' : pPassword,
        'watsapp_no' : whatsAppNo,
        'gender' : gMender,
        'fcm' : token.toString()
      });
      http.StreamedResponse response = await request.send();
      print("---------google  field------------${request.fields}---------------user--");
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: "something was wrong", alignCenter:false);
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Otp_page(),));
          print(responseDecode);
        }
        print(responseDecode);
      } else {
        CommonToast(context: context, title: "Internal Server Error", alignCenter:false);
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }
}

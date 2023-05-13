
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/api_link.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import 'forgetOtp.dart';

class forgetPassword extends StatefulWidget {
  const forgetPassword({Key? key}) : super(key: key);

  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  String userId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
                bottom: 5.0,
              ),
              child: Text('Email',style: textLabel),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter registered email';
                  }
                  return null;
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                style: textFill,
                decoration: inputDecorationSuffix(context),
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: GestureDetector(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    getOpt(
                      email: emailController.text,
                      context: context
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 50.0,
                  decoration: boxDecoration(),
                  child: Text('Submit', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future getOpt({
    required String email,
    required BuildContext context}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.forgetOtp));
      request.fields.addAll({
        'email':email,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: "Invalid Email", alignCenter:false);
        } else {
          userId = responseDecode["data"]["user"]['id'].toString();
          await responseDecode["data"]["user"]['id'].toString();
          Navigator.push(context, MaterialPageRoute(builder: (context) => forgetOtp(userId: responseDecode["data"]["user"]['id'].toString()),));
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


// ignore_for_file: camel_case_types
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/Streaming.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class streamPlatforms extends StatefulWidget {
  const streamPlatforms({Key? key}) : super(key: key);

  @override
  State<streamPlatforms> createState() => _streamPlatformsState();
}

class _streamPlatformsState extends State<streamPlatforms> {
  final _getUserDetail = GetUserDetail();
  TextEditingController spotifyController = TextEditingController();
  TextEditingController amazonController = TextEditingController();
  TextEditingController jioController = TextEditingController();
  TextEditingController appleController = TextEditingController();
  TextEditingController tidalController = TextEditingController();
  TextEditingController deezerController = TextEditingController();
  TextEditingController pandooraController = TextEditingController();
  TextEditingController quzolController = TextEditingController();


  load(){
    StreamingApi().getStreamingApi().then((value)  {
      var data = value.data;
      setState((){
        data!.spotifyUrl == null ? spotifyController.text : spotifyController.text = data.spotifyUrl!;
        data.amazonPrime == null ? amazonController.text : amazonController.text = data.amazonPrime!;
        data.jioSavan == null ? jioController.text : jioController.text = data.jioSavan!;
        data.appleMusic == null ? appleController.text : appleController.text = data.appleMusic!;
        data.tidel == null ? tidalController.text : tidalController.text = data.tidel!;
        data.deezer == null ? deezerController.text : deezerController.text = data.deezer!;
        data.pandoora == null ? pandooraController.text : pandooraController.text = data.deezer!;
        data.qubon == null ? quzolController.text : quzolController.text = data.qubon!;
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
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          Text("Streaming platforms",style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10),
          TextFormField(
            controller: spotifyController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            style: textFill,
            decoration: inputDecorationSuffix(context,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assests/spotify.png',
                      width: 10,height: 10,fit: BoxFit.contain),
                )),
          ),
          const SizedBox(height: 15.0,),
          TextFormField(
            controller: amazonController,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            style: textFill,
            decoration: inputDecorationSuffix(context,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assests/am.png',
                      width: 10,height: 10,fit: BoxFit.contain),
                )),
          ),
          const SizedBox(height: 15.0,),
          TextFormField(
              controller: jioController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: inputDecorationSuffix(context,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assests/jio.png',
                        width: 10,height: 10,fit: BoxFit.contain),
                  ))
          ),
          const SizedBox(height: 15.0,),
          TextFormField(
              controller: appleController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: inputDecorationSuffix(context,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assests/app.png',
                        width: 10,height: 10,fit: BoxFit.contain),
                  ))
          ),
          const SizedBox(height: 15.0,),
          TextFormField(
              controller: tidalController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: inputDecorationSuffix(context,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assests/tid.png',
                        width: 10,height: 10,fit: BoxFit.contain),
                  ))
          ),
          const SizedBox(height: 15.0,),
          TextFormField(
              controller: deezerController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: inputDecorationSuffix(context,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assests/deezer.png',
                        width: 10,height: 10,fit: BoxFit.contain),
                  ))
          ),
          const SizedBox(height: 15.0,),
          TextFormField(
              controller: pandooraController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: inputDecorationSuffix(context,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assests/pandoora.png',
                        width: 10,height: 10,fit: BoxFit.contain),
                  ))
          ),
          const SizedBox(height: 15.0,),
          TextFormField(
              controller: quzolController,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              style: textFill,
              decoration: inputDecorationSuffix(context,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assests/qzo.png',
                        width: 10,height: 10,fit: BoxFit.contain),
                  ))
          ),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: () {
             stream_submit(
                  spotify: spotifyController.text,
                  amazon: amazonController.text,
                  jio: jioController.text,
                  apple: appleController.text,
                  tidel: tidalController.text,
                  deezer: deezerController.text,
                  pandoora: pandooraController.text,
                  qubon: quzolController.text,
                  context: context).whenComplete(() {
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
  Future stream_submit({
    required String spotify,
    required String amazon,
    required String jio,
    required String apple,
    required String tidel,
    required String deezer,
    required String pandoora,
    required String qubon,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.getStreaming));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'spotify_url':spotify,
        'amazon_prime':amazon,
        'jio_savan':jio,
        'apple_music':apple,
        'tidel':tidel,
        'deezer': deezer,
        'pandoora': pandoora,
        'qubon': qubon,
        'end_page' : "not update"
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'User name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
        }
        // isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      //isLoading.value = false;
      CommonToast(context:'', title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }
}

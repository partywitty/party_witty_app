
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({Key? key}) : super(key: key);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  String locationMessage = 'current location of the message';

  late String lat;
  late String log;
  Future<Position> getCurrentLocation () async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location service disable');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("Location permission are denied");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location permission permaneere denida");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 50.0,),
            Image.asset('assests/singer2.png',fit: BoxFit.fill,),
            const SizedBox(height: 10.0,),
            Text("Tell us your location",style: GoogleFonts.poppins(textStyle: extraBold),textAlign: TextAlign.center),
            const SizedBox(height: 5.0,),
            Text("This helps us recommend the best clubs and restaurants offers around you",style: GoogleFonts.poppins(textStyle: cardSubTitle),textAlign: TextAlign.center),
            const SizedBox(height: 20.0,),
            InkWell(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (){
                getCurrentLocation().then((value) {
                  lat = "${value.latitude}";
                  log = "${value.longitude}";
                  print(lat);
                  print(log);
                  setState(() {
                    locationMessage = "Latitude : $lat, longitude : $log";
                  });
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    decoration: boxDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.my_location,color: Colors.white,size: 24,),
                        Text("Auto Detect My Location",style: appBarText,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),

            Text(locationMessage,style: GoogleFonts.poppins(textStyle: extraBold),textAlign: TextAlign.center),
           // Text("No, I will type my location every time",style: GoogleFonts.poppins(textStyle: blackUnderLine),textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

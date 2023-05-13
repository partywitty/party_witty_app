import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../ApiServices/login_api.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Screens/bottomSheet.dart';
import 'Login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetUserDetail _userId = GetUserDetail();
  @override
  // void initState(){
  //   Future.delayed(const Duration(seconds: 1)).then((value) {
  //     _userId.getUserData('id').then((value) {
  //       print("id -------------------$value");
  //       if(value=='null'){
  //         Get.offAll(login());
  //       }else if(value != 'null' && statusCheck == "service_agreement"){
  //         Get.offAll(bottomSheet());
  //       }else{
  //         Get.offAll(login());
  //       }
  //      });
  //   }) ;
  //   LoginCont().loginStatus().then((value){
  //     setState(() {
  //       setState(() {
  //         statusCheck = value['data']['end_page'];
  //         print("--------------------${statusCheck}--------------------------");
  //       });
  //     });
  //   });
  //   super.initState();
  // }
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      _userId.getUserData('id').then((value) {
        if(value=='null'){
          Get.offAll(const login());
        }else if(value != 'null' && statusCheck == "artist-profile"){
           Get.offAll(const bottomSheet());
        }else{
          Get.offAll(const login());
        }
      });
    });
    // TODO: implement initState
    super.initState();
    load();
  }
  var statusCheck;

  load() async {
    final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    DataManager.getInstance().setUserType(sharedpreferences.getString('user_type'));
    DataManager.getInstance().setName(sharedpreferences.getString('name'));
    DataManager.getInstance().setEmail(sharedpreferences.getString('email'));
    DataManager.getInstance().setNumber(sharedpreferences.getString('number'));
    DataManager.getInstance().setProfile(sharedpreferences.getString('profileId'));
    LoginCont().loginStatus().then((value){
      setState(() {
        statusCheck = value['data']['end_page'];
        print(statusCheck);
      });
    });
  }

  getValidation() async {
    final SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
    DataManager.getInstance().setUserType(sharedpreferences.getString('user_type'));
    DataManager.getInstance().setName(sharedpreferences.getString('name'));
    // if (Uid == null) {
    //   Timer(
    //       const Duration(seconds: 3),
    //           () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //           builder: (BuildContext context) => login()))
    //   );
    // } else {
    //   Timer(
    //       const Duration(seconds: 3),
    //           () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //           builder: (BuildContext context) => bottomSheet())));
    // }
    // setState(() {});
    // print(Uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:SizedBox(
            width: 305,
            height: 139.86,
            child: Image.asset('assests/img.png',fit: BoxFit.fill),
      ),),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//           title: Text("Radial Speed Meter Gauge"),
//           backgroundColor: Colors.deepOrangeAccent,
//         ),
//         body: Container(
//           alignment: Alignment.center,
//           height:250,
//           child: SizedBox(
//             width:250, height:250, //height and width of guage
//             child:SfRadialGauge(
//                 title: GaugeTitle(text: "Speed Meter"), //title for guage
//                 enableLoadingAnimation: true, //show meter pointer movement while loading
//                 animationDuration: 4500, //pointer movement speed
//                 axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
//                   RadialAxis(
//                       minimum: 0,maximum: 15,
//                       ranges: <GaugeRange>[ //Guage Ranges
//                         GaugeRange(startValue: 0,endValue: 5, color: const Color(0xFF7AFF77), startWidth: 10,endWidth: 10),
//                         GaugeRange(startValue: 5,endValue: 10,color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
//                         GaugeRange(startValue: 10,endValue: 15,color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
//                       ],
//                       pointers: const <GaugePointer>[
//                         /// pointer dynamic value
//                         NeedlePointer(value:8,
//                         needleColor: Colors.grey,
//                         )
//                       ],
//                       annotations: <GaugeAnnotation>[
//                         GaugeAnnotation(
//                             widget: Text('₹',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold)),
//                             angle: 90,
//                             positionFactor: 0.5),
//                         //add more annotations 'texts inside guage' here
//                       ]
//                   )]
//             ),
//           ),
//         )
//     );
//   }
// }
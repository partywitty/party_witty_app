
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Club/Club_Home.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import '../ArtistScreen/Artist_list.dart';
import '../ArtistScreen/ComingSoon.dart';
import '../ArtistScreen/artist_request.dart';
import '../ArtistScreen/requestEvent.dart';
import '../CalanderScreen/calanderMain.dart';
import '../Controller/DataManager.dart';
import '../Controller/NotificationServece.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../ScheduleScreen/ShowScreen.dart';
import '../ScheduleScreen/totalBookings.dart';

class bottomSheet extends StatefulWidget {
  const bottomSheet({Key? key}) : super(key: key);

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  int currentTab = 0;
  final _getUserDetail = GetUserDetail();
  String? artistRole;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNoti.initialize(context);
    LocalNoti.diplay;
   // PushNotification().setUpNotification();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print("onMessageOpenedApp : $message---------------------------------------");
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //   //  Navigator.push(context, MaterialPageRoute(builder: (context) => Artist_request(),));
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode.toInt(),
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             icon: android.smallIcon,
    //             channelShowBadge: true,
    //             // other properties...
    //           ),
    //         ));
    //   }
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print("onMessageOpenedApp : $message---------------------------------------");
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode.toInt(),
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             icon: android.smallIcon,
    //             channelShowBadge: true,
    //             // other properties...
    //           ),
    //         ));
    //   }
    // });
    print("role---------------------${DataManager.getInstance().getUserType()}");
  }
  @override
  void didChangeDependencies() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      String rawJson = message?.data['body'];
      print("--------------------------------------------------$rawJson");
      // if (message?.data['navigate_to'] == "Artist_request") {
      //   Get.to(Artist_request());
      // }else{
      //   Get.to(Artist_list());
      // }
    });

    FirebaseMessaging.onMessage.listen((message) {
      // if (message.notification != null) {
      print("USER NOTIFICATION DATA");
      // print('@@@@@@@ body ${message.notification!.body}');
      print('The Message is ${message.data}');
      // print('@@@@@@@ title ${message.notification!.title}');
      print("USER NOTIFICATION DATA");
      LocalNoti.diplay(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
        if (message.data['navigate_to'] == "Artist_request") {
          print('BACKGROUND open on tap screen is <---------> artist request ----------- ${message.data}');
          Get.to(Artist_request());
        } else {
          print('BACKGROUND open on tap screen is <---------> Artist List ----------- ${message.data}');
          Get.to(Artist_list());
        }
        print('response notification body ${message.data}');
      },
    );
    super.didChangeDependencies();
  }
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int index = 0;
  bool isSelect = false;
  OtpFieldController otpController = OtpFieldController();
  // List screen=[
  //   // calenderScreen(),
  //   // Booking_request(),
  //   DataManager.getInstance().getUserType() == "Artist" ?  calenderScreen() : ClubHomePage(),
  //   DataManager.getInstance().getUserType() == "Artist" ?  Artist_request() : Event_page(),
  //   DataManager.getInstance().getUserType() == "Artist" ?  artistEvent() : Event_page(),
  //  // Event_page(),
  //   Wallet_page(),
  //   requestAndEvent(),
  // //  calenderScreen(),
  // ];
  final List<Widget> screens = [
    DataManager.getInstance().getUserType() == "Artist" ? const calenderScreen() : const ClubHomePage(),
    DataManager.getInstance().getUserType() == "Artist" ? const Artist_request() :  const numberOfBooking(),
    //const ShowDetails(),
    // const ClubHomePage(),
     const comingSoonScreen(),
    const requestAndEvent(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen  =  DataManager.getInstance().getUserType() == "Artist" ? const calenderScreen() : const ClubHomePage();
  DateTime backPress = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async{
          final timeGap = DateTime.now().difference(backPress);
          final cantExit = timeGap >= const Duration(seconds: 2);
          backPress = DateTime.now();
          if(cantExit){
            const snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
            ScaffoldMessenger.of(context).showSnackBar(snack);
            return false;
          }else{
            return true;
          }
        },
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: mColor,
          onPressed: (){
            setState(() {
              currentScreen = const ShowDetails();
            });
          },
          child: CircleAvatar(
              backgroundColor: mColor,
              radius: 25,
              child: Image.asset("assests/middle.png",width: 30,height: 30,fit: BoxFit.fill)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            margin: const EdgeInsets.only(right: 10.0,bottom: 10.0,left: 10.0),
            decoration: BoxDecoration(
              color: footerColor,
              borderRadius: BorderRadius.circular(30.0)
            ),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = DataManager.getInstance().getUserType() == "Artist" ? const calenderScreen() : const ClubHomePage();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 7.0),
                          Image.asset("assests/home.png",
                              width: 20,height: 20,fit: BoxFit.fill,color: currentTab == 0 ? Colors.white : Colors.grey),
                          const SizedBox(height: 3.0),
                          Text("Home", style: TextStyle(color: currentTab == 0 ? Colors.white : Colors.grey,fontSize: 14))
                        ],
                      ),
                    ),
                    MaterialButton(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: (){
                        setState(() {
                          currentScreen = DataManager.getInstance().getUserType() == "Artist" ? const Artist_request() :  const numberOfBooking();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 7.0),
                          Image.asset("assests/booking.png",
                              width: 22,height: 22,fit: BoxFit.fill,color: currentTab == 1 ? Colors.white : Colors.grey),
                          const SizedBox(height: 3.0),
                          Text("Request",style: TextStyle(color: currentTab == 1 ? Colors.white : Colors.grey,fontSize: 14),)
                        ],
                      ),
                    ),
                  ],
                ),
                ///right tab button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        minWidth: 40,
                        onPressed: (){
                          setState(() {
                            currentScreen = const comingSoonScreen();
                            currentTab = 2;
                          });
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 7.0),
                            Image.asset("assests/podcast.png",
                                width: 22,height: 22,fit: BoxFit.fill,color: currentTab == 2 ? Colors.white : Colors.grey),
                            const SizedBox(height: 3.0),
                            Text("Podcast", style: TextStyle(color: currentTab == 2 ? Colors.white : Colors.grey,fontSize: 14))
                          ],
                        )
                    ),
                    MaterialButton(
                        minWidth: 40,
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        onPressed: (){
                          setState(() {
                            currentScreen = const requestAndEvent();
                            currentTab = 3;
                          });
                        },
                        child: Column(
                          children: [
                            const SizedBox(height: 7.0),
                            Image.asset("assests/profile.png",
                                width: 20,height: 20,fit: BoxFit.fill,color: currentTab == 3 ? Colors.white : Colors.grey),
                            const SizedBox(height: 3.0),
                            Text("Profile",style: TextStyle(color: currentTab == 3 ? Colors.white : Colors.grey,fontSize: 14))
                          ],
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

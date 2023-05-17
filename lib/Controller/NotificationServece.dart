
// ignore_for_file: prefer_const_constructors

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import '../ArtistScreen/artist_request.dart';

class LocalNoti {
  static final FlutterLocalNotificationsPlugin _notiplugin = FlutterLocalNotificationsPlugin();

  static void initialize(context) {
    final InitializationSettings initializesettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    _notiplugin.initialize(
      initializesettings,
      // onSelectNotification
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        print('The App bar is clicked');
        print('The Response in the notification is ${notificationResponse.payload.toString()}');
        Get.to(Artist_request());
        // if(notificationResponse.payload != null){
        //   print('The Null is Printed');
        //   print("--------------------------------------------${notificationResponse.payload.toString()}");
        //   Map bodyMap = json.decode(notificationResponse.payload.toString());
        //   if(bodyMap['navigation']=="VideoCallScreen"){
        //    // Get.to(()=> VideoScreen(booking_id:bodyMap['booking_id'].toString()));
        //     print('The videoCall calling push notify is ${bodyMap['booking_id'].toString()}');
        //     print('The videoCall ---------------------------------- ${bodyMap['booking_id'].toString()}------------');
        //   }else{
        //     // Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     //   return AcceptRejectScreen(
        //     //       name: bodyMap['name'],
        //     //       categoryName: bodyMap['category'],
        //     //       book_id: bodyMap['booking_id'].toString());
        //     // }));
        //   }
        // }

        // print("The data received");
        //
        // print('The Data we get onTap is ${bodyMap}');
        // print("LOCAL ON TAP");
        // print('The My Navigate is ${bodyMap['navigation']}');
        // if(bodyMap['navigation']== "VideoCallScreen"){
        //   Get.to(()=> VideoScreen(booking_id: '1'));
        // }else{
        //   Navigator.push(context, MaterialPageRoute(builder: (context) {
        //     return AcceptRejectScreen(
        //         name: bodyMap['name'],
        //         categoryName: bodyMap['category'],
        //         book_id: bodyMap['booking_id'].toString());
        //   }));
        // }
      },
    );
  }

  // this method is for showing notification in forground.
  static void diplay(RemoteMessage message) async {
    try {
      print('The onTap is Called');
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    //  final sound = 'incoming_ring.mp3';
      final NotificationDetails notificationdetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'party_witty_channel_id',
              'party witty',
          importance: Importance.high,
          priority: Priority.high,
          // playSound: true,
         // sound: RawResourceAndroidNotificationSound(sound.split('.').first),

        ),
      );
      String rawJson = message.data['body'];
      print('The Raw Json Body is ${rawJson}');
      print('The Raw Json Push Notification Data is ${rawJson}');
      await _notiplugin.show(id, message.notification!.title,
        message.notification!.body, notificationdetails,
        payload: rawJson,
//  message.data['body']['name'] + '/'+ message.data['body']['category']
      );
    } on Exception catch (e) {
      print('LLLLLLLL $e',);
    }
  }
}

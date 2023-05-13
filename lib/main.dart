import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Auth/Login.dart';
import 'package:flutter_app/Auth/register_page.dart';
import 'package:flutter_app/ArtistScreen/Artist_list.dart';
import 'package:flutter_app/ArtistRagistration/Artist_type.dart';
import 'package:flutter_app/Screens/Days_page.dart';
import 'package:flutter_app/ClubRagistration/Floorwise_page.dart';
import 'package:flutter_app/Screens/Full_band.dart';
import 'package:flutter_app/ArtistRagistration/Message.dart';
import 'package:flutter_app/Screens/Music_days_page.dart';
import 'package:flutter_app/ArtistRagistration/Service.dart';
import 'package:flutter_app/ArtistRagistration/Streaming.dart';
import 'package:flutter_app/ArtistRagistration/Upload_clubs.dart';
import 'package:flutter_app/ArtistRagistration/Upload_Bands.dart';
import 'package:flutter_app/ArtistRagistration/Upload_Celebs.dart';
import 'package:flutter_app/ArtistRagistration/Upload_photograph.dart';
import 'package:flutter_app/Auth/about.dart';
import 'package:flutter_app/ClubRagistration/address_page.dart';
import 'package:flutter_app/Screens/amount.dart';
import 'package:flutter_app/Auth/artist.dart';
import 'package:flutter_app/Club/Club_Home.dart';
import 'package:flutter_app/ArtistScreen/artist_request.dart';
import 'package:flutter_app/ArtistRagistration/bank_page.dart';
import 'package:flutter_app/Screens/booking_request.dart';
import 'package:flutter_app/Screens/bottomSheet.dart';
import 'package:flutter_app/Screens/club_page_home.dart';
import 'package:flutter_app/Screens/colifornia_party.dart';
import 'package:flutter_app/Screens/create_event.dart';
import 'package:flutter_app/Screens/dialog_feild.dart';
import 'package:flutter_app/Screens/live_match_page.dart';
import 'package:flutter_app/ClubRagistration/projecte_page.dart';
import 'package:flutter_app/Screens/solo_instrument.dart';
import 'package:flutter_app/ArtistRagistration/original_song.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'Auth/artistReferral.dart';
import 'ArtistRagistration/artist_address.dart';
import 'Auth/splash_screen.dart';
import 'Controller/style.dart';
import 'Screens/CreateOffer.dart';
import 'Screens/EventPage.dart';
import 'Screens/Product_quantity_page (1).dart';
import 'ClubRagistration/dance_floor_page.dart';
import 'ArtistRagistration/fb_message.dart';
import 'Screens/filter.dart';
import 'ClubRagistration/guest.dart';
import 'Screens/manager_page.dart';
import 'ArtistRagistration/music_type.dart';
import 'Screens/musical_night_page.dart';
import 'Screens/offerDetails.dart';
import 'Screens/offer_tile_page.dart';
import 'Screens/offers_page.dart';
import 'ClubRagistration/photographer_page.dart';
import 'ArtistRagistration/prefer_city.dart';
import 'Screens/product_create_page.dart';
import 'Screens/product_name.dart';
import 'Screens/send_request.dart';
import 'Screens/sound_page.dart';
import 'ClubRagistration/sponsor_page.dart';
import 'Screens/sponsorship_page.dart';
import 'ArtistRagistration/cover_songs.dart';
import 'ArtistRagistration/upload_video.dart';
import 'ArtistRagistration/venue_perform.dart';
import 'Screens/wallet.dart';



Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint('<--backgroundHandler-->');
   debugPrint("${message.data.toString()}------------back ");
   debugPrint(message.notification!.title);
  await Firebase.initializeApp();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = appColor
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
Future<void> main() async {
  configLoading();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  Paint.enableDithering = true;
  if (Platform.isAndroid) {
    //setOptimalDisplayMode();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Party Witty Heart",
      initialRoute: '/',
      builder: EasyLoading.init(),
      routes: {
         '/': (context) => SplashScreen(),
        '/login': (context) => const login(),
        '/register': (context) => SignUp(),
        '/artistReferral': (context) => artistReferral(),
        '/artist': (context) => const artist(),
        '/artist_list': (context) =>const Artist_list(),
        '/Artist_request': (context) =>const Artist_request(),
        '/artist_type': (context) =>const Artist_type(),
        '/music_type': (context) => Music_type(),
        '/venue_music': (context) =>const Venue_music(),
        '/introMessage': (context) =>const introMessage(),
        '/stream': (context) =>const Streamup(),
        '/fb': (context) =>const FaceBook(),
        '/Upload_photograph': (context) =>const Upload_photograph(),
        '/upload_video': (context) =>const Upload_video(),
        '/upload_cover_song': (context) =>const CoverSongs(),
        '/upload_song': (context) =>const originalSong(),
        '/upload_celebs': (context) =>const Upload_Celebs(),
        '/upload_band': (context) =>const Upload_Bands(),
        '/upload_clubs': (context) =>const Upload_clubs(),
        '/solo': (context) =>const Solo_instrument(),
        '/full_band': (context) =>const Full_Bands(),
        '/service': (context) =>const Service(),
        '/address_page': (context) =>const Address_page(),
        '/prefer_city': (context) =>const Prefer_city(),
        '/bank_page': (context) =>const Bank_page(),
        '/booking_request': (context) =>const Booking_request(),
        '/artist_home_page': (context) =>const ClubHomePage(),
        '/dialog_field': (context) =>const Dialog_field(),
        '/bottomSheet': (context) =>const bottomSheet(),
        '/send_request': (context) =>const Send_request(),
        '/about_page': (context) =>const About_page(),
        '/sd': (context) =>Filter_page(artistId: ''),
        '/colifornia': (context) =>const Colifornia(),
        '/club_page_home': (context) =>const Club_page_home(),
        '/wallet_page': (context) =>const Wallet_page(),
        '/amount': (context) =>const Amount(),
        '/sound_page': (context) =>const sound_page(),
        '/manager_page': (context) =>const Manager_page(),
        '/guest_page': (context) =>const Guest_page(),
        '/projected_page': (context) =>const Projected_page(),
        '/live_match_page': (context) =>const Live_match_page(),
        '/dance_page': (context) =>const Dance_page(),
        '/photographer_page': (context) =>const Photographer_page(),
        '/musical_page': (context) =>const Musical_page(),
        '/sponsor_page': (context) =>const Sponsor_page(),
        '/sponsorship_page': (context) =>const Sponsorship_page(),
        '/offers_page': (context) =>const Offers_page(),
        '/Days_page': (context) =>const Days_page(),
        '/music_days_page': (context) =>const Music_days_page(),
        '/create_event': (context) =>const Create_event(),
        '/artistAddress': (context) =>const artistAddress(),
        '/floorwise_page': (context) =>const Floorwise_page(),
        '/event_page': (context) =>const Event_page(),
        '/product_quantity': (context) =>const Product_quantity(),
        '/create_product': (context) =>const Create_product(),
        '/product_name': (context) =>Product_name(user_id: ''),
        '/offer_detail': (context) =>const Offer_detail(),
        '/create_offer': (context) =>const Create_offer(),
        '/offer_tile': (context) =>const Offer_tile(),
      },
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/Modal/artistSubtypeM.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../ArtistRagistration/Band_Videos.dart';
import '../ArtistRagistration/Club_Video.dart';
import '../ArtistRagistration/Streaming.dart';
import '../ArtistRagistration/Upload_Bands.dart';
import '../ArtistRagistration/brandVideos.dart';
import '../ArtistRagistration/brands_Photos.dart';
import '../ArtistRagistration/budgetSummary.dart';
import '../ArtistRagistration/languageScreen.dart';
import '../ArtistRagistration/managerDetails.dart';
import '../ArtistRagistration/music_type.dart';
import '../ArtistRagistration/origianalAudio.dart';
import '../ArtistRagistration/photo_with_caption.dart';
import '../ArtistRagistration/prefer_city.dart';
import '../ArtistRagistration/videoCover.dart';
import '../ArtistRagistration/youPlay.dart';
import '../Auth/artist.dart';
import '../Auth/artistReferral.dart';
import '../ArtistRagistration/artist_address.dart';
import '../Auth/register_page.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../ArtistScreen/Artist_list.dart';
import '../ArtistRagistration/Artist_type.dart';
import '../ArtistRagistration/Message.dart';
import '../ArtistRagistration/Service.dart';
import '../ArtistRagistration/Upload_clubs.dart';
import '../ArtistRagistration/Upload_Celebs.dart';
import '../ArtistRagistration/Upload_photograph.dart';
import '../ArtistRagistration/bank_page.dart';
import '../Screens/bottomSheet.dart';
import '../ArtistRagistration/fb_message.dart';
import '../ArtistRagistration/cover_songs.dart';
import '../ArtistRagistration/original_song.dart';
import '../ArtistRagistration/upload_video.dart';
import '../ArtistRagistration/venue_perform.dart';
import 'api_link.dart';

class LoginCont extends GetxController {
  RxBool isLoading = false.obs;
  String userId = '';
  String endPage = '';
  String role = '';
  String otp = '';
  String subCategoryId = '';

  final get_user_detail = GetUserDetail();
  final _getUserDetail = GetUserDetail();

  Future login_Api({required String email,required String password,required String fcmToken, required BuildContext context,}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.login));
      request.fields.addAll({
        'password': password,
        'email':email,
        'fcm' : fcmToken
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
         CommonToast(context: context, title: responseDecode['message'], alignCenter:false);
        } else {
          userId = responseDecode["data"]["id"].toString();
          endPage = responseDecode['data']['end_page'];
          SharePre.setUserType(responseDecode['data']['role']);
          SharePre.setName(responseDecode['data']['username']);
          SharePre.setEmail(responseDecode['data']['email']);
          SharePre.setNumber(responseDecode['data']['contact_no']);
          SharePre.setProfileId(responseDecode['data']['profile_id'].toString());
          DataManager.getInstance().setUserType(responseDecode['data']['role']);
          DataManager.getInstance().setName(responseDecode['data']['username']);
          DataManager.getInstance().setEmail(responseDecode['data']['email']);
          DataManager.getInstance().setNumber(responseDecode['data']['contact_no']);
          DataManager.getInstance().setProfile(responseDecode['data']['profile_id'].toString());
          subCategoryId = responseDecode["data"]["artists_type_id"].toString();
          await get_user_detail.setUserData("id", userId);
          await get_user_detail.setUserData("endPage", endPage);
          //await get_user_detail.setUserData("role", role);
          print("----------------------$userId");
          print('-----------------------$endPage');
          if(endPage == 'artist_type'){
            Get.offAll(Artist_type());
          }else if (endPage == 'null'){
            Get.offAll(artist());
          } else if (endPage =='artist_hire'){
            Get.offAll(artist());
          }else if (endPage == 'referral_code'){
            Get.offAll(artistReferral());
          }else if(endPage=='list_of_artist'){
            Get.offAll(Artist_list());
          }else if(endPage=='multiple-Photographs'){
            Get.offAll(captionPhotos());
          }else if(endPage=='venue'){
            Get.offAll(Venue_music());
          }else if(endPage=='genre'){
            Get.offAll(Music_type());
          }else if(endPage=='intromessage'){
            Get.offAll(introMessage());
          }else if(endPage=='photographs'){
            Get.offAll(Upload_photograph());
          }else if(endPage=='video-upload'){
            Get.offAll(Upload_video());
          }else if (endPage == 'stage'){
            Get.offAll(YouPlay(subCategoryId: subCategoryId.toString()));
          }else if(endPage == 'language'){
            Get.offAll(languageScreen());
          }else if(endPage == 'price_summary'){
            Get.offAll(budgetSummary());
          }else if(endPage ==  'city_budget'){
            Get.offAll(Prefer_city());
          }else if(endPage == 'managr_details'){
            Get.offAll(managerDetails());
          }else if(endPage == 'photo_with_celebs'){
            Get.offAll(Upload_Celebs());
          }else  if(endPage == 'photo_with_brands'){
            Get.offAll(brandPhotos());
          }else if(endPage == 'video_with_brands'){
            Get.offAll(brandVideo());
          }else if(endPage == 'photo_with_bands'){
            Get.offAll(Upload_Bands());
          }else if(endPage == 'video_with_bands'){
            Get.offAll(bandVideo());
          }else if(endPage == 'photo_with_club'){
            Get.offAll(clubVideos());
          }else if (endPage == 'video_with_club'){
            Get.offAll(Upload_clubs());
          }else if(endPage == 'audio_cover_song'){
            Get.offAll(CoverSongs());
          }else if(endPage == 'video_cover_song'){
            Get.offAll(videoCoverSong());
          }else if(endPage == 'original_video_song'){
            Get.offAll(originalSong());
          }else if(endPage == 'original_audio_song'){
            Get.offAll(originalAudio());
          }else if(endPage == 'streaming_platforms_song'){
            Get.offAll(Streamup());
          }else if (endPage == 'social_link'){
            Get.offAll(FaceBook());
          }else if (endPage == 'address'){
            Get.offAll(artistAddress());
          }else if (endPage == "otp"){
            Get.offAll(SignUp());
          }else if(endPage == 'bank_details'){
            Get.offAll(Bank_page());
          }else if (endPage == 'service_agreement'){
            Get.offAll(Service());
          }else{
            Get.offAll(bottomSheet());
          }
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      print(e);
    }
  }

  Future loginStatus() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId
    };
    final response = await post(Uri.parse(Api_link.logStatus),
     body: data1);
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}
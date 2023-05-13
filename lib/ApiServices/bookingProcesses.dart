
// ignore_for_file: use_build_context_synchronously

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:http/http.dart';
import '../Controller/SharePre.dart';
import '../Modal/getBookingDetailsM.dart';
import '../ScheduleScreen/bookingPolices.dart';

class ArtistBookingProcess {
  final _getUserDetail = GetUserDetail();
  Future<void> artistBookingApi({
        required BuildContext context,
        required bookDate,
        required bookSlot,
        required showStart,
        required showEnd,
        required soundCheck,
        required noBreak,
        required formation,
        required genres,
        required mainCourse,
        required starter,
        required alcoholic,
        required nonAlcoholic,
      }) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.bookArtistUrl));
      request.fields.addAll({
        'club_id': userId,
        'artist_id': "1",
        'book_date': bookDate,
        'book_slot': bookSlot,
        'show_start_time': showStart,
        'show_end_time': showEnd,
        'sound_check_time': soundCheck,
        'no_of_break': noBreak,
        'formation': formation,
        'genres': genres,
        'main_course': mainCourse,
        'starter': starter,
        'alcoholic_beverages': alcoholic,
        'non_alcoholic_beverages': nonAlcoholic,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Server Error', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Artist Booked', alignCenter: true);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const bookingPolicy(),));
        }
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      CommonToast(context:context, title: 'Internal Server Error', alignCenter: true);
      print(e);
    }
  }

  Future<GetBookingDetailsM> getBookingDetailsApi({profileId}) async {
    var data1 = {
      "book_id" : "1",
    };
    final response = await post(Uri.parse(Api_link.getBookArtistUrl),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GetBookingDetailsM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}
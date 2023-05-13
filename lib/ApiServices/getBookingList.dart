
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:get/get.dart';
import '../Controller/SharePre.dart';
import '../Modal/bookingListM.dart';

class GetBookingListApi extends GetxController {
  RxList<AllBookingModel> All_Booking_List = <AllBookingModel>[].obs;
  RxBool isLoading = false.obs;
  final _getUserDetail = GetUserDetail();
  Future<void> getBookingListApi() async {
    var userId = await _getUserDetail.getUserData('id');
    try {
      All_Booking_List.clear();
      isLoading.value = true;
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.getBookListUrl));
      request.fields.addAll({'club_id': userId,});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == false) {
          List allData = responseDecode['data'];
          allData.forEach((element) {
            All_Booking_List.add(AllBookingModel(
              id: element['id'].toString(),
              bookDate: element['book_date'],
              bookSlot: element['book_slot'],
              showStartTime: element['show_start_time'],
              showEndTime: element['show_end_time'],
              soundCheckTime: element['sound_check_time'],
              mainCourse: element['main_course'].toString(),
              starter: element['starter'].toString(),
              nonAlcoholic: element['non_alcoholic_beverages'].toString(),
              alcoholic: element['alcoholic_beverages'].toString(),
              formation: element['formation'],
              genres: element['genres'],
            ),);
          });
        } else{
          List allData = responseDecode['data'];
          allData.forEach((element) {
            All_Booking_List.add(AllBookingModel(
              id: element['id'].toString(),
              bookDate: element['book_date'],
              bookSlot: element['book_slot'],
              showStartTime: element['show_start_time'],
              showEndTime: element['show_end_time'],
              soundCheckTime: element['sound_check_time'],
              mainCourse: element['main_course'].toString(),
              starter: element['starter'].toString(),
              nonAlcoholic: element['non_alcoholic_beverages'].toString(),
              alcoholic: element['alcoholic_beverages'].toString(),
                formation: element['formation'],
              genres: element['genres'],
            ),);
          });
        }
        isLoading.value = false;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      print("GET Booking List");
    }
  }
}
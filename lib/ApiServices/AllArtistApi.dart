
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../Controller/SharePre.dart';
import '../Modal/AllArtistModel.dart';
import 'api_link.dart';

class GetAllArtistApi1 extends GetxController {
  RxList<AllArtistModel> All_Artist_list = <AllArtistModel>[].obs;
  RxBool isLoading = false.obs;
  final _getUserDetail = GetUserDetail();
  Future<void> getArtistUpApi() async {
    var userId = await _getUserDetail.getUserData('id');
    try {
      All_Artist_list.clear();
      isLoading.value = true;
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.allArtistUrl));
      request.fields.addAll({'club_id': userId,});
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == false) {
        } else{
          List allData = responseDecode['data'];
          allData.forEach((element) {
            All_Artist_list.add(AllArtistModel(
              id: element['id'].toString(),
              username: element['username'],
              contactNo: element['contact_no'],
              typeOfArtistName: element['type_of_artist_name'],
              profile: element['profile'],
              rating: element['rating'],
              isLike: element['is_like'],
              totalLike: element['total_like'],
              gender: element['gender'],
              profileId: element['profile_id'].toString(),
            ),);
          });
        }
        isLoading.value = false;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
      print("GET Artist List");
    }
  }

}
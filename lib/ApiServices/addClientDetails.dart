
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Controller/SharePre.dart';
import 'api_link.dart';

class AddClientDataApi {
  final _getUserDetail = GetUserDetail();
  Future addClient({String? floordeatail,context}) async {
    var userId = await _getUserDetail.getUserData('id');
    try {
      Map<String, String> sender_map;
      sender_map = {
        'user_id': userId,
        'floordeatail': floordeatail.toString(),
      };
      // }
      print(sender_map);
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.SubmitFloorDetail),);
      request.fields.addAll(sender_map);
      print('The Requested fields are ${request.fields}');
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if (responseDecode['error']==false) {
          CommonToast(context: context, title: responseDecode['message'], alignCenter: false);
          print('The Response we get in the api is $responseDecode');
        } else {
          CommonToast(context: context, title: responseDecode['message'], alignCenter: false);
          print('The Response We Get In The Api is $responseDecode');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
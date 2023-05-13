import 'dart:convert';
import 'package:http/http.dart';
import '../Controller/SharePre.dart';
import '../Modal/offerM.dart';
import '../Modal/singleofferdetailsM.dart';
import 'api_link.dart';

class Offer_Api {
  final getuserid=GetUserDetail();
  Future<OfferM> Offer_api() async {
    var body  = {
      "club_id" : 310.toString()
    };
    final response = await post(Uri.parse(Api_link.Offers),
        body: body
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return OfferM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
  Future<SingleofferdetailsM> Detail_Api(id)

  async {
    var body  = {
      "id" : id.toString()
    };
    final response = await post(Uri.parse(Api_link.SingleOffer),
        body: body
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SingleofferdetailsM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}
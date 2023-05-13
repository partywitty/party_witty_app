import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../ArtistRagistration/Upload_photograph.dart';
import '../ArtistRagistration/venue_perform.dart';
import '../ArtistRagistration/Service.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Modal/AritistM.dart';
import 'package:http/http.dart' as http;
import '../Modal/artistProfileDetails.dart';
import '../Modal/artistTypeM.dart';
import '../Modal/clubListM.dart';
import '../Modal/editVenueM.dart';
import '../Modal/filterArtistM.dart';
import '../Modal/filterInstrumentM.dart';
import '../Modal/genreM.dart';
import '../Modal/getCityM.dart';
import '../Modal/getartistDetailM.dart';
import '../Modal/instrumentListM.dart';
import '../Modal/instrumentM.dart';
import '../Modal/languageM.dart';
import '../Modal/requestM.dart';
import '../Modal/selectedLanguageM.dart';
import '../Modal/summaryPriceM.dart';
import '../Modal/venueM.dart';
import '../Modal/youPlayM.dart';
import 'api_link.dart';

class GetArtistList extends GetxController {
  final _getUserDetail = GetUserDetail();
  RxBool isLoading = false.obs;

  Future<AritistM> getArtist() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId
    };
    final response = await post(Uri.parse(Api_link.artistList),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return AritistM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future sendRequest({required String recieverId,required BuildContext context,}) async {
    final _getUserDetail = GetUserDetail();
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.sendRequest));
      request.fields.addAll({
        'request_by': userId,
        'request_to': recieverId,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: "some error", alignCenter:false);
        } else {
          scratchDialog(context);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      print(e);
    }
  }

  Future<void> scratchDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFF2D2B42),
            contentPadding: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5.0,top: 5.0),
                              child: Icon(Icons.cancel_outlined,color: Colors.white,size: 24,),
                            )),
                      ],
                    ),
                    Image.asset('assests/img.png',fit: BoxFit.fill,height: 50,),
                    const Text("Thanks for registration with partywitty, use the same credentials for log in again.",
                        style: signUpTitle,textAlign: TextAlign.center),
                    const SizedBox(),
                  ],
                ),
              );
            }),
          );
        }
    );
  }

  Future<ArtistTypeM> artistType() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId
    };
    final response = await post(Uri.parse(Api_link.artistType),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return ArtistTypeM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  ///update profile  api ----------------

  Future<GenreM> getStreamingApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.getStreamingUrl),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return GenreM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  ///language  api ----------------

  Future<LanguageM> getLanguage() async {
    final response = await get(Uri.parse(Api_link.getLanguage),
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return LanguageM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<SelectedLanguageM> selectedLanguageApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.selectedLanguageUrl),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return SelectedLanguageM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future deleteLanguage({
    required String languageId,
    required String languageName,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.deleteLanguage));
      request.fields.addAll({
        'user_id': userId,
        'language_ids': languageId,
        'languages': languageName,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }

  Future deleteCityPrice({
    required String cityId,
    required BuildContext context,}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.deleteCityPrice));
      request.fields.addAll({
        'selected_city_id': cityId,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }

  Future updateLanguage({
    required String languageId,
    required String languageName,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.updateLanguage));
      request.fields.addAll({
        'user_id': userId,
        'language_ids': languageId,
        'languages': languageName,
        'profile_id': DataManager.getInstance().getProfile().toString(),
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("ERRORRRRRRRRRRRRR");
      print(e);
    }
  }

  ///type of artist api ----------------

  Future artistTypeSubmit({required String artistName,required String artistId,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.artistTypeSubmit));
      request.fields.addAll({
        'user_id': userId,
        'type_of_artist_id':artistId,
        'type_of_artist_name':artistName,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Artist Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
          SharePre.setProfileId(responseDecode['data']['profile_id'].toString());
          DataManager.getInstance().setProfile(responseDecode['data']['profile_id'].toString());
          Get.to(const Upload_photograph());
          // Get.to(Upload_photograph());
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("Error --------------------- true");
      isLoading.value = false;
      CommonToast(context: context, title: 'Internal server', alignCenter: true);
      print(e);
    }
  }

  Future<YouPlayM> artistSubtype({subArtist}) async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "type_of_artist_id" : subArtist,
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.artistSubtype),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return YouPlayM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<GenreM> genreApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      'profile_id': DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.genres),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return GenreM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<SummaryPriceM> priceSummaryApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      'profile_id': DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.priceSummary),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return SummaryPriceM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<void> artistSubTypeSubmit({
    required String artistName,
    required String artistId,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.artistSubtypeSubmit));
      request.fields.addAll({
        'user_id': userId,
        'sub_category_id':artistId,
        'sub_category_name':artistName,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Artist Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("Error-----------------------true");
      isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  Future<void> submitGenre({required String artistName,required String artistId,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.genreSubmit));
      request.fields.addAll({
        'user_id': userId,
        'selected_genres':artistId,
        'selected_genres_name':artistName,
        'profile_id': DataManager.getInstance().getProfile().toString(),
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Artist Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("Error------------------------------true");
      isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  Future<void> submitLanguage({required String languageName,required String languageId,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.languageSubmit));
      request.fields.addAll({
        'user_id': userId,
        'language_ids':languageId,
        'languages':languageName,
        'profile_id': DataManager.getInstance().getProfile().toString(),
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'language is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'successfully', alignCenter: false);
          Get.offAll(const Venue_music());
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Venue_music(),));
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      CommonToast(context: context, title: 'Internal server error', alignCenter: true);
      print(e);
    }
  }

  Future<VenueM> venueApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.venue),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return VenueM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<EditVenueM> editVenueApiModel() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.newVenueSelected),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return EditVenueM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<EditVenueM> editFormationApiModel() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString()
    };
    final response = await post(Uri.parse(Api_link.newSubCategorySelected),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return EditVenueM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<FilterInstrumentM> filterInstrumentApi({instrumentId}) async {
    var data1 = {
      "subcategory_id" : instrumentId,
      "profile_id": DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.filterInstrument),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return FilterInstrumentM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<void> venueSubmit({required String venueName,required String venueId,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.venueSubmit));
      request.fields.addAll({
        'user_id': userId,
        'selected_venue':venueId,
        'selected_venue_name':venueName,
        'profile_id': DataManager.getInstance().getProfile().toString(),
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Venue Name is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Venue Submit', alignCenter: false);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  Future<void> introSubmit({required String description,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.introSubmit));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'introduction':description,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'description is required', alignCenter: false);
        } else {
          CommonToast(context: context, title: 'Introduction Submitted Successfully', alignCenter: false);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      CommonToast(context:context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  Future<GetartistDetailM> selectProfileDetails({subArtist}) async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.getArtistDetails),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GetartistDetailM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future acceptRequest({required String recieverId,required String status,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.acceptRequest));
      request.fields.addAll({
        'request_by': recieverId,
        'request_to': userId,
        'status': status,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: "Something wants wrong!", alignCenter:false);
        } else {
          CommonToast(context: context, title: responseDecode['message'], alignCenter:  false);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: "Something wants wrong!", alignCenter:false);
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      print(e);
    }
  }

  Future<InstrumentM> instrumentApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      "profile_id" : DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.getArtistDetails),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return InstrumentM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future service() async {
    final response = await get(Uri.parse(DataManager.getInstance().getUserType() == "Artist" ? Api_link.serviceAgreeArtist : Api_link.serviceAgreeClub),);
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return data;
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<InstrumentListM> budgetList({subcategoryId}) async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId,
      'profile_id': DataManager.getInstance().getProfile().toString(),
    };
    final response = await post(Uri.parse(Api_link.instrumentList),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return InstrumentListM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<GetCityM> getCityApi() async {
    final response = await get(Uri.parse(Api_link.getCity),
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return GetCityM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<ClubListM> getClubApi() async {
    final response = await get(Uri.parse(Api_link.getClub),
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ClubListM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future cityPriceApi({required String ctiyAndPrice,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.cityPrice));
      request.fields.addAll({
        'user_id': userId,
        "profile_id": DataManager.getInstance().getProfile().toString(),
        'json': ctiyAndPrice,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        } else {
        //  Navigator.push(context, MaterialPageRoute(builder: (context) => managerDetails(),));
          Navigator.push(context, MaterialPageRoute(builder: (context) => Service(),));
          CommonToast(context: context, title: 'successfully', alignCenter: false);
        }
        isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context:context, title: 'Internal server error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      isLoading.value = false;
      CommonToast(context:context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }


  Future<FilterArtistM> artistFilterApi({
    artistTypeId,subName,instrumentId,genresName,venueName,startPrice,endPrice}) async {
    var data1 = {
      "artists_type_id" : artistTypeId,
      "subcategory_name" : subName,
      "intrument_id" : instrumentId,
      "genres_name" : genresName,
      "venue_name" : venueName,
      "start_price" : startPrice,
      "end_price" : endPrice
    };
    final response = await post(Uri.parse(Api_link.filterArtist),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return FilterArtistM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<RequestM> requestListApi() async {
    var userId = await _getUserDetail.getUserData('id');
    var data1 = {
      "user_id" : userId
    };
    final response = await post(Uri.parse(Api_link.requestLink),
      body: data1,
    );
    var data= jsonDecode(response.body);
    print(data);
    if (response.statusCode == 200) {
      return RequestM.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }

  Future<ArtistProfileDetails> artistProfileDetailsApi({artistId,profileId}) async {
    var data1 = {
      "artist_id" : artistId,
      "profile_id" : profileId,
    };
    final response = await post(Uri.parse(Api_link.getArtistDetailsUrl),
      body: data1,
    );
    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ArtistProfileDetails.fromJson(data);
    }
    else {
      throw Exception('Failed to load post');
    }
  }
}

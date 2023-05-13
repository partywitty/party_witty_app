
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../ApiServices/artistProfile.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/utils.dart';
import '../Modal/getCityM.dart';
import '../Modal/primaryCityM.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;

class primaryLocation extends StatefulWidget {
  const primaryLocation({Key? key}) : super(key: key);

  @override
  State<primaryLocation> createState() => _primaryLocationState();
}

class _primaryLocationState extends State<primaryLocation> {

  final _getUserDetail = GetUserDetail();

  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController searchBank = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<TextEditingController>? cityPrice = [];

  List<primaryCityData> getCityList = [];
  List<cityData> getCityListAdd = [];
  List<cityData> getCitySearch = [];
  List<queAns> sendCityPrice = [];
  List dynamicCityList = [];
  List dynamicCityId = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  load(){
    artistProfileApi().getPrimaryCity().then((value) {
      setState(() {
        getCityList = value.data!;
      });
    });
    GetArtistList().getCityApi().then((value){
      setState((){
        getCityListAdd = getCitySearch = value.data!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 10.0,),
          Text("This are the travel expenses that will be added to your base price.",style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height:20,),
          countryListField(),
          dynamicCityId.isEmpty ? const SizedBox() :
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: dynamicCityList.length,
            itemBuilder: (context, index) {
              var cityList = dynamicCityList[index];
              var cityId = dynamicCityId[index];
              cityPrice!.add(TextEditingController());
              return ListTile(
                title: Text(cityList,style: textLabel),
                trailing: Container(
                  width : 180,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    controller: cityPrice![index],
                    onEditingComplete: (){
                      setState(() {
                        load();
                        sendCityPrice.add(queAns(
                          queId: '${cityId}',
                          ansData:cityPrice![index].text,
                        ));
                      });
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400),
                    decoration: inputDecoration(context,hint:  "accomm/Travel Price"),
                  ),
                ),
              );
            },),
          const SizedBox(height: 10.0,),
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: getCityList.length,
              itemBuilder: (context, index) {
                var data = getCityList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${data.name}",style: textLabel),
                      Chip(
                        backgroundColor: const Color(0xFF434445),
                          label: Text("${data.price} /-",style: textLabel),
                        onDeleted: () {
                          setState(() {
                            GetArtistList().deleteCityPrice(
                               cityId: "${data.cityId}",
                                context: context).whenComplete((){
                              load();
                            });
                          });
                        },
                        deleteIcon: const Icon( Icons.clear,size: 24,color: Colors.red,),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white),
                ],
              );
            },),
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              color: Colors.black,
              height: 65,
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  var sendPrice = sendCityPrice.map((e) => {
                    '"city_id"': '"${e.queId}"',
                    '"price"': '"${e.ansData}"'},
                  ).toList(growable: true);

                  print(sendPrice);


                  cityByPrice(
                      ctiyAndPrice: sendPrice.toString(),
                      context: context).then((value){
                    load();
                    sendCityPrice.clear();
                    cityPrice!.clear();
                    dynamicCityId.clear();
                    dynamicCityList.clear();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 50.0,
                  decoration: boxDecoration(),
                  child: const Text('Update',style: buttonText),
                ),
              )),
        ],
      ),
    );
  }
  Widget countryListField(){
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        onTap: (){
          showDialog(
            context: context,
            barrierDismissible:false,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (context, setState){
                    return Dialog(
                      backgroundColor: appBarColor,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        elevation: 16,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                    // searchBank.clear();
                                    load();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 10.0,top: 5.0),
                                    child: Icon(Icons.clear,color: Colors.white,size: 24,),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin : const EdgeInsets.only(right: 10.0,left: 10.0,bottom: 5.0,top: 5.0),
                              child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      getCitySearch = getCityListAdd
                                          .where((name) => name.name!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                          .toList();
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: searchBank,
                                  style: textFill,
                                  decoration: inputDecoration(
                                      context,
                                  hint: "Search City")
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: getCitySearch.isEmpty ? 0 : getCitySearch.length,
                                  itemBuilder: (context, index) {
                                    var data =getCitySearch[index];
                                    return ListView(
                                      shrinkWrap: true,
                                      physics: const ScrollPhysics(),
                                      children: [
                                        InkWell(
                                          onTap: (){
                                            setState((){
                                              load();
                                              Navigator.pop(context);
                                              dynamicCityList.add(data.name);
                                              dynamicCityId.add(data.id);
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(data.name.toString(),
                                              style: textFill),
                                          ),
                                        ),
                                        const Divider(color: Colors.white,)
                                      ],
                                    );
                                  }),
                            )
                          ],
                        )
                    );
                  }
              );
            },
          );
        },
        readOnly: true,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Colors.white,fontSize: 12),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select city';
          }
          return null;
        },
        controller: countryController,
          decoration: inputDecoration(context, hint: "Search City")
      ),
    );
  }

  Future cityByPrice({required String ctiyAndPrice,required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.cityPrice));
      request.fields.addAll({
        'user_id': userId,
        'profile_id': DataManager.getInstance().getProfile().toString(),
        'json': ctiyAndPrice,
        'end_page' : 'not update'
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
        CommonToast(context:context, title: 'Internal server error', alignCenter: true);
        print(response.reasonPhrase);
      }}catch(e){
      CommonToast(context:context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }
}
class queAns {
  String queId;
  String ansData;

  queAns({required this.queId, required this.ansData});
}

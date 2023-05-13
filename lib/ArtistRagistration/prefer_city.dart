// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/managerDetails.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/clubListM.dart';
import '../Modal/getCityM.dart';

class Prefer_city extends StatefulWidget {
  const Prefer_city({Key? key}) : super(key: key);

  @override
  State<Prefer_city> createState() => _Prefer_cityState();
}

class _Prefer_cityState extends State<Prefer_city> {

  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController searchBank = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<TextEditingController>? cityPrice = [];

  List<cityData> getCityList = [];
  List<cityData> getCitySearch = [];
  List<queAns> sendCityPrice = [];
  List dynamicCityList = [];
  List dynamicCityId = [];
  List<ClubData> clubList = [];

  load(){
    GetArtistList().getCityApi().then((value){
      setState((){
        getCityList = getCitySearch = value.data!;
      });
    });
    GetArtistList().getClubApi().then((value) {
      setState(() {
        clubList = value.data!;
      });
    });
  }
  String? cateValue;
  var sadf;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  bool showFiled = false;
  String? gender;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height * 0.6,
                child: Image.asset(
                  'assests/A_img.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 15),
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Container(
                  width: width,
                  // height: height*0.5,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0,),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text("This are the travel expenses that will be added to your base price.",style: GoogleFonts.poppins(textStyle: textLabel)),
                        ),
                        Theme(
                          data: ThemeData(
                            unselectedWidgetColor: appColor,
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width/2.5,
                                child: RadioListTile(
                                  activeColor: appColor,
                                  title: const Text("Yes",style: textFill,),
                                  value: "Yes",
                                  groupValue: gender,
                                  onChanged: (value){
                                    setState(() {
                                      gender = value;
                                      showFiled = true;
                                      // showVideo = false;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: width/2.5,
                                child: RadioListTile(
                                  activeColor: appColor,
                                  title: const Text("No",style: textFill,),
                                  value: "No",
                                  groupValue: gender,
                                  onChanged: (value){
                                    setState(() {
                                      gender = value;
                                      showFiled = false;
                                      // showAudio = false;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),

                        Visibility(
                          visible: showFiled,
                            child: countryListField()),

                        Visibility(
                          visible: showFiled,
                            child: dynamicCityId.isEmpty ? const SizedBox() :
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: dynamicCityList.length,
                              itemBuilder: (context, index) {
                                var cityList = dynamicCityList[index];
                                var cityId = dynamicCityId[index];
                                cityPrice!.add(TextEditingController());
                                return ListTile(
                                  title: Text(cityList, style: appBarText),
                                  trailing: Container(
                                    width : 250,
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: cityPrice![index],
                                      onEditingComplete: (){
                                        setState(() {
                                          print('cityid-----${cityId}');
                                          print('cityPrice-----${cityPrice![index].text}');
                                          sendCityPrice.add(queAns(
                                            queId: '${cityId}',
                                            ansData:cityPrice![index].text,
                                          ));
                                        });
                                        FocusManager.instance.primaryFocus?.unfocus();
                                      },
                                      style: textFill,
                                      decoration: inputDecoration(context,hint:  "accomm/Travel Price(per person)"),
                                    ),
                                  ),
                                );
                              },)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 65,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              //serviceDialog(context);
              var sendPrice = sendCityPrice.map((e) => {
                '"city_id"': '"${e.queId}"',
                '"price"': '"${e.ansData}"'},
              ).toList(growable: true);
              print('sendPrice-------------$sendPrice');
              print('sendCityPrice-------------$sendCityPrice');

              GetArtistList().cityPriceApi(
                  ctiyAndPrice: sendPrice.toString(),
                  context: context).then((value){
                Get.to(const managerDetails());
                sendCityPrice.clear();
                cityPrice!.clear();
                dynamicCityId.clear();
                dynamicCityList.clear();
              });
             // Navigator.pushNamed(context, '/address_page');
            },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)
              ),
            ),
          )),
    );
  }

  Widget countryListField(){
    return Container(
      margin: const EdgeInsets.only(right: 20.0,left: 20.0,top: 10,bottom: 15.0),
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
                                      getCitySearch = getCityList
                                          .where((name) => name.name!
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                          .toList();
                                    });
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: searchBank,
                                  style: textFill,
                                  decoration: inputDecoration(context, hint: "Search City")
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
                                                print(data.name);
                                                dynamicCityList.add(data.name);
                                                dynamicCityId.add(data.id);
                                                countryController.clear();
                                                searchBank.clear();
                                              });
                                              },
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text(data.name.toString(),style: textLabel),
                                            ),
                                          ),
                                          Divider(color: Colors.grey[500],)
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
        // "Search city",
        controller: countryController,
          decoration: inputDecoration(context, hint: "Search City"),
      ),
    );
  }
}
class queAns {
  String queId;
  String ansData;

  queAns({required this.queId, required this.ansData});
}

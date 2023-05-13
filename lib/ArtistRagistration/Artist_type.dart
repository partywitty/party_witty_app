
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/artistTypeM.dart';

class Artist_type extends StatefulWidget {
  const Artist_type({Key? key}) : super(key: key);

  @override
  State<Artist_type> createState() => _Artist_typeState();
}

class _Artist_typeState extends State<Artist_type> {


  List<Artist> friends = [];
  List<Artist> searchArtist = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }

  var selected;

  load(){
    GetArtistList().artistType().then((value) {
      setState(() {
        friends =searchArtist= value.data!.artist!;
      });
    });
    GetArtistList().artistType().then((value) {
      setState(() {
        selected = value.data!.selected!.artistName;
      });
    });
  }

  bool selectedBox = false;

  var artistSelect;
  var artistId;
  var subcategoryId;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              height: height,
              width: width,
              alignment: Alignment.center,
              child: Stack(children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: height,
                  child: Image.asset(
                    'assests/A_img.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    width: double.infinity,
                    // height: height*0.5,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 40),
                            child: Text("What Type of Artist", style: signUpTitle),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  searchArtist = friends
                                      .where((name) => name.name!
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                             // controller: searchArtist,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              style: const TextStyle(
                                  fontSize: 14.0, color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: "Search artist..",
                                hintStyle: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),
                                fillColor: const Color(0xFF434445),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 25.0, bottom: 12.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                          selected == null ?
                          const Text('') :
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: Text("$selected",style: TextStyle(fontSize: 12,color: Colors.white),)),
                          SizedBox(
                            height: 500,
                            child: GridView.builder(
                              itemCount : searchArtist.isEmpty ? 0 : searchArtist.length,
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100,
                                  childAspectRatio: 1.8 / 1.2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  var data = searchArtist[index];
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        selectedBox = true;
                                        artistSelect = data.name;
                                        artistId = data.id;
                                        subcategoryId = data.subcategory;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(vertical: 5.0),
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                                        decoration: BoxDecoration(
                                            color: artistSelect  == "${data.name}" ? appColor : Colors.grey,
                                            borderRadius: BorderRadius.circular(20.0)
                                        ),
                                        child: Text("${data.name}", style: textFill,textAlign: TextAlign.center,)),
                                  );
                                },),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            )
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 60,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
               if(artistSelect== null){
                 CommonToast(context: context, title: 'Please Select Type', alignCenter: false);
               } else{
                 GetArtistList().artistTypeSubmit(
                     artistId: artistId.toString(),
                     artistName: artistSelect,
                     context: context);
               }
            },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: const Text('Submit',style: buttonText),
            ),
          )),
    );
  }
}

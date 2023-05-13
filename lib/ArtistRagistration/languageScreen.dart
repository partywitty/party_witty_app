
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Modal/languageM.dart';

class languageScreen extends StatefulWidget {
  const languageScreen({Key? key}) : super(key: key);

  @override
  State<languageScreen> createState() => _languageScreenState();
}

class _languageScreenState extends State<languageScreen> {


  List<lanData> languageList = [];
  List<lanData> friends = [];
  List selectedPrompts = [];


  load(){
    GetArtistList().getLanguage().then((value) {
      setState(() {
        friends = value.data!;
      });
    });
  }

  var artistSelect;
  String? selected;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Language", style: GoogleFonts.poppins(textStyle: appBarText)),
        automaticallyImplyLeading: false,
        // leading: InkWell(
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 24)),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 20.0),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF434445),
                borderRadius: BorderRadius.circular(20)
            ),
            child: MultiSelectDialogField<lanData>(
              dialogHeight:MediaQuery.of(context).size.height/2.2,
              confirmText: const Text("OK",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
              cancelText: const Text("Cancel",style: TextStyle(color: Colors.blue,fontWeight:FontWeight.bold,fontSize: 14)),
              validator: (value) {
                if (value == null || value.isEmpty) {return 'Please select language';}
                return null;
              },
              searchable: true,
              items: friends.map((data) =>
                  MultiSelectItem<lanData>(
                    data, data.language.toString(),),).toList(),
              initialValue: languageList,
              title: const Text("Search",style: TextStyle(color: Colors.black,fontSize: 14)),
              selectedColor: const Color(0xFFFD2F71),
              itemsTextStyle: const TextStyle(fontSize: 14,color: Colors.black),
              chipDisplay: MultiSelectChipDisplay(
                textStyle: const TextStyle(color: Colors.black),),
              selectedItemsTextStyle: const TextStyle(color: Colors.red),
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),),
              buttonIcon: const Icon(Icons.search, color: Colors.grey,),
              buttonText: const Text("Search Language in which you wish to perform?",style: textHint,
                  overflow: TextOverflow.ellipsis,maxLines: 1),
              onConfirm: (val) {
                setState((){
                  languageList = val;
                });
              },
            ),
          ),

          // MultiSelectContainer(
          //     items: friends.map((e) {
          //       return  MultiSelectCard(
          //         decorations: MultiSelectItemDecorations(
          //           decoration: BoxDecoration(
          //               color: const Color(0xFFF9F6F4),
          //               borderRadius: BorderRadius.circular(20)),
          //           selectedDecoration: BoxDecoration(
          //               color: appColor,
          //               borderRadius: BorderRadius.circular(20)),
          //         ),
          //         value: e.language,
          //         label: e.language,
          //         contentPadding: const EdgeInsets.all(12),
          //         highlightColor: appColor,
          //       );
          //     }).toList(),
          //     onChange: (allSelectedItems, selectedItem) {
          //       selectedPrompts =  allSelectedItems;
          //     },
          //     splashColor: Colors.blue),
        ],
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              if(languageList.isEmpty){
                CommonToast(context: context, title: 'Please select one language', alignCenter: false);
              }else{
                GetArtistList().submitLanguage(
                    context: context,
                    languageId: languageList.map((e) => e.id).join(","),
                    languageName: languageList.map((e) => e.language).join(",")
                ).whenComplete(() {
                  load();
                });
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

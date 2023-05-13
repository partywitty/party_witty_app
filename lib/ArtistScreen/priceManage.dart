

import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import '../ApiServices/artistListApi.dart';
import '../Controller/utils.dart';
import '../Modal/instrumentM.dart';

class managePrice extends StatefulWidget {
  const managePrice({Key? key}) : super(key: key);

  @override
  State<managePrice> createState() => _managePriceState();
}

class _managePriceState extends State<managePrice> {

  List<TextEditingController>? privateControllers = [];


  TextEditingController priceController = TextEditingController();
  List<TextEditingController> contact_name = [TextEditingController()];
  List<TextEditingController> contact_email = [TextEditingController()];
  List<TextEditingController> contact_phone = [TextEditingController()];
  List<Instruments> friends = [];
  List<Instruments> instrument =[] ;
  final double _height = Get.height, _width = Get.width;

  @override
  void initState() {
    // TODO: implement initState
    load();
    super.initState();
  }
  load(){
    GetArtistList().instrumentApi().then((value) {
      setState(() {
        friends = value.data!.instruments!;
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
          const SizedBox(height: 15.0,),
          const Text('Instrument to Play',style: drawerTitle),
          const SizedBox(height: 20.0,),
          SizedBox(
            height: _height*0.6,
            child: ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                privateControllers!.add(TextEditingController());
              return Column(
                children: [
                  Row(
                    children: [
                      const Text("Piano",style: appTitle),
                      const Spacer(),
                      SizedBox(
                        width : 100,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: privateControllers![index],
                          style: textFill,
                          decoration: inputDecorationSuffix(context,hint: "1000/-"),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.white,)
                ],
              );
            },),
          ),
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50.0,
                decoration: boxDecoration(),
                child: const Text('Update',style: buttonText),
              ),
            ),
          )
        ],
      ),
    );
  }
}

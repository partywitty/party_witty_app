
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../ApiServices/otp_api.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Screens/bottomSheet.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {

  bool loading = true;
  String? text;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetArtistList().service().then((value) {
      setState(() {
        text = value['data']['contant'];
        loading = false;
      });
    });
  }
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: drawerColor,
        title: Text("Service Agreement",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 0.0),
        children: [
          const SizedBox(height: 10.0,),
          loading ? const Center(child: CircularProgressIndicator(color: Color(0xff00EBB1))) :
          HtmlWidget(text.toString(),
            textStyle: const TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w300),),
          const SizedBox(height: 100.0,),
        ],
      ),
      bottomSheet: Container(
          color: Colors.black,
          height: 90,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    activeColor: Color(0xFFFE262F),
                    checkColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    value: check,
                    onChanged: (value) {
                      setState(() {
                        check = value!;
                      });
                    },
                  ),
                  const Text('Service Agreement',style: likes)
                ],
              ),
              GestureDetector(
                onTap: () {
                  if(check == false){
                    CommonToast(context: context, title: "Please check service agreement", alignCenter:false);
                  }else{
                    // Otp_Api().emailVerify(context: context);
                       //Get.offAll(bottomSheet());
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const bottomSheet(),));
                    //  serviceDialog(context);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 35.0,
                  decoration: boxDecoration(),
                  child: const Text('I Agree', style: buttonText),
                ),
              ),
            ],
          )),
    );
  }
  Future<void> serviceDialog(BuildContext context) {
    return showDialog(context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF2D2B42),
            contentPadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: StatefulBuilder(builder: (context, StateSetter setState) {
              return Container(
                alignment: Alignment.center,
                height: 200,
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
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
                            child: const Padding(
                              padding: EdgeInsets.only(right: 5.0,top: 5.0),
                              child: Icon(Icons.cancel_outlined,color: Colors.white,size: 24,),
                            )),
                      ],
                    ),
                    Image.asset('assests/img.png',fit: BoxFit.fill,height: 50,),
                    const Text("Thanks for completing the profile with partywitty, your profile is under review.",
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
}

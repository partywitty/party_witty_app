import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/Service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/sponser.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';
import '../Screens/bottomSheet.dart';


class Sponsor_page extends StatefulWidget {
  const Sponsor_page({Key? key}) : super(key: key);

  @override
  State<Sponsor_page> createState() => _Sponsor_pageState();
}

class _Sponsor_pageState extends State<Sponsor_page> {
  TextEditingController name=TextEditingController();
  TextEditingController name1=TextEditingController();
  TextEditingController name2=TextEditingController();
  String? Select;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        scrollDirection: axisDirectionToAxis(
          AxisDirection.down,
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height*0.63,
                child: Image.asset(
                  'assests/light.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 30),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Do you have any sponsors for the live music",style: GoogleFonts.poppins(textStyle: appTitle)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Radio(
                                  // activeColor:  Color(0xFFfd2630),
                                  fillColor:
                                  MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return (value) ? Colors.white : Color(0xFFfd2630);
                                  }),
                                  focusColor: Colors.white,
                                  hoverColor: Colors.white,
                                  autofocus: true,
                                  value: "Yes",
                                  groupValue: Select,
                                  onChanged: (value) {
                                    setState(() {
                                      Select = value.toString();  print(Select);
                                    });
                                  },
                                ), Text(
                                  'Yes',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14, color: Colors.white),
                                ),
                                const SizedBox(width: 20,),

                                Radio(
                                  activeColor: Color(0xFFfd2630),
                                  fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                    return (value) ? Colors.white : Color(0xFFfd2630);
                                  }),
                                  value: "No",
                                  groupValue: Select,
                                  onChanged: (value) {
                                    setState(() {Select = value.toString();
                                    print(Select);
                                    });
                                  },
                                ),
                                Text(
                                  'No',
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                            Select=='Yes'?
                            Column(
                                  children: [
                                    const SizedBox(height: 10.0),
                                    TextFormField(
                                        controller: name,
                                        autofocus: false,
                                        style: textFill,
                                        decoration: inputDecoration(context,hint: "Sponsors Name")
                                    ),
                                    const SizedBox(height: 15.0),
                                    TextFormField(
                                        controller: name1,
                                        autofocus: false,
                                        style: textFill,
                                        decoration: inputDecoration(context,hint: "Sponsors Name")
                                    ),
                                    const SizedBox(height: 15.0),
                                    TextFormField(
                                        controller: name2,
                                        autofocus: false,
                                        style: textFill,
                                        decoration: inputDecoration(context,hint: "Sponsors Name")
                                    )
                                  ],
                                ) :
                            Container(height: 0,),
                            const SizedBox(height: 30,),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (Select == 'No') {
                                    print('name$name');
                                    Sponser_Api().sponser_api(
                                        sponsor_name:name.text.toString(),
                                        sponsorship: Select.toString(),
                                      context: context
                                    ).then((value) =>
                                        Navigator.pushNamed(context, '/sponsorship_page'));
                                  } else
                                    print('name$name');
                                  Sponser_Api().sponser_api(
                                      context: context,
                                      sponsor_name: "${name.text.toString()},${name1.text.toString()},${name2.text.toString()}" ,
                                      sponsorship: Select.toString()).then((value) =>
                                   //   Navigator.push(context, MaterialPageRoute(builder: (context) => bottomSheet(),))
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Service(),))
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: const Text('Submit',style: buttonText),
                                ),
                              ),
                            ),
                            const SizedBox(height: 13,),
                          ],
                        ),
                      ),
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}



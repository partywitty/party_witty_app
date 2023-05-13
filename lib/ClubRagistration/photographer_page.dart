import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/photograph.dart';
import '../ArtistRagistration/Upload_Bands.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class Photographer_page extends StatefulWidget {
  const Photographer_page({Key? key}) : super(key: key);

  @override
  State<Photographer_page> createState() => _Photographer_pageState();
}

class _Photographer_pageState extends State<Photographer_page> {
  String? Selected;
  bool value = false;
  List<PhotoModel> photolist = [
    PhotoModel(title: 'M', image: "mon", isSelect: false),
    PhotoModel(title: 'T', image: "tue", isSelect: false),
    PhotoModel(title: 'W', image: "wed", isSelect: false),
    PhotoModel(title: 'T', image: "thu", isSelect: false),
    PhotoModel(title: 'F', image: "fri", isSelect: false),
    PhotoModel(title: 'S', image: "sat", isSelect: false),
    PhotoModel(title: 'S', image: "sun", isSelect: false),
  ];
  List data=[];
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
                      decoration: const BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left:32 ),
                              child: Text("Photographer Availability", style: headingTitle),
                            ),
                            const SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.only(left: 36.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Radio(
                                    // activeColor:  Color(0xFFfd2630),
                                    fillColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {return (value) ? Colors.white : Color(0xFFfd2630);
                                        }),
                                    focusColor: Colors.white,
                                    hoverColor: Colors.white,
                                    autofocus: true,
                                    value: "Yes",
                                    groupValue: Selected,
                                    onChanged: (value) {
                                      setState(() {
                                        Selected = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'Yes',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                  ),
                                  SizedBox(width: 20,),
                                  Radio(
                                    activeColor: Color(0xFFfd2630),
                                    fillColor: MaterialStateProperty.resolveWith<Color>(
                                            (Set<MaterialState> states) {return (value) ? Colors.white : Color(0xFFfd2630);
                                        }),
                                    value: "No",
                                    groupValue: Selected,
                                    onChanged: (value) {
                                      setState(() {
                                        Selected = value.toString();
                                      });
                                    },
                                  ),
                                  Text(
                                    'No',
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Selected == "Yes" ?
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8),
                              child: Container(
                                height: 50,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 7,
                                  itemBuilder: (context, i) {
                                    return Wrap(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if( photolist[i].isSelect==false){
                                                data.add(photolist[i].image);
                                              }else if(photolist[i].isSelect==true){
                                                data.remove(photolist[i].image);
                                              }
                                              photolist[i].isSelect = !photolist[i].isSelect;
                                              print(photolist[i].toString());
                                            });
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            child: Center(
                                                child: Text(photolist[i].title, style: TextStyle(color: Colors.white),
                                                )),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: FractionalOffset(0.1, 0.1),
                                                    end: FractionalOffset(0.8, 0.1),
                                                    colors: photolist[i].isSelect? [Color(0xFFFE262F), Color(0xFFFD2F71),
                                                    ] : [Colors.black, Colors.black,]),
                                                border: Border.all(color: Color(0xFFFE262F),),
                                                borderRadius: BorderRadius.circular(1)),
                                          ),
                                        ),
                                      ),
                                    ]);
                                  },
                                ),
                              ),
                            ) :
                            const SizedBox(),
                            const SizedBox(height: 20,),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  print(data.join(","));
                                  if(Selected==null){
                                    CommonToast(context: context, title: 'please select ', alignCenter: false);
                                  }else {
                                    Photograph_Api().photograph_api(
                                        photographer:Selected.toString(),
                                      availability: data.join(','),
                                      context: context
                                    ).then((value) =>
                                        Navigator.pushNamed(context, '/sponsor_page'));
                                  }

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
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
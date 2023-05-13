import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Dialog_field extends StatefulWidget {
  const Dialog_field({Key? key}) : super(key: key);

  @override
  State<Dialog_field> createState() => _Dialog_fieldState();
}

class _Dialog_fieldState extends State<Dialog_field> {
  List<PhotoModel> photolist = [
    PhotoModel(title: 'Review from the clubs', isSelect: false),
    PhotoModel(title: 'Review from the guest', isSelect: false),
    PhotoModel(title: 'New artist', isSelect: false),
    PhotoModel(title: 'Low to High', isSelect: false),
    PhotoModel(title: 'High to Low', isSelect: false),
    PhotoModel(title: 'Review from the club', isSelect: false),
    PhotoModel(title: 'At lower threshold', isSelect: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                attentionAdmin();
              },
              child: Container(child: Text('hhhgg'))),
        ],
      ),
    ));
  }

  attentionAdmin() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                insetPadding:
                    EdgeInsets.only(top: 120, left: 30, right: 30, bottom: 110),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF434445),
                      border: Border.all(color: Colors.red)),
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: Text(
                          'Select Time&Date',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 19.0,top: 20,right: 18),
                        child: Container(
                          height: 80,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text('Booking',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left:1),
                                  child: Container(
                                    width: 125,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF666667),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Center(
                                      child: Text('60',style: TextStyle(
                                          color: Colors.white,fontSize: 15
                                      ),),
                                    ),
                                  ),
                                )
                              ]),
                              SizedBox(width: 6,),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Date',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1.0),
                                      child:
                                      Container(
                                          width: 125,
                                          height: 35,
                                          child: Center(
                                            child: Text('30-02-2022',style: TextStyle(
                                              color: Colors.white,fontSize: 15
                                            ),),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF666667),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                        ),

                                    )
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 19.0,top: 15,right: 18),
                        child: Container(
                          height: 80,
                          child: Row(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text('Start Time',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: Container(
                                    width: 125,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF666667),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                    child: Center(
                                      child: Text('05:30',style: TextStyle(
                                          color: Colors.white,fontSize: 15
                                      ),),
                                    ),
                                  ),
                                )
                              ]),
                              SizedBox(width: 6,),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('End Time',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1.0),
                                      child:
                                      Container(
                                          width: 125,
                                          height: 35,
                                          child: Center(
                                            child: Text('11:30',style: TextStyle(
                                              color: Colors.white,fontSize: 15
                                            ),),
                                          ),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF666667),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                        ),

                                    )
                                  ])
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 20),
                        child: Text(
                          'About Event',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 15),
                        child: Container(

                          child: Stack(
                            children: [
                              TextFormField(
                                  maxLines: 5,
                                  autofocus: false,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Color(0xFFbdc6cf)),
                                  decoration: InputDecoration(
                                    hintText: 'Write a message...',
                                    hintStyle: TextStyle(
                                        color: Colors.white70,fontSize: 10
                                    ),
                                    fillColor:Color(0xFF666667),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 25.0, bottom: 12.0, top: 10.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide( color: Color(0xFF666667),),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blueGrey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(left: 220),
                                child: Container(


                                  child: IconButton(
                                    icon: Icon(
                                      Icons.menu_book ,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Container(
                            child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/solo');
                          },
                          child: Container(
                            width: 140,
                            height: 50.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFFFD2F71), Color(0xFFFE262F)],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

class PhotoModel {
  String title;
  bool isSelect;

  PhotoModel({
    required this.title,
    required this.isSelect,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/music_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../ArtistRagistration/Upload_clubs.dart';

class Music_days_page extends StatefulWidget {
  const Music_days_page({Key? key}) : super(key: key);

  @override
  State<Music_days_page> createState() => _Music_days_pageState();
}

class _Music_days_pageState extends State<Music_days_page> {


List<PhotoModel> photolist = [
  PhotoModel(title: 'M', image: "assests/music_img.png", isSelect: false),
  PhotoModel(title: 'T', image: "assests/friday.png", isSelect: false),
  PhotoModel(title: 'W', image: "assests/restra_img.png", isSelect: false),
  PhotoModel(title: 'T', image: "assests/music_img.png", isSelect: false),
  PhotoModel(title: 'F', image: "assests/friday.png", isSelect: false),
  PhotoModel(title: 'S', image: "assests/restra_img.png", isSelect: false),
  PhotoModel(title: 'S', image: "assests/music_img.png", isSelect: false),
];
List<Friend> friends = [
  Friend(label: "Sufi", isSelected: false),
  Friend(label: "Bollywood", isSelected: false),
  Friend(label: "Western", isSelected: false),
];
List<Friend> _selectedAnimals2 = <Friend>[];

List<Widget> SelectedList() {
  List<Widget> Listfriend = [];
  for (int i = 0; i < _selectedAnimals2.length; i++) {
    Widget Item = Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
          height: 40,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: FractionalOffset(0.1, 0.1),
              end: FractionalOffset(0.7, 0.1),
              colors: [
                Color(0xFFFE262F),
                Color(0xFFFD2F71),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(' ${_selectedAnimals2[i].label}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.white)),
                ),
                Container(width: 36,
                  child: IconButton(
                      onPressed: () {
                        bool loopRun =true;
                        for (int j = 0; j < friends.length; j++) {
                          if(loopRun){
                            if (_selectedAnimals2[i].label == friends[j].label) {
                              setState(() {

                                print('fLAWa aaaaa =>${_selectedAnimals2[i]
                                    .label} ,${friends[j].label}');
                                friends[j].isSelected = false;
                                _selectedAnimals2.removeAt(i);
                                loopRun = false;
                              });
                            }
                          }
                        }
                      },
                      icon: Icon(
                        Ionicons.close,
                        color: Colors.white,
                        size: 20,
                      )),
                ),
              ])),
    );
    Listfriend.add(Item);
  }
  return Listfriend;
}

List<Widget> getFilteredFriend() {
  List<Widget> chips = [];
  for (int i = 0; i < friends.length; i++) {
    Widget item = Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 1,
      ),
      child: ChoiceChip(
        padding: EdgeInsets.only(left: 10, right: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
                color: friends[i].isSelected
                    ? Color(0xFFffe4e6)
                    : Color(0xFFfe283b))),
        label: Text(friends[i].label),
        labelStyle: GoogleFonts.poppins(
          color: friends[i].isSelected ? Color(0xFFfd2e6d) : Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        disabledColor: friends[i].isSelected ? Colors.blueGrey : Colors.green,
        backgroundColor:
        friends[i].isSelected ? Color(0xFFfe283b) : Colors.black,
        selected: friends[i].isSelected,
        selectedColor:
        friends[i].isSelected ? Color(0xFFffe4e6) : Colors.transparent,
        onSelected: (selected) {
          setState(() {
            friends[i].isSelected = !friends[i].isSelected;
            print('selected1111 ==> ${_selectedAnimals2.length}');
            if (friends[i].isSelected) {
              _selectedAnimals2.add(friends[i]);
            } else {
              // print('remove work length ===> ${}');
              for (var j = 0; j < _selectedAnimals2.length; j++) {
                if (friends[i].label == _selectedAnimals2[j].label) {
// _selectedAnimals2.remove(value);
                  _selectedAnimals2.removeAt(j);
                }
              }
            }

            print('selected ==> ${_selectedAnimals2.length}');

            // print(_selectedAnimals2);
          });
        },
      ),
    );
    chips.add(item);
  }
  return chips;
}

  String? gender;
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
        child: Container(
          width: width,
          child: Stack(
            children: [
              Container(
                width: width,
                height: height * 0.63,
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
              Padding(
                padding: const EdgeInsets.only(top:120),
                child: Container(
                  // height: 200,
                  width: width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 35, top: 8),
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
                                          photolist[i].isSelect =
                                          !photolist[i].isSelect;
                                        });
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        child: Center(
                                            child: Text(
                                              photolist[i].title,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: FractionalOffset(
                                                    0.1, 0.1),
                                                end: FractionalOffset(
                                                    0.8, 0.1),
                                                colors: photolist[i]
                                                    .isSelect
                                                    ? [
                                                  Color(0xFFFE262F),
                                                  Color(0xFFFD2F71),
                                                ]
                                                    : [
                                                  Colors.black,
                                                  Colors.black,
                                                ]),
                                            border: Border.all(
                                              color: Color(0xFFFE262F),
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(1)),
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35,right:33.0),
                          child: TextFormField(
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: 'Enter a music type..',
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.white54),
                                suffixIcon: Icon(
                                  Ionicons.close,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                fillColor: Color(0xFF434445),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 25.0, bottom: 12.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Center(
                          child: Container(
                            child: Wrap(
                              spacing: 10,
                              children: SelectedList(),
                            ),
                          ),
                        ),
                        Center(

                            child: Container(
                              child: Wrap(
                                spacing: 5,
                                children: getFilteredFriend(),
                              ),
                            ),
                          ),

                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35,right:33.0),
                          child: TextFormField(
                              autofocus: false,
                              style:
                              TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: 'Enter a music type..',
                                hintStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.white54),
                                suffixIcon: Icon(
                                  Ionicons.close,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                fillColor: Color(0xFF434445),
                                filled: true,
                                contentPadding: const EdgeInsets.only(
                                    left: 25.0, bottom: 12.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        Center(
                          child: Container(
                            child: Wrap(
                              spacing: 10,
                              children: SelectedList(),
                            ),
                          ),
                        ),
                    Center(
                            child: Container(
                              child: Wrap(
                                spacing: 5,
                                children: getFilteredFriend(),
                              ),
                            ),
                          ),

                        SizedBox(
                          height: 80,
                        ),
                        Center(
                          child: Container(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/guest_page');
                                },
                                child: Container(
                                  width: 140,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: FractionalOffset(0.1, 0.1),
                                      end: FractionalOffset(0.8, 0.1),
                                      colors: [
                                        Color(0xFFFE262F),
                                        Color(0xFFFD2F71),
                                      ],
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                  ),
                                  child: Center(
                                    child: Text('Submit',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            color: Colors.white)),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/createEventApi.dart';
import 'EventPage.dart';

class Create_event extends StatefulWidget {
  const Create_event({Key? key}) : super(key: key);

  @override
  State<Create_event> createState() => _Create_eventState();
}

class _Create_eventState extends State<Create_event> {
  @override
  void initState() {
    startdate.text = "";
    enddate.text = "";
    getapi();
    getartistform_api();
    super.initState();
  }

  String? dropdownvalue;
  List _contry=[];
  List getartistform=[];
  var data;
  var artist_name;
  getapi()async{
    var response =await http.get(Uri.parse('https://www.partywitty.com/development/api/GetEventType'));
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      setState(() {
        _contry=data['data'];
      });
    }else   print('errrr');
  }
  getartistform_api()async{
    var response =await http.post(Uri.parse('https://partywitty.com/development/api/list_of_artist'));
    if(response.statusCode==200){
      var data= jsonDecode(response.body);
      setState(() {
        getartistform=data['data'];
      });
    }else   print('errrr');
  }

  final _formKey=GlobalKey<FormState>();

  VideoPlayerController _videoPlayerController=VideoPlayerController.network('_video');
  TextEditingController _eventname=TextEditingController();
  TextEditingController _fees=TextEditingController();
  TextEditingController _artisttype=TextEditingController();
  TextEditingController _artist=TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate=TextEditingController();

  File? _image;
  var _imagepath;
  Future getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imagepath=_image!.path;
      } else {
        print('No image selected.');
      }
    });
  }
  File? _video;
  var videopath;
  Future getvideo() async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _video = File(pickedFile.path);
        videopath=_video!.path.toString();
      });
    } else {
      print('No image selected.');
    }

  }
  String? _value;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          centerTitle: true,
          title: Text("Create Event", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child:    Padding(
              padding: const EdgeInsets.only(top: .0),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top:10,left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 3.0, top: 0),
                        child: Text('Event Name',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      TextFormField(
                        controller: _eventname,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'Feild is Empty';
                          }else null;
                        },
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.white),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                _eventname.clear();},
                              icon: Icon(Ionicons.close,color: Colors.white,),
                            ),
                            hintText: 'Enter Event Name..',
                            hintStyle: TextStyle(
                                color: Colors.white, fontSize: 10),
                            fillColor: Color(0xFF434445),
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF434445)),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF434445)),
                              borderRadius: BorderRadius.circular(25.7),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.7)
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:12, left: 20, bottom: 3.0,
                        ),
                        child: Text('Event Type',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      Container(
                        width: width,
                        height: 45,
                        padding: EdgeInsets.only(left: 25,right: 13),
                        decoration: BoxDecoration(
                            color: Color(0xFF434445),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child:  DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                            value: dropdownvalue,
                            dropdownColor: Colors.grey.shade800,
                            style: TextStyle(color: Colors.white),
                            items: _contry.map((items) {
                              return DropdownMenuItem(
                                value: items['name'],
                                child: Text( items['name'],),
                                onTap: (){
                                  data=items['id'];
                                  print('data----$data');
                                },
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {

                                dropdownvalue=value!.toString();
                                print('drop----$dropdownvalue');

                              });

                            },
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:12, left: 20, bottom: 3.0,
                        ),
                        child: Text('Event Date',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:140,
                            child: TextFormField(
                              autofocus: true,
                              controller: startdate,
                              readOnly: true,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Feild is Empty';
                                }else null;
                              },
                              style: TextStyle(fontSize: 13.0, color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: 'Enter start date',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 9,overflow: TextOverflow.clip),
                                suffixIcon: SizedBox(
                                  width: 20,
                                  child: IconButton(onPressed: ()async{
                                    DateTime? pickedTime = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:DateTime(2000),
                                        lastDate: DateTime(2101)
                                    );
                                    if(pickedTime != null ){
                                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime);
                                      print(pickedTime);
                                      // String formattedTime = DateFormat('HH:mm:ss').format(pickedTime);
                                      setState(() {
                                        startdate.text = formattedDate; //set the value of text field.
                                      });
                                    }else{
                                      print("Time is not selected");
                                    }
                                  },icon: Icon(Ionicons.calendar,color: Colors.white,size: 14,),),
                                ),                                fillColor: Color(0xFF434445),
                                filled: true,
                                contentPadding: const EdgeInsets.only(left: 18.0, bottom: 14.0, top: 0.0),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF434445)), borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width:140,
                            child: TextFormField(
                              controller: enddate,
                              readOnly: true,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Feild is Empty';
                                }else null;
                              },
                              autofocus: true,
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: 'Enter End Date',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 9,overflow: TextOverflow.clip),
                                suffixIcon: SizedBox(
                                  width: 20,
                                  child: IconButton(onPressed: ()async{
                                    DateTime? pickedTime = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:DateTime(2000),
                                        lastDate: DateTime(2101)
                                    );
                                    if(pickedTime != null ){
                                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime);
                                      print(pickedTime);
                                      // String formattedTime = DateFormat('HH:mm:ss').format(pickedTime);
                                      setState(() {
                                        enddate.text = formattedDate; //set the value of text field.
                                      });
                                    }else{
                                      print("Time is not selected");
                                    }
                                  },icon: Icon(Ionicons.calendar,color: Colors.white,size: 14,),),
                                ),                                    fillColor: Color(0xFF434445),
                                filled: true,
                                contentPadding: const EdgeInsets.only(left: 18.0, bottom: 12.0, top: 0.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.7)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF434445)),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:12, left: 20, bottom: 3.0,
                        ),
                        child: Text('Cover Photo ',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                getImage();
                              },
                              child: Container(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Photo',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 3),
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        child:ClipRRect(
                                          borderRadius: BorderRadius.circular(10) ,
                                          child: _image == null ?Icon(Ionicons.cloud_upload_outline,color: Colors.white,size: 40,)
                                              :Image.file(_image!,fit: BoxFit.fill,),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF434445),
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {
                                getvideo();
                              },
                              child: Container(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Video',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 3),
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF434445),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10) ,
                                          child: _video == null ?Icon(Ionicons.cloud_upload_outline,color: Colors.white,size: 40,) :Image.file(_video!,fit: BoxFit.fill,),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8, left: 20, bottom: 3.0,
                        ),
                        child: Text('Entry Fees',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      TextFormField(
                        autofocus: true,
                        controller: _fees,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'Feild is Empty';
                          }else null;
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          hintText: 'Enter Entry Fees..',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
                          suffixIcon:IconButton(
                            onPressed: (){_fees.clear();},
                            icon: Icon(Ionicons.close,color: Colors.white,),
                          ),
                          fillColor: Color(0xFF434445),
                          filled: true,
                          contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.7)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF434445)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF434445)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                      ),

                      Padding(padding: const EdgeInsets.only(left: 20.0, bottom: 3.0, top: 12),
                        child: Text("Artist Form",
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      TextFormField(
                        autofocus: true,
                        controller: _artisttype,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'Feild is Empty';
                          }else null;
                        },
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                        decoration: InputDecoration(
                          suffixIcon:IconButton(onPressed:(){

                            // DropdownButtonHideUnderline(
                            //     child: DropdownButton(
                            //       // icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                            //       value: artistform,
                            //         dropdownColor: Colors.grey.shade800,
                            //         style: TextStyle(color: Colors.white),
                            //         items: getartistform.map((items) {
                            //           return DropdownMenuItem(
                            //             value: items['username'],
                            //             child: Text( items['username'],),
                            //           );
                            //         }).toList(),
                            //         onChanged: (value) {
                            //         setState(() {
                            //
                            //           _artisttype.text=value!.toString();
                            //           print('drop----$artistform');
                            //
                            //         });}
                            //     )
                            // );
                          },
                              icon: Icon(Icons.arrow_drop_down,color: Colors.white,size: 30,)),
                          hintText: 'Select Artist Form..',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
                          fillColor: Color(0xFF434445),
                          filled: true,
                          contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF434445)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: OutlineInputBorder(borderSide:
                          BorderSide(color: Color(0xFF434445)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: width,
                        height: 45,
                        padding: EdgeInsets.only(left: 25,right: 13),
                        decoration: BoxDecoration(
                            color: Color(0xFF434445),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child:  DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                            value: artist_name,
                            dropdownColor: Colors.grey.shade800,
                            style: TextStyle(color: Colors.white),
                            items: getartistform.map((items) {
                              return DropdownMenuItem(
                                value: items['username'],
                                child: Text( items['username'],),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                artist_name=value!.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      // TextFormField(
                      //   autofocus: true,
                      //   controller: _artist,
                      //   validator: (val){
                      //     if(val!.isEmpty){
                      //       return 'Feild is Empty';
                      //     }else null;
                      //   },
                      //   style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                      //   decoration: InputDecoration(
                      //     hintText: 'Select Artist',
                      //     hintStyle: TextStyle(color: Colors.white, fontSize: 10),
                      //     suffixIcon:IconButton(
                      //       onPressed: (){_artist.clear();},
                      //       icon: Icon(Ionicons.close,color: Colors.white,),
                      //     ),
                      //     fillColor: Color(0xFF434445),
                      //     filled: true,
                      //     contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                      //     border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(25.7)),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Color(0xFF434445)),
                      //       borderRadius: BorderRadius.circular(25.7),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Color(0xFF434445)),
                      //       borderRadius: BorderRadius.circular(25.7),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print(_artisttype.text.toString());
                                print(dropdownvalue);
                                if(_image==null||_video==null){
                                  CommonToast(context: context,
                                      title: "Please select photo and video",
                                      alignCenter: false);
                                }else
                                if(_formKey.currentState!.validate()) {
                                  print(artist_name);
                                  Createvent_Api().createvent(context: context,
                                      event_name: _eventname.text.toString(),
                                      event_type_id: data.toString(),
                                      start_date: startdate.text.toString(),
                                      end_date: enddate.text.toString(),
                                      entry_fees: _fees.text.toString(),
                                      photo: _imagepath.toString(),
                                      video: videopath.toString(),
                                      artist_type:'party'.toString(),
                                      artist_name: artist_name.toString())
                                      .then((value) {
                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                        builder: (context) => Event_page()),(route)=> false);
                                  });
                                }
                              },
                              child: Container(
                                width: 140,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: FractionalOffset(0.1, 0.1),
                                    end: FractionalOffset(0.7, 0.1),
                                    colors: [Color(0xFFFE262F), Color(0xFFFD2F71),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Center(
                                  child: Text('Submit',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white)),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

}
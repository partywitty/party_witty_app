// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/api_link.dart';
import '../Controller/SharePre.dart';

class Filter_page extends StatefulWidget {
  String artistId;
  Filter_page({Key? key,required this.artistId}) : super(key: key);

  @override
  State<Filter_page> createState() => _Filter_pageState();
}

class _Filter_pageState extends State<Filter_page> {

  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTo = TimeOfDay.now();

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  Future<Null> _selectTo(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (pickedTime != null && pickedTime != selectedTo) {
      setState(() {
        selectedTo = pickedTime;
      });
    }
  }

  final _getUserDetail = GetUserDetail();

  DateTime toInitialDate = DateTime.now();
  TextEditingController _todateController = TextEditingController();
  TextEditingController startTimes = TextEditingController();
  TextEditingController endTimes = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  bool startValue = false;
  bool mainValue = false;
  bool alchoValue = false;
  bool nonValue = false;

  var startCourse=1;
  startIncrement(){
    setState(() {
      startCourse++;
      print(startCourse);
    });
  }
  startDecrement(){
    setState(() {
      if(startCourse>0){
        startCourse--;}
      print(startCourse);
    });
  }

  var mainCourse =1;
  mainIncrement(){
    setState(() {
      mainCourse++;
      print(mainCourse);
    });
  }
  mainDecrement(){
    setState(() {
      if(mainCourse>0){
        mainCourse--;}
      print(mainCourse);
    });
  }

  var achCourse =1;
  achIncrement(){
    setState(() {
      achCourse++;
      print(achCourse);
    });
  }
  achDecrement(){
    setState(() {
      if(achCourse>0){
        achCourse--;}
      print(achCourse);
    });
  }

  var nonCourse =1;
  nonIncrement(){
    setState(() {
      nonCourse++;
      print(nonCourse);
    });
  }
  nonDecrement(){
    setState(() {
      if(nonCourse>0){
        nonCourse--;}
      print(nonCourse);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        physics: ScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0,),
              child: Text(
                'Select Date & Time',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: const Color(0xFF666667),
                  borderRadius:
                  BorderRadius.circular(30)),
              child: TextFormField(
                onTap: ()async{
                  DateTime? pickedDate = await showDatePicker(
                    selectableDayPredicate: (DateTime val) =>
                    val.day == DateTime.now().day - 1 ? false : true,
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 0)),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      toInitialDate = pickedDate;
                      _todateController.text = formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                controller: _todateController,
                readOnly: true,
               style: TextStyle(color: Colors.white,fontSize: 14,),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        selectableDayPredicate: (DateTime val) =>
                        val.day == DateTime.now().day - 1 ? false : true,
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(const Duration(days: 0)),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          toInitialDate = pickedDate;
                          _todateController.text = formattedDate; //set output date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                    child: const Icon(
                      Icons.date_range_outlined,
                      size: 24,
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  enabledBorder: InputBorder.none,
                  hintText: 'Booking Date',
                  hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select from date';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              "Time",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.white),
            ),
            const SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xFF666667),
                      borderRadius:
                      BorderRadius.circular(30)),
                  child: TextField(
                    controller: startTimes,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      hintText: selectedTime.format(context),
                      hintStyle: const TextStyle(color: Colors.white,fontSize: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius:
                        BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius:
                          BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius:
                        BorderRadius.circular(30.0),
                      ),
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      _selectTime(context);
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color(0xFF666667),
                      borderRadius:
                      BorderRadius.circular(30)),
                  child: TextField(
                    controller: startTimes,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      hintText: selectedTo.format(context),
                      hintStyle: const TextStyle(color: Colors.white,fontSize: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius:
                        BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius:
                          BorderRadius.circular(30.0)),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius:
                        BorderRadius.circular(30.0),
                      ),
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      _selectTo(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20),
              child: Text(
                'About Event',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              controller: aboutController,
                maxLines: 3,
                autofocus: false,
                style: const TextStyle(
                    fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintText: 'Write a message...',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: Colors.white54),
                  fillColor: Color(0xFF666667),
                  filled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xFF666667),),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Color(0xFF666667),),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
            const SizedBox(height: 10.0,),

            ListTile(
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              leading: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                        BorderSide(width: 1.0, color: Colors.blue),
                  ),
                  value: startValue,
                  onChanged: (value) {
                    startValue = value!;
                    setState(() {
                      print(value);
                    });
                  }),
              title: Text("Starter",style:  TextStyle(color: Colors.white),),
              trailing: Container(
                height:31,
                width: 110,
                decoration:BoxDecoration(
                  color: Color(0xFF434445),
                  borderRadius: BorderRadius.circular(5),),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      startIncrement();
                    }, icon: Icon(Icons.add,size: 14,color: Colors.white,)),
                    Text(startCourse.toString(),
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                    IconButton(
                      icon: Icon(Icons.remove), onPressed: (){
                      startDecrement();
                    }, iconSize: 14,color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              leading: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                        BorderSide(width: 1.0, color: Colors.blue),
                  ),
                  value: mainValue,
                  onChanged: (value) {
                    mainValue = value!;
                    setState(() {
                      print(value);
                    });
                  }),
              title: const Text("Main course",style:  TextStyle(color: Colors.white),),
              trailing: Container(
                height:31,
                width: 110,
                decoration:BoxDecoration(
                  color: const Color(0xFF434445),
                  borderRadius: BorderRadius.circular(5),),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      mainIncrement();
                    }, icon: const Icon(Icons.add,size: 14,color: Colors.white,)),
                    Text(mainCourse.toString(),
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                    IconButton(
                      icon: const Icon(Icons.remove), onPressed: (){
                      mainDecrement();
                    }, iconSize: 14,color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              leading: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                        BorderSide(width: 1.0, color: Colors.blue),
                  ),
                  value: alchoValue,
                  onChanged: (value) {
                    alchoValue = value!;
                    setState(() {
                      print(value);
                    });
                  }),
              title: const Text("Acholic Beverages",style:  TextStyle(color: Colors.white),),
              trailing: Container(
                height:31,
                width: 110,
                decoration:BoxDecoration(
                  color: const Color(0xFF434445),
                  borderRadius: BorderRadius.circular(5),),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      achIncrement();
                    }, icon: const Icon(Icons.add,size: 14,color: Colors.white,)),
                    Text(achCourse.toString(),
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                    IconButton(
                      icon: const Icon(Icons.remove), onPressed: (){
                      achDecrement();
                    }, iconSize: 14,color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              horizontalTitleGap: 0,
              minVerticalPadding: 0,
              minLeadingWidth: 0,
              leading: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                        BorderSide(width: 1.0, color: Colors.blue),
                  ),
                  value: nonValue,
                  onChanged: (value) {
                    nonValue = value!;
                    setState(() {
                      print(value);
                    });
                  }),
              title: const Text("Non Acholic Beverages",style:  TextStyle(color: Colors.white),),
              trailing: Container(
                height:31,
                width: 110,
                decoration:BoxDecoration(
                  color: const Color(0xFF434445),
                  borderRadius: BorderRadius.circular(5),),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      nonIncrement();
                    }, icon: const Icon(Icons.add,size: 14,color: Colors.white,)),
                    Text(nonCourse.toString(),
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                    IconButton(
                      icon: const Icon(Icons.remove), onPressed: (){
                      nonDecrement();
                    }, iconSize: 14,color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                onTap: () {
                  if(_todateController.text.isEmpty ||
                      selectedTime.format(context).isEmpty||
                  selectedTo.format(context).isEmpty ||
                      aboutController.text.isEmpty){
                    CommonToast(context: context, title: 'All field mandatory', alignCenter: false);
                  }else{
                    requestBooking(
                        artistId: widget.artistId,
                        bookDate: _todateController.text,
                        startDate: selectedTime.format(context),
                        endDate: selectedTo.format(context),
                        aboutUs: aboutController.text,
                        starter: "${startValue == true ?  startCourse : "0"}",
                        mainCourse: "${mainValue == true ? mainCourse : "0"}",
                        achoCourse: "${ alchoValue == true ? achCourse : "0"}",
                        nonCourse: "${nonValue == true ? nonCourse : "0"}",
                        context: context
                    );
                  }
                },
                child: Container(
                  width: 140,
                  height: 50.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset(0.1, 0.1),
                      end: FractionalOffset(0.7, 0.1),
                      colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Center(
                    child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize:14, color: Colors.white)
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
    );
  }
  Future requestBooking({
    required String artistId,
    required String bookDate,
    required String startDate,
    required String endDate,
    required String aboutUs,
    required String starter,
    required String mainCourse,
    required String achoCourse,
    required String nonCourse,
    required BuildContext context,}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.bookingRequest));
      request.fields.addAll({
        'request_by': userId,
        'request_to': artistId,
        'book_date': bookDate,
        'start_time': startDate,
        'end_time': endDate,
        'about_event': aboutUs,
        'starter': starter,
        'main_course': mainCourse,
        'acholic_beverages':achoCourse,
        'non_acholic_beverages':nonCourse,
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Instrument Name is required', alignCenter: false);
        } else {
          Navigator.pop(context);
          CommonToast(context: context, title: 'successfully', alignCenter: false);
        }
        print(responseDecode);
      } else {
        print(response.reasonPhrase);
      }}catch(e){
      print("-------------error-------------booking request");
      print(e);
    }
  }
}


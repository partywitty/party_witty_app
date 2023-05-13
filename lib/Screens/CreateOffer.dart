import 'package:flutter/material.dart';
import 'package:flutter_app/ApiServices/api_link.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/date_symbol_data_http_request.dart';
import 'package:ionicons/ionicons.dart';
import '../ApiServices/createOfferApi.dart';
import '../Club/Club_Home.dart';
import 'package:intl/intl.dart';

import 'offerDetails.dart';
class Create_offer extends StatefulWidget {
  const Create_offer({Key? key}) : super(key: key);

  @override
  State<Create_offer> createState() => _Create_offerState();
}

class _Create_offerState extends State<Create_offer> {

  List<PhotoModel> photolist = [
    PhotoModel(title: 'M', image: "mon", isSelect: false),
    PhotoModel(title: 'T', image: "tue", isSelect: false),
    PhotoModel(title: 'W', image: "wed", isSelect: false),
    PhotoModel(title: 'T', image: "thu", isSelect: false),
    PhotoModel(title: 'F', image: "fri", isSelect: false),
    PhotoModel(title: 'S', image: "sat", isSelect: false),
    PhotoModel(title: 'S', image: "sun", isSelect: false),
  ];
  TextEditingController clubname=TextEditingController();
  TextEditingController people=TextEditingController();
  TextEditingController  mrp=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController enddate=TextEditingController();
  TextEditingController starttime=TextEditingController();
  TextEditingController endtime=TextEditingController();
  @override
  void initState() {
    startdate.text = "";
    enddate.text = "";
    super.initState();
  }
  final _formKey=GlobalKey<FormState>();
  var selectvalue;
  bool isselect =false;
  bool value = false;
  List data=[];
  String? _selectstartTime;
  String? _selectendTime;


  Future<void> _showstart() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(
                // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectstartTime = result.format(context) ;
        starttime.text = _selectstartTime.toString();
        print('_selectendTime$_selectendTime');
        print(starttime.text);
      });
    }
  }

  Future<void> _showend() async {
    final TimeOfDay? result = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(
                // Using 12-Hour format
                  alwaysUse24HourFormat: false),
              // If you want 24-Hour format, just change alwaysUse24HourFormat to true
              child: child!);
        });
    if (result != null) {
      setState(() {
        _selectendTime = result.format(context) ;
        endtime.text = _selectendTime.toString();
        print('_selectendTime$_selectendTime');
        print(starttime.text);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
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
        title: Text("Create Offer", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                        child: Text('Offer Name',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      TextFormField(
                        controller: clubname,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'Please enter  Offer name';
                          }else null;
                        },
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.white),
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){clubname.clear();},
                              icon: Icon(Ionicons.close,color: Colors.white,),
                            ),
                            hintText: 'Enter Offer Name..',
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
                        child: Text('Valid For',
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
                                  return 'Enter start date';
                                }else null;
                              },
                              style: TextStyle(fontSize: 13.0,
                                  color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: 'Start Date',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 9,overflow: TextOverflow.clip),
                                suffixIcon: SizedBox(
                                  width: 20,
                                  child: IconButton(onPressed: ()async{

                                    DateTime? pickedTime = await showDatePicker(
                                        context: context,

                                        initialDate: DateTime.now(), //get today's date
                                        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
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
                                ),
                                fillColor: Color(0xFF434445),
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
                                  return 'Enter End Date';
                                }else null;
                              },
                              autofocus: true,
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: 'End Date',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 9,overflow: TextOverflow.clip),
                                suffixIcon: IconButton(
                                  onPressed: ()async{
                                    DateTime? pickedTime = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(), //get today's date
                                        firstDate:DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if(pickedTime != null ){
                                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime);
                                      print(pickedTime);
                                      setState(() {
                                        enddate.text = formattedDate;
                                      });
                                    }else{
                                      print("Time is not selected");
                                    }
                                  },icon: Icon(Ionicons.calendar,color: Colors.white,size: 14,),),
                                fillColor: Color(0xFF434445),
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
                        padding: const EdgeInsets.only(top:12, left: 20,),
                        child: Text('Valid On',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
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
                                      height: 25,
                                      width: 25,
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
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:5, left: 20, bottom: 3.0,
                        ),
                        child: Text('Timing',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width:140,
                            child: TextFormField(
                              autofocus: true,
                              readOnly: true,
                              textAlign: TextAlign.center,
                              controller: starttime,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'empty';
                                }else null;
                              },
                              onTap: () {
                                _showstart();
                              },
                              style: TextStyle(fontSize: 15.0,
                                  color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(
                                hintText: 'Enter start Time',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 9,overflow: TextOverflow.clip),
                                fillColor: Color(0xFF434445),
                                filled: true,
                                contentPadding: const EdgeInsets.only( bottom: 14.0, top: 0.0),
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
                              controller: endtime,
                              textAlign: TextAlign.center,
                              readOnly: true,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'empty';
                                }else null;
                              },
                              onTap: (){
                                _showend();
                              },
                              autofocus: true,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFFbdc6cf)),
                              decoration: InputDecoration(

                                hintText: 'Enter End Time',
                                hintStyle: TextStyle(color: Colors.white, fontSize: 9,overflow: TextOverflow.clip),
                                fillColor: Color(0xFF434445),
                                filled: true,

                                contentPadding: const EdgeInsets.only( bottom: 12.0, top: 0.0),
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
                        padding: const EdgeInsets.only(top:8, left: 20, bottom: 3.0,
                        ),
                        child: Text('No. of Allow  Person',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      TextFormField(
                        autofocus: true,
                        controller: people,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'empty';
                          }else null;
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          hintText: 'Enter..',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
                          suffixIcon:IconButton(
                            onPressed: (){people.clear();},
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
                      Padding(
                        padding: const EdgeInsets.only(top:8, left: 20, bottom: 3.0,
                        ),
                        child: Text('MRP',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      TextFormField(
                        autofocus: true,
                        controller: mrp,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'empty';
                          }else null;
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          hintText: 'Enter Offer Price..',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
                          suffixIcon:IconButton(
                            onPressed: (){mrp.clear();},
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
                      Padding(
                        padding: const EdgeInsets.only(top:8, left: 20, bottom: 3.0,
                        ),
                        child: Text('Offer Price',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      TextFormField(
                        autofocus: true,
                        controller: price,
                        validator: (val){
                          if(val!.isEmpty){
                            return 'empty';
                          }else null;
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          hintText: 'Enter Price..',
                          hintStyle: TextStyle(color: Colors.white, fontSize: 10),
                          suffixIcon:IconButton(
                            onPressed: (){price.clear();},
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
                      Padding(
                        padding: const EdgeInsets.only(top:12, left: 20, bottom: 3.0,
                        ),
                        child: Text('Deal Type ',
                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 10),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectvalue='For Couple';
                                });
                              },
                              child: Container(
                                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0, bottom: 3),
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        child: Image.asset('assests/couple.png', scale: 4,
                                        ),
                                        decoration: BoxDecoration(color: Color(0xFF434445),
                                            border: Border.all(color:selectvalue=='For Couple'?Colors.red:Colors.transparent),
                                            borderRadius: BorderRadius.circular(10)),
                                      ),
                                    ),
                                    Text('For Couple',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectvalue= 'For Stag';
                                });
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0, bottom: 3),
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(color: Color(0xFF434445),
                                            border: Border.all(color:selectvalue=='For Stag'?Colors.red:Colors.transparent),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Image.asset('assests/stag.png', scale: 4,
                                        ),
                                      ),
                                    ),
                                    Text('For Stag',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectvalue="Both";
                                });
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0, bottom: 3),
                                      child: Container(
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(color: Color(0xFF434445),
                                            border: Border.all(color:selectvalue=='Both'?Colors.red:Colors.transparent),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Image.asset('assests/dowmload_icon.png', scale: 4,
                                        ),
                                      ),
                                    ),
                                    Text('Both',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 50,),
                      Center(
                        child: Container(
                            child: GestureDetector(
                              onTap: () {
                                print(selectvalue);
                                if(data.isEmpty) {
                                  CommonToast(context: context,
                                      title: "Please select day",
                                      alignCenter: false);
                                }else if(selectvalue==null){
                                  CommonToast(context: context,
                                      title: "Please select deal type",
                                      alignCenter: false);
                                }else
                                if(_formKey.currentState!.validate()) {
                                  Createoffer_Api().createoffer(
                                    name: clubname.text.toString(),
                                    startdate: startdate.text.toString(),
                                    enddate: enddate.text.toString(),
                                    day: data.join(',').toString(),
                                    starttime: starttime.text.toString(),
                                    endtime: endtime.text.toString(),
                                    people: people.text.toString(),
                                    price: price.text.toString(),
                                    mrp: mrp.text.toString(),
                                    deal_type: selectvalue,

                                  ).then((value) {
                                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>
                                        Offer_detail()),(route)=>false);
                                  });
                                }   },
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
                                  child: Text('Create Menu',
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white)),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
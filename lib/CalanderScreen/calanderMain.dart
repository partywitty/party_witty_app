
// ignore_for_file: camel_case_types
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';
import '../ArtistScreen/artistRedDrawer.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;
import '../Modal/uploadImageM.dart';

class calenderScreen extends StatefulWidget {
  const calenderScreen({Key? key}) : super(key: key);

  @override
  State<calenderScreen> createState() => _calenderScreenState();
}

class _calenderScreenState extends State<calenderScreen> {
  final _getUserDetail = GetUserDetail();
  List<uploadData> profilePhoto = [];

  bool loader = false;

  load(){
    setState(() {
      profilePercentage(context: context).then((value) {
        setState(() {
          loader = true;
        });
      });
    });
    fileUploadList().uploadImageApi(type: "1").then((value) {
      setState(() {
        //profilePhoto = value.data!;
        dataImage = value.data![0].filePath;
      });
    });
  }
  String? gender;
  var dataImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  var totalPercentage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: loader == false ? const CircularProgressIndicator() :  ArtistRedDrawer().getDrawer(context,totalPercentage),
      appBar: AppBar(
        backgroundColor: Colors.black,
        // actions: [
        //   InkWell(
        //     onTap: ()async{
        //       final getuser_id=GetUserDetail();
        //       var userId = await getuser_id.remove('id');
        //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login(),),(route)=> false);
        //       // final prefs = await SharedPreferences.getInstance();
        //       // var userId = await _getUserDetail.getUserData('id');
        //       // await prefs.remove(userId);
        //       // Navigator.push(context, MaterialPageRoute(builder: (context) => login(),));
        //     },
        //       child: const Icon(Icons.login,size: 24,color: Colors.white,)),
        //   const SizedBox(width: 20.0,)
        // ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/1.5,
            child: SfCalendar(
              onTap: (calendarTapDetails) =>
              avalitiDialog(context),
               //   Navigator.push(context, MaterialPageRoute(builder: (context) => event_Details())),
              view: CalendarView.month,
              dataSource: MeetingDataSource(_getDataSource()),
              backgroundColor: Colors.white,
              firstDayOfWeek: 1,
              allowedViews: [
                CalendarView.day,
                CalendarView.week,
                CalendarView.workWeek,
                CalendarView.month,
              ],
              showCurrentTimeIndicator: false,
              monthViewSettings: const MonthViewSettings(showAgenda: true),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: (){
              launch('tel:+918299619469');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(" Help",style: cardSubTitle),
                  const SizedBox(
                      height: 25,
                      child: VerticalDivider(width: 20,color: Colors.white,)),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: const Icon(Icons.support_agent_sharp,color: Colors.white,size: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> avalitiDialog(BuildContext context) {
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
                    Text("Artist",style: GoogleFonts.poppins(textStyle: drawerSubtitle)),
                    Theme(
                      data: ThemeData(
                        unselectedWidgetColor: appColor,
                      ),
                      child: Wrap(
                        children: [
                          RadioListTile(
                            activeColor: appColor,
                            title: const Text("Yes",style: textFill,),
                            value: "yes",
                            groupValue: gender,
                            onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                          RadioListTile(
                            activeColor: appColor,
                            title: const Text("No",style: textFill,),
                            value: "no",
                            groupValue: gender,
                            onChanged: (value){
                              setState(() {
                                gender = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              );
            }),
          );
        }
    );
  }

  Future<void> profilePercentage({required BuildContext context}) async {
    var userId = await _getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.profilePercentage));
      request.fields.addAll({
        'user_id': userId,
        'profile_id' : DataManager.getInstance().getProfile().toString()
      });
      http.StreamedResponse response = await request.send();
      print(request.fields);
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          CommonToast(context: context, title: 'Venue Name is required', alignCenter: false);
          return  responseDecode['data'];
        } else {
          setState(() {
            totalPercentage =  responseDecode['data'];
            print(totalPercentage);
          });
          return  responseDecode['data'];

        }
      //  isLoading.value = false;
        print(responseDecode);
      } else {
        CommonToast(context: context, title: 'Internal server error', alignCenter: false);
        print(response.reasonPhrase);
      }}catch(e){
     // isLoading.value = false;
      CommonToast(context: context, title: 'Check My connection', alignCenter: true);
      print(e);
    }
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}
class MeetingDataSource extends CalendarDataSource {

  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
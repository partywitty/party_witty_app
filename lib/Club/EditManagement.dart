
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class editManagement extends StatefulWidget {
  const editManagement({Key? key}) : super(key: key);

  @override
  State<editManagement> createState() => _editManagementState();
}

class _editManagementState extends State<editManagement> {

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate=TextEditingController();

  final double _height = Get.height, _width = Get.width;
  List<daysModal> daysList = [
    daysModal(title: 'M', image: "mon", isSelect: false),
    daysModal(title: 'T', image: "tue", isSelect: false),
    daysModal(title: 'W', image: "wed", isSelect: false),
    daysModal(title: 'T', image: "thu", isSelect: false),
    daysModal(title: 'F', image: "fri", isSelect: false),
    daysModal(title: 'S', image: "sat", isSelect: false),
    daysModal(title: 'S', image: "sun", isSelect: false),
  ];
  List data=[];
  @override
  void initState() {
    startDate.text = "";
    endDate.text = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Edit Management",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
            decoration: BoxDecoration(
              color: drawerColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("188 Bought",style: GoogleFonts.poppins(textStyle: grayText)),
                    Row(
                      children: [
                        Text("4IMFL(30ml)/4 BEAR\n+1 Starter/Pint",style: GoogleFonts.poppins(textStyle: bigTitle)),
                        const Spacer(),
                        CircleAvatar(
                          backgroundColor: exitColor,
                          child: Image.asset("assests/eFluent.png",fit: BoxFit.fill,height: 25),
                        ),
                      ],
                    ),
                    Text('Free Cancellation', style: GoogleFonts.poppins(textStyle: greenText)),
                    Text('Valid on : All Days | Timing : 12:00 PM - 12:00 AM | Valid  : 2 people', style: GoogleFonts.poppins(textStyle: cardTitle)),
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: cardButtonColor),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text("Inclusions",style: GoogleFonts.poppins(textStyle: blueText)),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: cardButtonColor),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Text("Details",style: GoogleFonts.poppins(textStyle: blueText)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Text('Valid on', style: GoogleFonts.poppins(textStyle: bigTitle)),
          const SizedBox(height: 5.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter house no.';
              }
              return null;
            },
           // controller: houseNo,
            keyboardType: TextInputType.phone,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter Date"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 7,
                itemBuilder: (context, i) {
                  return Wrap(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if( daysList[i].isSelect==false){
                              data.add(daysList[i].image);
                            }else if(daysList[i].isSelect==true){
                              data.remove(daysList[i].image);
                            }
                            daysList[i].isSelect = !daysList[i].isSelect;
                            // print(daysList[i].toString());
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: const FractionalOffset(0.1, 0.1),
                                  end: const FractionalOffset(0.8, 0.1),
                                  colors: daysList[i].isSelect? [const Color(0xFFFE262F), const Color(0xFFFD2F71),
                                  ] : [Colors.black, Colors.black,]),
                              border: Border.all(color: const Color(0xFFFE262F),),
                              borderRadius: BorderRadius.circular(1)),
                          child: Center(
                              child: Text(daysList[i].title, style: const TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                  ]);
                },
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width:140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  Start Date', style: GoogleFonts.poppins(textStyle: bigTitle)),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      autofocus: true,
                      controller: startDate,
                      readOnly: true,
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Enter start date';
                        }else {
                          null;
                        }
                        return null;
                      },
                      style: textFill,
                      decoration: inputDecoration(
                        context,hint: "Enter Date",
                        suffixIcon: IconButton(
                          onPressed: ()async{
                          DateTime? pickedTime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(), //get today's date
                              firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );
                          if(pickedTime != null ){
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime);

                            // String formattedTime = DateFormat('HH:mm:ss').format(pickedTime);
                            setState(() {
                              startDate.text = formattedDate; //set the value of text field.
                            });
                          }else{

                          }
                        },icon: const Icon(Icons.calendar_month_outlined,color: Colors.white,size: 18),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width:140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('  End Date', style: GoogleFonts.poppins(textStyle: bigTitle)),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: endDate,
                      readOnly: true,
                      validator: (val){
                        if(val!.isEmpty){
                          return 'Enter End Date';
                        }else {
                          null;
                        }
                        return null;
                      },
                      autofocus: true,
                      style: textFill,
                      decoration: inputDecoration(
                        context,hint: "Enter Date",
                        suffixIcon: IconButton(
                          onPressed: ()async{
                            DateTime? pickedTime = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate:DateTime(2000),
                                lastDate: DateTime(2101));
                            if(pickedTime != null ){
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime);
                              setState(() {
                                endDate.text = formattedDate;
                              });
                            }else{

                            }
                          },icon: const Icon(Icons.calendar_month_outlined,color: Colors.white,size: 18),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text('Menu Offering', style: GoogleFonts.poppins(textStyle: bigTitle)),
          const SizedBox(height: 10.0),
          Text('Food Menu Offering', style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            decoration: BoxDecoration(
              color: appBarColor,
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: _height*0.13,
                  width: _width*0.25,
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: const Icon(Icons.cloud_download_outlined,color: Colors.white,size: 50),
                ),
                Image.asset("assests/menu1.png",fit: BoxFit.fill, height: _height*0.13,width: _width*0.25,),
                Image.asset("assests/menu1.png",fit: BoxFit.fill, height: _height*0.13,width: _width*0.25,)
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Text('Beverages Menu Offering', style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            decoration: BoxDecoration(
              color: appBarColor,
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: _height*0.13,
                  width: _width*0.25,
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: const Icon(Icons.cloud_download_outlined,color: Colors.white,size: 50),
                ),
                Image.asset("assests/menu1.png",fit: BoxFit.fill, height: _height*0.13,width: _width*0.25,),
                Image.asset("assests/menu1.png",fit: BoxFit.fill, height: _height*0.13,width: _width*0.25,)
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Text('Alcohol Menu Offering', style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
            decoration: BoxDecoration(
              color: appBarColor,
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: _height*0.13,
                  width: _width*0.25,
                  decoration: BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: const Icon(Icons.cloud_download_outlined,color: Colors.white,size: 50),
                ),
                Image.asset("assests/menu1.png",fit: BoxFit.fill, height: _height*0.13,width: _width*0.25,),
                Image.asset("assests/menu1.png",fit: BoxFit.fill, height: _height*0.13,width: _width*0.25,)
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              width: _width*0.30,
              height: _height*0.06,
              decoration: boxDecoration(),
              child: Text('Submit', style: GoogleFonts.poppins(textStyle: buttonText)),
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
class daysModal {
  String image;
  String title;
  bool isSelect;

  daysModal({
    required this.title,
    required this.image,
    required this.isSelect,
  });
}
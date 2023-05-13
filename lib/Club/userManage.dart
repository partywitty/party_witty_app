
import 'package:flutter/material.dart';
import 'package:flutter_app/Club/userManagment.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class UserManage extends StatefulWidget {
  const UserManage({Key? key}) : super(key: key);

  @override
  State<UserManage> createState() => _UserManageState();
}

class _UserManageState extends State<UserManage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController timeController = TextEditingController();
  bool status = false;
  String dropdownvalue = 'This month';
  String userValue = 'All user';
  var items = ['This month', '+92', '+93', '+94', '+95'];
  var userItems = ['All user', '+92', '+93', '+94', '+95'];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('User Management',style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            height: 40,
            child: TabBar(
              labelColor: appColor,
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 2.0,
              indicatorColor: appColor,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
              tabs: const <Widget>[
                Tab(
                  child: Text('MANAGE USER',),
                ),
                Tab(
                  child: Text("ACTIVITY",),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                 children: [
                   const SizedBox(height: 20.0),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(4.0),
                       color: drawerColor
                     ),
                     child: Column(
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             const Text("User Roles & Permission",style: textLabel),
                             FlutterSwitch(
                               height: 20.0,
                               width: 40.0,
                               padding: 4.0,
                               toggleSize: 15.0,
                               borderRadius: 10.0,
                               activeColor: appColor,
                               value: status,
                               onToggle: (value) {
                                 setState(() {
                                   status = value;
                                 });
                               },
                             ),
                           ],
                         ),
                         const SizedBox(height: 10.0),
                         Text("Turning it off, will disable all the users and all the access will be discarded.",
                             style: GoogleFonts.poppins(textStyle: grayText)),
                       ],
                     ),
                   ),
                   const SizedBox(height: 15.0),
                   const Text("Users",style: textLabel),
                   const SizedBox(height: 10.0),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4.0),
                         color: drawerColor
                     ),
                     child: Column(
                       children: const [
                         ListTile(
                           title: Text("Admin",style: cardTitle),
                           trailing: Text("Change Password",style: TextStyle(color: appColor,fontSize: 14,fontWeight: FontWeight.w400)),
                           subtitle: Text("Primary Admin",style: grayText),
                         )
                       ],
                     ),
                   ),
                   const SizedBox(height: 10.0),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4.0),
                         color: drawerColor
                     ),
                     child: Column(
                       children: const [
                         ListTile(
                           title: Text("Anshika",style: cardTitle),
                           trailing: Text("Change Password",style: TextStyle(color: appColor,fontSize: 14,fontWeight: FontWeight.w400)),
                           subtitle: Text("Primary Admin",style: grayText),
                         )
                       ],
                     ),
                   ),
                   const SizedBox(height: 10.0),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4.0),
                         color: drawerColor
                     ),
                     child: Column(
                       children: const [
                         ListTile(
                           title: Text("surbhi",style: cardTitle),
                           trailing: Text("Change Password",style: TextStyle(color: appColor,fontSize: 14,fontWeight: FontWeight.w400)),
                           subtitle: Text("Primary Admin",style: grayText),
                         )
                       ],
                     ),
                   ),
                   const SizedBox(height: 10.0),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(4.0),
                         color: drawerColor
                     ),
                     child: Column(
                       children: const [
                         ListTile(
                           title: Text("Anshika",style: cardTitle),
                           trailing: Text("Change Password",style: TextStyle(color: appColor,fontSize: 14,fontWeight: FontWeight.w400)),
                           subtitle: Text("Primary Admin",style: grayText),
                         )
                       ],
                     ),
                   ),
                   const SizedBox(height: 30.0),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const UserManagement()));
                     },
                     child: Container(
                       margin: const EdgeInsets.symmetric(horizontal: 20.0),
                       alignment: Alignment.center,
                       width: 120,
                       height: 45.0,
                       decoration:  boxDecoration(),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Icon(Icons.add_circle,color: Colors.white),
                           const SizedBox(width: 10.0),
                           Text('Add New User', style: GoogleFonts.poppins(textStyle: buttonText)),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
                ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(
                            width: 150,
                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                           decoration: (BoxDecoration(
                               color: const Color(0xFF434445),
                               borderRadius: BorderRadius.circular(30))),
                           child: DropdownButtonHideUnderline(
                               child:  DropdownButton(
                                 iconSize: 35,
                                 style: const TextStyle(color: Colors.white),
                                 borderRadius: BorderRadius.circular(10),
                                 value: dropdownvalue,
                                 dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                                 items: items.map((String items) {
                                   return DropdownMenuItem(
                                     enabled: true,
                                     value: items,
                                     child: Text(items),
                                   );
                                 }).toList(),
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     dropdownvalue = newValue!;
                                   });
                                 },
                               )),
                         ),
                         Container(
                           width: 150,
                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
                           decoration: (BoxDecoration(
                               color: const Color(0xFF434445),
                               borderRadius: BorderRadius.circular(30))),
                           child: DropdownButtonHideUnderline(
                               child:  DropdownButton(
                                 iconSize: 35,
                                 style: const TextStyle(color: Colors.white),
                                 borderRadius: BorderRadius.circular(10),
                                 value: userValue,
                                 dropdownColor: Colors.blueGrey,focusColor: Colors.blue,
                                 items: userItems.map((String items) {
                                   return DropdownMenuItem(
                                     enabled: true,
                                     value: items,
                                     child: Text(items),
                                   );
                                 }).toList(),
                                 onChanged: (String? newValue) {
                                   setState(() {
                                     userValue = newValue!;
                                   });
                                 },
                               )),
                         ),
                       ],
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: timeController,
                      style: textFill,
                      decoration: inputDecoration(context,hint: "Start and end time"),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Activity',style: textLabel),
                        Text('Date/Time',style: textLabel),
                      ],
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: drawerColor
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: const Text("Admin (Primary Admin)",style: cardTitle),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("05/04/2023",style: cardTitle),
                                    Text("16:41:37",style: cardTitle),
                                  ],
                                ),
                                subtitle: const Text("logged in",style: grayText),
                              )
                            ],
                          ),
                        );
                      },),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_app/Club/userManage.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  TextEditingController roleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add User',style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const Text('  User Role',style: textLabel),
          const SizedBox(height: 5.0),
          TextFormField(
           controller: roleController,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter Role"),
          ),
          const SizedBox(height: 5.0),
          Row(
            children: const [
              Spacer(),
              Text("View Permission",style: TextStyle(color: appColor,fontSize: 12,fontWeight: FontWeight.w400)),
            ],
          ),
          const Text('  User Name',style: textLabel),
          const SizedBox(height: 5.0),
          TextFormField(
            controller: nameController,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter Name"),
          ),
          const SizedBox(height: 5.0),
          const Text('  Password',style: textLabel),
          const SizedBox(height: 5.0),
          TextFormField(
            controller: passwordController,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter Password"),
          ),
          const SizedBox(height: 10.0),
          Text('Enter 4 digit numeric passcode Set your passcode to restrict other salesman to see your data. This passcode will be required every time you open this company.',
              style: GoogleFonts.poppins(textStyle: cardSubTitle),
          ),
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 10.0),
            decoration: BoxDecoration(
              color: drawerColor,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Enable Multi device Sync For This User",style: textLabel),
                FlutterSwitch(
                  height: 20.0,
                  width: 40.0,
                  padding: 4.0,
                  toggleSize: 15.0,
                  borderRadius: 10.0,
                  activeColor: Colors.green,
                  value: status,
                  onToggle: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
        ],
      ),
      bottomSheet: Container(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UserManage()));
              },
              child: Container(
                alignment: Alignment.center,
                width: 120,
                height: 45.0,
                decoration:  boxDecoration(),
                child: Text('Save & New', style: GoogleFonts.poppins(textStyle: buttonText)),
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                width: 120,
                height: 45.0,
                decoration:  boxDecoration(),
                child: Text('Save', style: GoogleFonts.poppins(textStyle: buttonText)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

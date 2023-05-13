
import 'package:flutter/material.dart';
import 'package:flutter_app/Club/dealManagment.dart';
import 'package:flutter_app/Controller/DataManager.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Auth/Login.dart';
import '../Club/clubEditProfile.dart';
import '../Club/partyWittypay.dart';
import '../Club/userManage.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import '../Location/currentLocation.dart';

class ClubDrawer{
  getDrawer(context){
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.1,
      child: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
          child: Column(
            children: [
              Container(
                color: const Color(0xFF2F1866),
                padding: const EdgeInsets.only(top: 60.0,left: 20.0,right: 20.0,bottom: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(DataManager.getInstance().getName(),style: drawerTitle),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.email,color: Colors.white,size: 14),
                                const SizedBox(width: 2),
                                Text(DataManager.getInstance().getEmail(),style: cardSubTitle,),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.phone,color: Colors.white,size: 14),
                                const SizedBox(width: 2),
                                Text(DataManager.getInstance().getNumber(),style: cardSubTitle,),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 20.0,),
                        Container(
                          decoration : BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.yellow,
                          ),
                          child: const Icon(Icons.person,size: 50,color: Colors.grey,),
                        ),
                        const SizedBox(width: 10.0,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration : BoxDecoration(
                            border: Border.all(color:  Colors.white),
                            borderRadius: BorderRadius.circular(50.0),
                            color: const Color(0xFF2F1866),
                          ),
                          child: const Icon(Icons.add,size: 25,color: Colors.white,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const Align(
                       alignment: Alignment.topRight,
                        child: Icon(Icons.edit_note,color: Colors.white,size: 24,))
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: (){
                     // Navigator.push(context, MaterialPageRoute(builder: (context) => const bookingPolicy(),));
                        Get.to(const currentLocation());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: drawerColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.edit,color: Colors.white,size: 22),
                            const SizedBox(width: 5.0),
                            Text("Manage Profiles",style: GoogleFonts.poppins(textStyle: drawerTitle),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: (){
                        Get.to(const dealManagment());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: drawerColor,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 5.0),
                            const Icon(Icons.settings,color: Colors.white,size: 22),
                            const SizedBox(width: 5.0),
                            Text("Deals Management",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                            const SizedBox(width: 10.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.account_balance_wallet_outlined,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Wallet & Rewards",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.person,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Club Profile",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: (){
                        Get.to(const clubEditProfile());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: drawerColor,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 5.0),
                            const Icon(Icons.groups,color: Colors.white,size: 22),
                            const SizedBox(width: 5.0),
                            Text("Profile Management",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                            const SizedBox(width: 10.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.account_balance,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Bank Account",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserManage()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: drawerColor,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 5.0),
                            const Icon(Icons.person,color: Colors.white,size: 22),
                            const SizedBox(width: 5.0),
                            Text("User Management",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                            const SizedBox(width: 10.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.computer,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Tutorial",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.headphones,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Customer care /help",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.note_add,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Monthly Accounting/Invoice",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.person,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Multiple Clubs for one owner",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.question_mark_sharp,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("FAQ",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 7.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: drawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.backpack_outlined,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Booking",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const clubPayScreen()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: drawerColor,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 5.0),
                            const Icon(Icons.backpack_outlined,color: Colors.white,size: 22),
                            const SizedBox(width: 5.0),
                            Text("PRTYWT Pay Managment",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios,color: Colors.white,size: 22),
                            const SizedBox(width: 10.0),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    /// sign out button
                    TextButton(
                        onPressed: ()async{
                          final getUserId = GetUserDetail();
                          var userId = await getUserId.remove('id');
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const login(),),(route)=> false);
                        },
                        child: Text("Sign Out",style: GoogleFonts.poppins(fontSize: 20,color: const Color(0xFFA5A5A5),fontWeight: FontWeight.normal),textAlign: TextAlign.center),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
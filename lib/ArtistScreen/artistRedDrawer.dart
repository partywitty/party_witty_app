
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Auth/Login.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/style.dart';
import 'artistProfile.dart';

class ArtistRedDrawer{
  bool isSwitched = true;
  getDrawer(context,totalPercentage){
    String total = "${double.parse(totalPercentage)/100}";
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.1,
      child: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF220001),
          child: Column(
            children: [
              Container(
                color: const Color(0xFF450E10),
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
                              children:  [
                                const Icon(Icons.email,color: Colors.white,size: 14),
                                const SizedBox(width: 2),
                                SizedBox(
                                  width: 120,
                                  child: Text(DataManager.getInstance().getEmail(),style: cardSubTitle,),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.phone,color: Colors.white,size: 14),
                                const SizedBox(width: 2),
                                Text(DataManager.getInstance().getNumber() ?? "",style: cardSubTitle,),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 20.0,),
                        Column(
                          children: [
                            Stack(
                              children: [
                                CircularPercentIndicator(
                                  radius: 30.0,
                                  animation: true,
                                  animationDuration: 1200,
                                  lineWidth: 5.0,
                                  percent: double.parse(total),
                                  center: Container(
                                    decoration : BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.yellow,
                                    ),
                                    child: const Icon(Icons.person,size: 50,color: Colors.grey,),
                                  ),
                                  circularStrokeCap: CircularStrokeCap.butt,
                                  backgroundColor: const Color(0xFF450E10),
                                  progressColor: appColor,
                                ),
                                Positioned(
                                  top: 0.0,
                                     left: 0.0,
                                    child: CircleAvatar(
                                      backgroundColor: appColor,
                                       radius: 12,
                                       child: Text("${totalPercentage.toString().split(".").first}%",style: gitarist,),
                                    ))
                              ],
                            ),
                            const SizedBox(height: 5.0),
                            const Text("Vocalist",style: cardTitle,),
                          ],
                        ),
                        const SizedBox(width: 10.0,),
                        Column(
                          children: [
                            Container(
                              decoration : BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.yellow,
                              ),
                              child: const Icon(Icons.person,size: 50,color: Colors.grey,),
                            ),
                            const SizedBox(height: 5.0),
                            const Text("Guitarist",style: cardTitle,),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const artistProfile(),));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: artistDrawerColor,
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
                        //Get.to(dealManagment());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: artistDrawerColor,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 5.0),
                            const Icon(Icons.refresh,color: Colors.white,size: 22),
                            const SizedBox(width: 5.0),
                            Text("GIG History",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          Image.asset("assests/coin.png",height: 20,width: 20,fit: BoxFit.fill,color: Colors.white),
                          const SizedBox(width: 5.0),
                          Text("Cashback Coins",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          Image.asset("assests/coupon.png",height: 20,fit: BoxFit.fill,color: Colors.white),
                          const SizedBox(width: 5.0),
                          Text("Coupons code to share",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.settings,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Multiple Profile For the Same Artist",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.person,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Referral Code request",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.account_balance,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Financial Details",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.shopping_bag_rounded,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Partywitty Shop",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.question_mark_sharp,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Tutorial & FAQ",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.note_alt,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Terms & condition",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          Image.asset("assests/what2.png",height: 20,width: 20,fit: BoxFit.fill),
                          const SizedBox(width: 5.0),
                          Text("Whats app updates for shows",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              isSwitched = value;
                            },
                            activeTrackColor: Colors.green,
                            activeColor: Colors.white,
                            inactiveThumbColor: Colors.white,

                          ),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.mic,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Hire an fellow artist",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
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
                        color: artistDrawerColor,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 5.0),
                          const Icon(Icons.download_rounded,color: Colors.white,size: 22),
                          const SizedBox(width: 5.0),
                          Text("Download Partywtty- for Partygoers",style: GoogleFonts.poppins(textStyle: drawerSubtitle),),
                          const Spacer(),
                          const Icon(Icons.download,color: Colors.white,size: 22),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InkWell(
                      onTap: ()async{
                        final getUserId = GetUserDetail();
                        var userId = await getUserId.remove('id');
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const login(),),(route)=> false);
                      },
                        child: Text("Sign Out",style: GoogleFonts.poppins(fontSize: 20,color: const Color(0xFFA5A5A5),fontWeight: FontWeight.normal),textAlign: TextAlign.center)),
                    const SizedBox(height: 10.0),
                    Row(
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
                        const SizedBox(width: 10.0),
                      ],
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
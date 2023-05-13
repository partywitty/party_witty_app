
// ignore_for_file: camel_case_types

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/Service.dart';
import 'package:flutter_app/Auth/forgetPassword.dart';
import 'package:flutter_app/Auth/register_page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:otpless_flutter/otpless_flutter.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/login_api.dart';
import '../ArtistRagistration/Band_Videos.dart';
import '../ArtistRagistration/Club_Video.dart';
import '../ArtistRagistration/Streaming.dart';
import '../ArtistRagistration/Upload_Bands.dart';
import '../ArtistRagistration/brandVideos.dart';
import '../ArtistRagistration/brands_Photos.dart';
import '../ArtistRagistration/budgetSummary.dart';
import '../ArtistRagistration/languageScreen.dart';
import '../ArtistRagistration/managerDetails.dart';
import '../ArtistRagistration/music_type.dart';
import '../ArtistRagistration/origianalAudio.dart';
import '../ArtistRagistration/photo_with_caption.dart';
import '../ArtistRagistration/prefer_city.dart';
import '../ArtistRagistration/videoCover.dart';
import '../ArtistRagistration/youPlay.dart';
import '../ArtistScreen/Artist_list.dart';
import '../ArtistRagistration/Artist_type.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../ArtistRagistration/Message.dart';
import '../ArtistRagistration/Upload_clubs.dart';
import '../ArtistRagistration/Upload_Celebs.dart';
import '../ArtistRagistration/Upload_photograph.dart';
import '../Controller/utils.dart';
import '../Screens/bottomSheet.dart';
import '../ArtistRagistration/cover_songs.dart';
import '../ArtistRagistration/original_song.dart';
import '../ArtistRagistration/upload_video.dart';
import '../ArtistRagistration/venue_perform.dart';
import '../Controller/style.dart';
import 'package:http/http.dart' as http;
import 'artist.dart';
import 'artistReferral.dart';
import '../ArtistRagistration/artist_address.dart';
import '../ArtistRagistration/bank_page.dart';
import '../ArtistRagistration/fb_message.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String? token,userId,endPage;
  var device_token;

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    print('The generated Token is ${token}');
    return token;
  }

  String? userName,userEmail,subCategoryId;
  bool loading = false;
  bool gLoading = false;

  void _logInWithFacebook() async {
    setState(() {
      loading = true;
    });
    try{
      final facebookLoginResult = await FacebookAuth.instance.login(
        permissions: ['email']
      );
      final facebookAuthCredential = FacebookAuthProvider.credential(facebookLoginResult.accessToken!.token);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      switch (e.code){
      }
    }finally {
      setState(() {
        loading = false;
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  bool isLoading = false;
  bool colorChange = false;
  late bool _passwordVisible;
  bool check = true;
  final _otplessFlutterPlugin = Otpless();
  void initiateWhatsappLogin(String intentUrl) async {
    var result = await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
    switch (result['code']) {
      case "581":
        print(result['message']);
        //TODO: handle whatsapp not found
        break;
      default:
    }
  }
  Future<void> initPlatformState() async {
    _otplessFlutterPlugin.authStream.listen((token) {
      print("token = $token");
    });
  }
  @override
  void initState() {
    _passwordVisible = false;
    getToken();
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode.toInt(),
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             icon: android.smallIcon,
    //             channelShowBadge: true,
    //             // other properties...
    //           ),
    //         ));
    //   }
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode.toInt(),
    //         notification.title,
    //         notification.body,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             icon: android.smallIcon,
    //             channelShowBadge: true,
    //             // other properties...
    //           ),
    //         ));
    //   }
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Image.asset(
                'assests/b_img.png',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 270),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                ),
                child: Column(
                    children: [
                  const SizedBox(height: 18,),
                  Text('Account Login',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 24, color: Colors.white)
                  ),
                  const SizedBox(height: 10,),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
                            child: Text('Email/Phone number',style:textLabel),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            style: textFill,
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 25.0, bottom: 12.0, top: 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey,width: 1.0),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey,width: 1),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.7),
                                    borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 20,
                              bottom: 5.0,
                            ),
                            child: Text('Password',style: textLabel),
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                colorChange = password.text.length > 5 ? true : false;
                              });
                            },
                            controller: password,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            obscureText: !_passwordVisible,
                            style: textFill,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off,
                                  color: Colors.white54, size: 18,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                                contentPadding: const EdgeInsets.only(
                                  left: 25.0, bottom: 6.0, top: 0.0),
                                focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                                enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.7),
                                    borderSide: const BorderSide(width: 1,color: Colors.blueGrey),gapPadding: 0)
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8, right: 20, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      activeColor: const Color(0xFFFE262F),
                                      checkColor: Colors.white,
                                      side: const BorderSide(
                                        color: Colors.white,
                                      ),
                                      value: check,
                                      onChanged: (value) {
                                        setState(() {
                                          check = value!;
                                        });
                                      },
                                    ),
                                    Text(
                                      'Remember me',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10, color: Colors.white)
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const forgetPassword(),));
                                  },
                                  child: Text('Forget password',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10, color: Colors.white)),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          /// log in button -------
                          isLoading ?
                          const Center(child: CircularProgressIndicator()) :
                          colorChange == false ?
                          Center(
                            child: GestureDetector(
                              onTap: (){},
                              child: Container(
                                alignment: Alignment.center,
                                width: width/2,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                ),
                                child: Text('Login', style: GoogleFonts.poppins(textStyle: buttonText)),
                              ),
                            ),
                          ) :
                          Center(
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isLoading = true;
                                });
                                if(check == false){
                                  CommonToast(context: context, title: "Check remember me", alignCenter:false);
                                  setState(() {
                                    isLoading = false;
                                  });
                                }else{
                                  if(_formKey.currentState!.validate()){
                                    LoginCont().login_Api(context: context,email: email.text, password: password.text,fcmToken: token.toString()).then((value) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });
                                  }
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                                },
                              child: Container(
                                alignment: Alignment.center,
                                width: width/2,
                                height: 50.0,
                                decoration:   boxDecoration(),
                                child: Text('Login', style: GoogleFonts.poppins(textStyle: buttonText)),
                          ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 1,
                                  width: 77,
                                  color: Colors.white,
                                ),
                                Text('  or continue with  ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize:10, color: Colors.white)),
                                Container(
                                  height: 1,
                                  width: 77,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          /// log with google and facebook in button -------

                          gLoading ?
                          const Center(child: CircularProgressIndicator()) :
                          Center(
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  gLoading = true;
                                });
                                signup(context);
                              },
                              child: Container(
                                width: width/1.5,
                                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(2.0),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(4.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Image.asset(
                                          "assests/google_img.png", fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20.0,),
                                    const Text("Log in with Google",style: buttonText,textAlign: TextAlign.center),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Center(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       gLoading ?
                          //       const Center(
                          //         child: CircularProgressIndicator()
                          //       ) :
                          //       InkWell(
                          //         onTap: () {
                          //            setState(() {
                          //              gLoading = true;
                          //            });
                          //            signup(context);
                          //            // gLoading = false;
                          //         },
                          //         child: Container(
                          //           height: 40,
                          //           width: 40,
                          //           decoration: BoxDecoration(
                          //               color: Colors.white,
                          //               borderRadius: BorderRadius.circular(30)),
                          //           child: Padding(
                          //             padding: const EdgeInsets.all(6.0),
                          //             child: Image.asset(
                          //               "assests/google_img.png", fit: BoxFit.cover,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       const SizedBox(width: 25,),
                          //       InkWell(
                          //         onTap: () {
                          //          // _logInWithFacebook();
                          //           signInWithFacebook();
                          //         },
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //               color: Colors.white,
                          //               borderRadius: BorderRadius.circular(50)),
                          //           height: 40,
                          //           width: 40,
                          //           child: Padding(
                          //             padding: const EdgeInsets.all(6),
                          //             child: SizedBox(
                          //               height: 20,
                          //               width: 20,
                          //               child: Image.asset(
                          //                 "assests/fb1.png",
                          //                 fit: BoxFit.contain,
                          //                 scale: 3.8,
                          //                 height: 9,
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //       const SizedBox(width: 25,),
                          //       InkWell(
                          //         onTap: () {
                          //           initiateWhatsappLogin("https://vedanshtechnovision.authlink.me?redirectUri=vedanshtechnovisionotpless://otpless");
                          //         },
                          //         child: Image.asset(
                          //           "assests/whatsapp.png",
                          //           fit: BoxFit.fill,
                          //           scale: 3.8,
                          //           height: 40,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          /// sign up in button -------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize:12, color: Colors.white)),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/register');
                                  },
                                  child: Text(
                                    'Sign up',
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          fontSize:12, color: const Color(0xFFFE262F)
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final getUserDetail = GetUserDetail();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void>signup(BuildContext context)async{
    final GoogleSignIn googleSignIn=GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount= await googleSignIn.signIn();
    if(googleSignInAccount !=null){
      final GoogleSignInAuthentication googleSignInAuthentication= await googleSignInAccount.authentication;
      final AuthCredential authCredential =GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
      );
      UserCredential result =await auth.signInWithCredential(authCredential);
      User user =result.user!;
      userName = user.displayName;
      userEmail = user.email;
      setState(() {
        gLoading = false;
      });
      googleLogin(
          email: user.email.toString(),
          userName: user.displayName.toString(),
          loginType: "google",
          context: context).then((value){
        SharePre.setEmail(user.email.toString());
        SharePre.setNumber(user.phoneNumber.toString());
        DataManager.getInstance().setEmail(user.email.toString());
        DataManager.getInstance().setNumber(user.phoneNumber.toString());
      });
      isLoading = false;
      print(user);
      print("user-----${user.providerData.map((e) => e.uid)}");
      if(result !=null){
        gLoading = false;
        isLoading = false;
        // Get.off(Bottom_navigation());
      }
    }
  }

  Future googleLogin({
    required String email,
    required String userName,
    required String loginType,
    required BuildContext context,}) async {
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.googleUrl));
      request.fields.addAll({
        'username': userName,
        'email':email,
        'auth_type' : loginType,
      });
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = json.decode(responseJson);
        if (responseDecode["error"] == true) {
          userId = responseDecode["data"]["id"].toString();
          await getUserDetail.setUserData("id", userId);
          SharePre.setName(responseDecode['data']['username']);
          SharePre.setUserType(responseDecode['data']['role']);
          DataManager.getInstance().setName(responseDecode['data']['username']);
          DataManager.getInstance().setUserType(responseDecode['data']['role']);
          endPage = responseDecode["data"]["end_page"].toString();
          subCategoryId = responseDecode["data"]["artists_type_id"].toString();

          if(endPage == 'artist_type'){
            Get.offAll(const Artist_type());
          }else if (endPage == 'null'){
            Get.offAll(const artist());
          }else if (endPage =='artist_hire'){
            Get.offAll(const artist());
          }else if (endPage == 'referral_code'){
            Get.offAll(artistReferral());
          }else if(endPage=='list_of_artist'){
            Get.offAll(const Artist_list());
          }else if(endPage=='multiple-Photographs'){
            Get.offAll(const captionPhotos());
          }else if(endPage=='venue'){
            Get.offAll(const Venue_music());
          }else if(endPage=='genre'){
            Get.offAll(Music_type());
          }else if(endPage=='intromessage'){
            Get.offAll(const introMessage());
          }else if(endPage=='photographs'){
            Get.offAll(const Upload_photograph());
          }else if(endPage=='video-upload'){
            Get.offAll(const Upload_video());
          }else if (endPage == 'stage'){
            Get.offAll(YouPlay(subCategoryId: subCategoryId.toString(),));
          }else if(endPage == 'language'){
            Get.offAll(const languageScreen());
          }else if(endPage == 'price_summary'){
            Get.offAll(const budgetSummary());
          }else if(endPage ==  'city_budget'){
            Get.offAll(const Prefer_city());
          }else if(endPage == 'managr_details'){
            Get.offAll(const managerDetails());
          }else if(endPage == 'photo_with_celebs'){
            Get.offAll(const Upload_Celebs());
          }else  if(endPage == 'photo_with_brands'){
            Get.offAll(const brandPhotos());
          }else if(endPage == 'video_with_brands'){
            Get.offAll(const brandVideo());
          }else if(endPage == 'photo_with_bands'){
            Get.offAll(const Upload_Bands());
          }else if(endPage == 'video_with_bands'){
            Get.offAll(const bandVideo());
          }else if(endPage == 'photo_with_club'){
            Get.offAll(const clubVideos());
          }else if (endPage == 'video_with_club'){
            Get.offAll(const Upload_clubs());
          }else if(endPage == 'audio_cover_song'){
            Get.offAll(const CoverSongs());
          }else if(endPage == 'video_cover_song'){
            Get.offAll(const videoCoverSong());
          }else if(endPage == 'original_video_song'){
            Get.offAll(const originalSong());
          }else if(endPage == 'original_audio_song'){
            Get.offAll(const originalAudio());
          }else if(endPage == 'streaming_platforms_song'){
            Get.offAll(const Streamup());
          }else if (endPage == 'social_link'){
            Get.offAll(const FaceBook());
          }else if (endPage == 'address'){
            Get.offAll(const artistAddress());
          }else if (endPage == "otp"){
            Get.offAll(SignUp());
          }else if(endPage == 'bank_details'){
            Get.offAll(const Bank_page());
          }else if (endPage == 'service_agreement'){
            Get.offAll(const Service());
          }else{
            Get.offAll(const bottomSheet());
          }
        } else {
          SharePre.setName(responseDecode['data']['username']);
          DataManager.getInstance().setName(responseDecode['data']['username']);
          userId = responseDecode["data"]["id"].toString();
          await getUserDetail.setUserData("id", userId);
          endPage = responseDecode["data"]["end_page"].toString();
          if (endPage == 'artist_type') {
            Get.offAll(const Artist_type());
          } else if (endPage == 'null') {
            Get.offAll(const artist());
          } else if (endPage == 'artist_hire'){
            Get.offAll(const artist());
          } else if (endPage == 'referral_code'){
            Get.offAll(artistReferral());
          } else if (endPage == 'list_of_artist'){
            Get.offAll(const Artist_list());
          } else if (endPage == 'multiple-Photographs'){
            Get.offAll(const captionPhotos());
          } else if (endPage == 'venue') {
            Get.offAll(const Venue_music());
          } else if (endPage == 'intromessage'){
            Get.offAll(const introMessage());
          } else if (endPage == 'photographs'){
            Get.offAll(const Upload_photograph());
          }else if(endPage=='genre'){
            Get.offAll(Music_type());
          }else if (endPage == 'video-upload') {
            Get.offAll(const Upload_video());
          }else if (endPage == 'stage') {
            Get.offAll(YouPlay(subCategoryId: subCategoryId.toString(),));
          }else if (endPage == 'language') {
            Get.offAll(const languageScreen());
          }else if (endPage == 'price_summary') {
            Get.offAll(const budgetSummary());
          }else if(endPage ==  'city_budget'){
            Get.offAll(const Prefer_city());
          }else if (endPage == 'managr_details') {
            Get.offAll(const managerDetails());
          }else if (endPage == 'photo_with_celebs') {
            Get.offAll(const Upload_Celebs());
          }else if (endPage == 'photo_with_brands') {
            Get.offAll(const brandPhotos());
          }else if (endPage == 'video_with_brands') {
            Get.offAll(const brandVideo());
          }else if (endPage == 'photo_with_bands') {
            Get.offAll(const Upload_Bands());
          }else if (endPage == 'video_with_bands') {
            Get.offAll(const bandVideo());
          }else if (endPage == 'photo_with_club') {
            Get.offAll(const clubVideos());
          }else if (endPage == 'video_with_club') {
            Get.offAll(const Upload_clubs());
          }else if (endPage == 'audio_cover_song') {
            Get.offAll(const CoverSongs());
          }else if (endPage == 'video_cover_song') {
            Get.offAll(const videoCoverSong());
          }else if (endPage == 'original_video_song') {
            Get.offAll(const originalSong());
          }else if (endPage == 'original_audio_song') {
            Get.offAll(const originalAudio());
          }else if (endPage == 'streaming_platforms_song') {
            Get.offAll(const Streamup());
          }else if (endPage == 'social_link') {
            Get.offAll(const FaceBook());
          }else if (endPage == 'address') {
            Get.offAll(const artistAddress());
          }else if (endPage == "otp") {
            Get.offAll(SignUp());
          }else if (endPage == 'bank_details') {
            Get.offAll(const Bank_page());
          }else if (endPage == 'service_agreement') {
            Get.offAll(const Service());
          }else {
            Get.offAll(const bottomSheet());
          }
        }
      } else {
        CommonToast(context: context, title: "Internal Server Error", alignCenter:false);
        print(response.reasonPhrase);
      }}catch(e){
      print(e);
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile',]
    );

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

}

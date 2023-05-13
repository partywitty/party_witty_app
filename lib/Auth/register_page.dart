import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ArtistRagistration/Service.dart';
import 'package:flutter_app/Auth/artist.dart';
import 'package:flutter_app/Auth/artistReferral.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/signup_api.dart';
import '../ArtistRagistration/Artist_type.dart';
import '../ArtistRagistration/artist_address.dart';
import '../ArtistRagistration/bank_page.dart';
import '../ArtistRagistration/fb_message.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/utils.dart';
import '../Controller/style.dart';
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
import '../ArtistRagistration/Message.dart';
import '../ArtistRagistration/Upload_clubs.dart';
import '../ArtistRagistration/Upload_Celebs.dart';
import '../ArtistRagistration/Upload_photograph.dart';
import '../Screens/bottomSheet.dart';
import '../ArtistRagistration/cover_songs.dart';
import '../ArtistRagistration/original_song.dart';
import '../ArtistRagistration/upload_video.dart';
import '../ArtistRagistration/venue_perform.dart';
import 'package:http/http.dart' as http;


class SignUp extends StatefulWidget {
  SignUp({Key? key,}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController name=TextEditingController();
  TextEditingController dateOfBirth =TextEditingController();
  TextEditingController anniversaryController =TextEditingController();
  TextEditingController number=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController whatsApp=TextEditingController();
  final get_user_detail = GetUserDetail();

   @override
  void initState() {
     getToken();
    _passwordVisible = false;
    super.initState();
  }
  var gender;
  var male;
  bool isLoading = false;
  bool addWhatsApp = false;
  String? token;
  late bool _passwordVisible;
  String dropdownvalue = '+91';
  var items = ['+91', '+92', '+93', '+94', '+95'];

   @override
   void dispose() {
     name.dispose();
     super.dispose();
   }
  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    print('The generated Token is ${token}');
    return token;
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool checkBox = false;
  String? userName,userEmail,subCategoryId;
  String? userId,endPage;
  bool loading = false;
  bool gLoading = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: width,
                      // height: height * 0.7,
                      // color: Colors.blueGrey,
                      child: Image.asset(
                        'assests/A_img.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 130.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  topLeft: Radius.circular(50)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35, right: 35),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, bottom: 1.0, top: 40),
                                    child: Text('Full Name',style: textLabel),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter full name';
                                      }
                                      return null;
                                    },
                                    controller: name,
                                    style: textFill,
                                    decoration: inputDecoration(context),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, bottom: 1.0, top: 10),
                                    child: Text('Date of birth',style: textLabel),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter full date';
                                      }
                                      return null;
                                    },
                                    controller: dateOfBirth,
                                    style: textFill,
                                    decoration: inputDecoration(context),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0, bottom: 1.0, top: 10),
                                    child: Text('Anniversary',style: textLabel),
                                  ),
                                  TextFormField(
                                    controller: anniversaryController,
                                    style: textFill,
                                    decoration: inputDecoration(context),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      bottom: 1.0,
                                      top: 10.0
                                    ),
                                    child: Text('Phone Number',
                                        style: textLabel),
                                  ),
                                  Container(
                                    //height: 50,
                                    // width: 300,
                                    decoration: (BoxDecoration(
                                        color: const Color(0xFF434445),
                                        borderRadius: BorderRadius.circular(30))),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25.0),
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: Image.asset(
                                                    'assests/ind_img.png',
                                                  ),
                                                ),
                                                const SizedBox(width: 10,),
                                                SizedBox(
                                                  height: 33,
                                                  child:DropdownButtonHideUnderline(
                                                      child:  DropdownButton(
                                                        iconSize: 1,
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
                                                            print(dropdownvalue);
                                                          });
                                                        },
                                                      )),),
                                                const SizedBox(width: 8,),
                                                Container(
                                                  height: 25,
                                                  width: 1.5,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: 49,
                                                  width: width*0.5,
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value == null || value.isEmpty) {
                                                        return 'Please enter number';
                                                      }else if (number.text.length < 10){
                                                        return 'Please enter correct number';
                                                      }
                                                      return null;
                                                    },
                                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                                      LengthLimitingTextInputFormatter(10)],
                                                    controller: number,
                                                    autofocus: false,
                                                    keyboardType: TextInputType.number,
                                                    style: textFill,
                                                    decoration: InputDecoration(
                                                      hintText: '',
                                                      hintStyle: GoogleFonts.poppins(
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Colors.white70),
                                                      // filled: true,
                                                      contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 20.0,
                                                          bottom: 6.0,
                                                          top: 10.0),
                                                      focusedBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF434445)),
                                                        borderRadius:
                                                        BorderRadius.circular(25.7),
                                                      ),
                                                      enabledBorder: OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                            color: Color(0xFF434445)),
                                                        borderRadius:
                                                        BorderRadius.circular(25.7),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ]),
                                        )
                                      ],
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
                                              value: checkBox,
                                              onChanged: (value) {
                                                setState(() {
                                                  checkBox = value!;
                                                  whatsApp.text = number.text;
                                                  setState(() {
                                                    value == false ? whatsApp.clear() : whatsApp.text;
                                                  });
                                                });
                                              },
                                            ),
                                            Text('Same as whatsapp number',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10, color: Colors.white)
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(10)],
                                      controller: whatsApp,
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      style: textFill,
                                      decoration: inputDecoration(context)
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: 15.0,
                                      left: 20,
                                    ),
                                    child: Text('Gender',style: textLabel),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, left: 10),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              gender='female' ;
                                              // male = !male;
                                              print(gender);
                                              // male = !male;
                                            });
                                          },
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF434445),
                                                border: Border.all(
                                                    color: gender=='female'
                                                        ? Colors.red
                                                        : Colors.transparent),
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 5.0, bottom: 3),
                                                  child: Container(
                                                    height: 45,
                                                    width: 35,
                                                    child: Image.asset(
                                                      'assests/female_img.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0xFF434445),
                                                        borderRadius:
                                                        BorderRadius.circular(10)),
                                                  ),
                                                ),
                                                Text(
                                                  'Female',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 8,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10,),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              gender='male';
                                              print(gender);
                                            });
                                          },
                                          child: Container(
                                            width: 70,
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF434445),
                                                border: Border.all(
                                                    color:   gender=='male'
                                                        ? Colors.red
                                                        : Colors.transparent),
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 5.0, bottom: 3),
                                                  child: Container(
                                                    height: 46,
                                                    width: 45,
                                                    child: Image.asset(
                                                      'assests/boy_img.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0xFF434445),
                                                        borderRadius:
                                                        BorderRadius.circular(10)),
                                                  ),
                                                ),
                                                Text(
                                                  'Male',
                                                  style: GoogleFonts.poppins(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 8,
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      bottom: 1.0,
                                      top: 20,
                                    ),
                                    child: Text('Email',style: textLabel),
                                  ),
                                  TextFormField(
                                    validator: (mailVali) {
                                      String pattern =
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                                      RegExp regExp = RegExp(pattern);
                                      if (mailVali!.isEmpty) {
                                        return "Please enter your valid email address";
                                      } else if (!(regExp.hasMatch(mailVali))) {
                                        return "Email must be end from @gmail.com";
                                      } else {
                                        return null;
                                      }
                                    },
                                    controller: email,
                                    style: textFill,
                                    decoration: inputDecoration(context),
                                  ),
                                  const SizedBox(height: 18),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      bottom: 1.0,
                                    ),
                                    child: Text('Password',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Colors.white)),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter password';
                                      }else if(password.text.length < 6){
                                      return 'Please enter at least 6 digit password';
                                      }
                                      return null;
                                    },
                                    controller: password,
                                    autofocus: false,
                                    keyboardType: TextInputType.text,
                                    obscureText: !_passwordVisible,
                                    style: textFill,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFF434445),
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
                                          borderSide: const BorderSide(color: Color(0xFF434445)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color:Color(0xFF434445)),
                                          borderRadius: BorderRadius.circular(25.7),
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(25.7),
                                            borderSide: const BorderSide(width: 1,color: Color(0xFF434445)),gapPadding: 0)
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  gLoading ?
                                  const Center(child: CircularProgressIndicator()) :
                                  Center(
                                    child: InkWell(
                                      onTap: (){
                                        setState(() {
                                          gLoading = true;
                                        });
                                        signup(context);
                                        // gLoading = false;
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
                                            const SizedBox(width: 10.0,),
                                            const Center(child: Text("Sign up with Google",style: buttonText,textAlign: TextAlign.center,))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  /// sign up button
                                  isLoading ?
                                  const Center(child: CircularProgressIndicator()) :
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        if(_formKey.currentState!.validate()){
                                          setState(() {
                                            isLoading = false;
                                          });
                                          if(gender == null){
                                            CommonToast(context: context, title: "Please select gender", alignCenter: false);
                                          }else{
                                            Signup_api().Signup_Api(
                                                context: context,
                                                userName: name.text,
                                                contactNo: number.text,
                                                email: email.text,
                                                password: password.text,
                                                gender: gender,
                                                whatsApp: whatsApp.text,
                                                fcmToken : token.toString(),
                                            ).then((value){
                                              //CommonToast(context: context, title: 'Sign up successfully', alignCenter: false);
                                              setState(() {
                                                isLoading = false;
                                              });
                                            });
                                          }
                                        }else{
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: width/2,
                                        height: 50.0,
                                        decoration: boxDecoration(),
                                        child: const Text('Submit', style: buttonText,),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ]
          )
      ),
    );
  }
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
          context: context);
      isLoading = false;
      print(user);
      print("user-----${user.providerData.map((e) => e.uid)}");
      if(result !=null){
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
          await get_user_detail.setUserData("id", userId);
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
          userId = responseDecode["data"]["id"].toString();
          await get_user_detail.setUserData("id", userId);
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

}

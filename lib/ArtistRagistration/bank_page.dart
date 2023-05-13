import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ArtistRagistration/Artist_type.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Streaming.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import 'Service.dart';
import '../Controller/SharePre.dart';
import '../Controller/utils.dart';
import '../Modal/bankNameM.dart';
import 'package:http/http.dart' as http;


class Bank_page extends StatefulWidget {
  const Bank_page({Key? key}) : super(key: key);

  @override
  State<Bank_page> createState() => _Bank_pageState();
}

class _Bank_pageState extends State<Bank_page> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController bankName = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController ifsc = TextEditingController();
  TextEditingController panNumber = TextEditingController();
  TextEditingController cheque = TextEditingController();
  TextEditingController searchBank = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController panNameController = TextEditingController();

  String? _uploadImage;
  late File upImage;

  List <nameData> getBankNameList = [];
  List <nameData> bankList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StreamingApi().getBankDetails().then((value)  {
      var data = value.data;
      setState((){
        data!.bankname == null ? bankName.text : bankName.text = data.bankname!;
        data.branch == null ? branch.text : branch.text = data.branch!;
        data.acountNumber == null ? accountNumber.text : accountNumber.text = data.acountNumber!;
        data.ifsccode == null ? ifsc.text : ifsc.text = data.ifsccode!;
        data.panNumber == null ? panNumber.text : panNumber.text = data.panNumber!;
        data.cancelChaque == null ? cheque.text : cheque.text = data.cancelChaque!;
        data.panName == null ? panNameController.text : panNameController.text = data.panName!;
      });
    });
    load();
  }

  bool loader = true;

  load(){
    StreamingApi().bankName().then((value) {
      setState(() {
        loader=false;
        getBankNameList = bankList = value.data!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: height,
            width: width,
            child: Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.5,
                    child: Image.asset(
                      'assests/A_img.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,left: 15),
                      child: IconButton(
                        color: Colors.white,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      width: width,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            const Text("  Bank Name",style: textLabel),
                            loader? const Center(child: CircularProgressIndicator()):
                            countryListField(),
                            const SizedBox(height: 2,),
                            const Text('  Branch', style: textLabel),
                            const SizedBox(height: 2),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter branch';
                                }
                                return null;
                              },
                              controller: branch,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 10,),
                            const Text(' Account Number',style: textLabel),
                            const SizedBox(height: 2),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter account No.';
                                }
                                return null;
                              },
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(15)],
                              keyboardType: TextInputType.number,
                              controller: accountNumber,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 10,),
                            const Text(' IFSC Code',style: textLabel),
                            const SizedBox(height: 2),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter ifsc code';
                                }
                                return null;
                              },
                              controller: ifsc,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 10,),
                            const Text(' Pan Name',style: textLabel),
                            const SizedBox(height: 5),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter pan name';
                                }
                                return null;
                              },
                              controller: panNameController,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 12,),
                            const Text(' Pan Number',style: textLabel),
                            const SizedBox(height: 2),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter pan No.';
                                }
                                return null;
                              },
                              controller: panNumber,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 10),
                            const Text(' Bank document photo', style: textLabel),
                            const SizedBox(height: 2),
                            TextFormField(
                              controller: cheque,
                              onTap: ()async{
                                final result = await FilePicker.platform.pickFiles(type: FileType.image);
                                upImage=File(result!.files.single.path!);
                                setState(() {
                                  _uploadImage=result.files.single.path;
                                }
                                );
                              },
                              readOnly: true,
                              maxLines: null,
                              style: textFill,
                              decoration: inputDecoration(context,
                                suffixIcon: Image.asset(
                                  'assests/id_proof.png',
                                  scale: 4,
                                )),
                            ),
                            const SizedBox(height: 10,),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if(_formKey.currentState!.validate()){
                                    if(_uploadImage == null){
                                      CommonToast(context: context, title: 'please upload file', alignCenter: false);
                                    }else{
                                      bankSubmit(
                                          bankName: countryController.text,
                                          branch: branch.text,
                                          accountNo: accountNumber.text,
                                          ifsc: ifsc.text,
                                          panNo: panNumber.text,
                                          file: upImage.path.toString(),
                                        panName: panNameController.text,
                                        context: context
                                      );
                                    }
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: Text('Submit',style: GoogleFonts.poppins(textStyle: buttonText)),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }

  Future<void> serviceDialog(BuildContext context) {
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
                    const SizedBox(),
                    Image.asset('assests/img.png',fit: BoxFit.fill,height: 50,),
                    const Text("""You have created your profile under the category"Vocalist" want to make your profile.""",style: signUpTitle,textAlign: TextAlign.center),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Artist_type(),));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                              decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text("Yes",style: buttonText)),
                        ),
                        InkWell(
                          onTap: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context) => bottomSheet(),));
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Service(),));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                              decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              child: Text("No",style: buttonText)),
                        )
                      ],
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

  Widget countryListField(){
    return Container(
      margin: const EdgeInsets.only(right: 0,left: 0,top: 2,bottom: 15.0),
      child: TextFormField(
        onTap: (){
          showDialog(
            context: context,
            barrierDismissible:false,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (context, setState){
                    return Dialog(
                      backgroundColor: appBarColor,
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        elevation: 16,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                    searchBank.clear();
                                    load();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(right: 10.0,top: 5.0),
                                    child: Icon(Icons.clear,color: Colors.white,size: 24,),
                                  ),
                                ),
                              ],
                            ),
                            TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter bank name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  setState(() {
                                    bankList = getBankNameList
                                        .where((name) => name.bank!
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                        .toList();
                                  });
                                },
                                keyboardType: TextInputType.text,
                                controller: searchBank,
                                style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            Expanded(
                              flex: 1,
                              child:
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: bankList.isEmpty ? 0 : bankList.length,
                                  itemBuilder: (context, index) {
                                    var data =bankList[index];
                                    return
                                      ListView(
                                        shrinkWrap: true,
                                        physics: const ScrollPhysics(),
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: InkWell(
                                                child: Text(data.bank.toString(),
                                                  style: textFill
                                                ),
                                                onTap: (){
                                                  selectCountry(countryName:data.bank.toString());
                                                  Navigator.pop(context);
                                                 // countryController.clear();
                                                  load();
                                                 // setUniversity(data.id.toString());
                                                }),
                                          ),
                                          const Divider(color: Colors.white,)
                                        ],
                                      );
                                  }),
                            )
                          ],
                        )
                    );
                  }
              );
            },
          );
        },
        readOnly: true,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Colors.white,fontSize: 12),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select bank';
          }
          return null;
        },
        controller: countryController,
        decoration: inputDecoration(context),
      ),
    );
  }
  selectCountry({countryName}){
    return  setState(() {
      countryController.text= countryName;
    });
  }

  Future bankSubmit({file,bankName,branch,accountNo,ifsc,panNo,panName,required BuildContext context}) async{
    final getUserDetail = GetUserDetail();
    var userId = await getUserDetail.getUserData('id');
    try{
      var request = http.MultipartRequest('POST', Uri.parse(Api_link.bankSubmit));
      request.fields.addAll({
        'user_id': userId,
        'profile_id' : DataManager.getInstance().getProfile().toString(),
        'bankname': bankName,
        'branch': branch,
        'acount_number': accountNo,
        'ifsccode': ifsc,
        'pan_number': panNo,
        "pan_name" : panName
      });
      request.files.add(await http.MultipartFile.fromPath('cancel_chaque', file));
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200) {
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'something wrong', alignCenter: false);
        }else{
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
          Get.to(const Service());
          //Navigator.push(context, MaterialPageRoute(builder: (context) => Service(),));
          //serviceDialog(context);
        }
      } else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: false);
      }
    }catch(e){
      print(e);
    }

  }
}

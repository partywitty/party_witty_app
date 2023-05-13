

// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:http/http.dart' as http;
import '../ApiServices/Streaming.dart';
import '../ApiServices/api_link.dart';
import '../Controller/DataManager.dart';
import '../Controller/SharePre.dart';
import '../Controller/utils.dart';
import '../Modal/bankNameM.dart';

class artistBank extends StatefulWidget {
  const artistBank({Key? key}) : super(key: key);

  @override
  State<artistBank> createState() => _artistBankState();
}

class _artistBankState extends State<artistBank> {
  final _getUserDetail = GetUserDetail();

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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.only(
                left: 20.0, bottom: 3.0, top: 40),
            child: Text("Bank Name", style: textLabel),
          ),
          loader? const Center(child: CircularProgressIndicator()):
          countryListField(),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 5.0,
            ),
            child: Text('Branch',style: textLabel),
          ),
          TextFormField(
            controller: branch,
            style: textFill,
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 5.0,
            ),
            child: Text('Account Number',style: textLabel),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: accountNumber,
            style: textFill,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(15)],
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 12,),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 5.0,
            ),
            child: Text('IFSC Code', style: textLabel),
          ),
          TextFormField(
            controller: ifsc,
            style: textFill,
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 12,),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 5.0,
            ),
            child: Text('Pan Name', style: textLabel),
          ),
          TextFormField(
            controller: panNameController,
            style: textFill,
            decoration: inputDecoration(context),
          ),
          const SizedBox(height: 12,),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 5.0,
            ),
            child: Text('Pan Number',style: textLabel),
          ),
          TextFormField(
            controller: panNumber,
            style: textFill,
            decoration: inputDecoration(context),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              bottom: 5.0,
              top: 11,
            ),
            child: Text('Bank document photo',style: textLabel),
          ),
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
            hint: _uploadImage== null ? "" : upImage.path.split('/').last,
              suffixIcon: Image.asset(
                'assests/id_proof.png',
                scale: 4,
              ),),
          ),
          const SizedBox(height: 30,),
          Center(
            child: GestureDetector(
              onTap: () {
                if(countryController.text.isEmpty||
                    branch.text.isEmpty ||
                    accountNumber.text.isEmpty || ifsc.text.isEmpty ||
                    panNumber.text.isEmpty || panNameController.text.isEmpty
                ){
                  CommonToast(context: context, title: 'All Field mandatory', alignCenter: false);
                }else{
                  primaryBank(
                      bankName: countryController.text,
                      branch: branch.text,
                      accountNo: accountNumber.text,
                      ifsc: ifsc.text,
                      panNo: panNumber.text,
                      file: _uploadImage  == null ? cheque.text : upImage.path.toString(),
                      panName: panNameController.text,
                      context: context
                  ).whenComplete(() {
                    load();
                  });
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 140,
                height: 50.0,
                decoration: boxDecoration(),
                child: const Text('Update',style: buttonText),
              ),
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
  Widget countryListField(){
    return Container(
      margin: const EdgeInsets.only(right: 0,left: 0,top: 0,bottom: 15.0),
      child: TextFormField(
        onTap: (){
          showDialog(
            context: context,
            barrierDismissible:false,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (context, setState){
                    return Dialog(
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
                                    child: Icon(Icons.clear,color: Colors.red,size: 24,),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin : const EdgeInsets.only(right: 10.0,left: 10.0,bottom: 5.0,top: 5.0),
                              child: TextFormField(
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
                                  style: TextStyle(color: Colors.black,fontSize: 12),
                                  decoration: const InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(0.0),
                                    prefixIconConstraints: BoxConstraints(
                                      maxWidth: 30,
                                      maxHeight: 40,
                                      minHeight: 40,
                                      minWidth: 30,
                                    ),
                                    hintText:  "Search Country",
                                    // hintStyle: hinttxt,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    ),
                                  )
                              ),
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
                                                child: Text(data.bank.toString(),style: TextStyle(
                                                    color: Colors.black,fontSize: 14
                                                ),
                                                ),
                                                onTap: (){
                                                  selectCountry(countryName:data.bank.toString());
                                                  Navigator.pop(context);
                                                  // countryController.clear();
                                                  load();
                                                  // setUniversity(data.id.toString());
                                                }),
                                          ),
                                          Divider(color: Colors.grey[500],)
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
        decoration: InputDecoration(
          fillColor: Color(0xFF434445),
          filled: true,
          hintStyle: TextStyle(fontSize: 12,color: Colors.white),
          hintText: "Search Bank",
          contentPadding: const EdgeInsets.only(
              left: 25.0, bottom: 12.0, top: 0.0),
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
    );
  }
  selectCountry({countryName}){
    return  setState(() {
      countryController.text= countryName;
    });
  }

  Future primaryBank({file,bankName,branch,accountNo,ifsc,panName,panNo,required BuildContext context}) async{
    var userId = await _getUserDetail.getUserData('id');
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
        'pan_name' : panName
      });
      _uploadImage == null ? "" :  request.files.add(await http.MultipartFile.fromPath('cancel_chaque', file));
      http.StreamedResponse response = await request.send();
      print('The requested fields are ${request.fields}');
      if (response.statusCode == 200){
        var responseJson = await response.stream.bytesToString();
        var responseDecode = jsonDecode(responseJson);
        if(responseDecode['error']){
          CommonToast(context: context, title: 'something wrong', alignCenter: false);
        }else{
          CommonToast(context: context, title: 'Successfully', alignCenter: false);
          print('The image response else is ${responseDecode}');
        }
      }
      else {
        CommonToast(context: context, title: 'Internal Server Error', alignCenter: false);
      }
    }catch(e){
      print(e);
    }

  }
}

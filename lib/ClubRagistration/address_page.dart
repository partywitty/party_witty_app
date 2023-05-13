import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../ApiServices/clubAddress.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class Address_page extends StatefulWidget {
  const Address_page({Key? key}) : super(key: key);

  @override
  State<Address_page> createState() => _Address_pageState();
}

class _Address_pageState extends State<Address_page> {
  TextEditingController clubname=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController  landmark=TextEditingController();
  TextEditingController state=TextEditingController();
  TextEditingController city=TextEditingController();
  TextEditingController pincode=TextEditingController();
  TextEditingController number=TextEditingController();

  final _formKey=GlobalKey<FormState>();
  String? _value;
  bool value = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
        key: _formKey,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: SizedBox(
              width: width,
              child: Stack(
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.5,
                    child: Image.asset(
                      'assests/light.png',
                      fit: BoxFit.fill,
                    ),),
                  Positioned(
                    child: IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.arrow_back_ios,size: 24,color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              topLeft: Radius.circular(50)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15.0,),
                            const Text('   Name of the club',style: textLabel),
                            const SizedBox(height: 5.0,),
                            TextFormField(
                              controller: clubname,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'please enter your club name';
                                }else null;
                              },
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 5.0,),
                            const Text('   Address', style: textLabel),
                            TextFormField(
                              autofocus: true,
                              controller: address,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'please enter your address';
                                }else null;
                              },
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 5.0,),
                            const Text('   Landmark', style: textLabel),
                            const SizedBox(height: 5.0,),
                            TextFormField(
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'please enter your landmark';
                                }else null;
                              },
                              autofocus: true,
                              controller: landmark,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 5.0,),
                            const Text("   State",style: textLabel),
                            const SizedBox(height: 5.0,),
                            TextFormField(
                              autofocus: true,
                              controller: state,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Feild is Empty';
                                }else null;
                              },
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: width * 0.38,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('  Town /city', style: textLabel),
                                      TextFormField(
                                        autofocus: true,
                                        controller: city,
                                        validator: (val){
                                          if(val!.isEmpty){
                                            return 'Feild is Empty';
                                          }else null;
                                        },
                                        style: textFill,
                                        decoration: inputDecoration(context),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 12,),
                                SizedBox(
                                  width: width * 0.35,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('   Pin Code', style: textLabel),
                                      TextFormField(
                                        controller: pincode,
                                        validator: (val){
                                          if(val!.isEmpty){
                                            return 'Field is Empty';
                                          }else null;
                                        },
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly,
                                          LengthLimitingTextInputFormatter(6)],
                                        keyboardType: TextInputType.phone,
                                        autofocus: true,
                                        style: textFill,
                                          decoration: inputDecoration(context),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            const Text("    I am", textScaleFactor: 1, style: textLabel),
                            Row(
                              children: [
                                SizedBox(
                                  width: 32,
                                  child: Radio(
                                    activeColor: const Color(0xFFfd2630),
                                    fillColor:
                                    MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                      return (value) ? Colors.white : const Color(0xFFfd2630);
                                    }),
                                    value: "Owner",
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value.toString();
                                        print(_value);
                                      });
                                    },
                                  ),
                                ),
                                const Text('Owner', style: textLabel,),
                                const SizedBox(width: 30,),
                                SizedBox(width: 32,
                                  child: Radio(
                                    activeColor: const Color(0xFFfd2630),
                                    fillColor:
                                    MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                      return (value) ? Colors.white : const Color(0xFFfd2630);
                                    }),
                                    value: "Manager",
                                    groupValue: _value,
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value.toString();
                                      });
                                    },
                                  ),
                                ),
                                const Text('Manager', style: textLabel,),
                              ],
                            ),
                            const SizedBox(height: 10.0,),
                            const Text("   POC-Number", style: textLabel),
                            const SizedBox(height: 5.0,),
                            TextFormField(
                              controller: number,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Enter your number';
                                }else null;
                              },
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              style: textFill,
                              decoration: inputDecoration(context),
                            ),
                            const SizedBox(height: 20,),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if(_formKey.currentState!.validate()){
                                    setState(() {
                                      ClubRegistration().ClupAddress(
                                        clubname: clubname.text.toString(),
                                        address: address.text.toString(),
                                        landmark: landmark.text.toString(),
                                        contactNo: number.text.toString(),
                                        state: state.text.toString(),
                                        city: city.text.toString(),
                                        pincode: pincode.text.toString(),
                                        context: context,
                                        I_am:_value.toString()).then((value) =>
                                          Navigator.pushNamed(context, '/guest_page'));
                                    });  }},
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  height: 50.0,
                                  decoration: boxDecoration(),
                                  child: const Text('Submit',style: buttonText),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
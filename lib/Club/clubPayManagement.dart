
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../Controller/style.dart';
import '../Controller/utils.dart';

class ClubPayManagement extends StatefulWidget {
  const ClubPayManagement({Key? key}) : super(key: key);

  @override
  State<ClubPayManagement> createState() => _ClubPayManagementState();
}

class _ClubPayManagementState extends State<ClubPayManagement> {
  String internalValue = '0';
  var items = ['0', '1', '2', '3', '4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text("Party Witty Pay",style: GoogleFonts.poppins(textStyle: appBarText)),
        ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  child: Text('Instant discount', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: boxDecoration(),
                  child: Text('Free Add On', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            height: 150,
            child: SizedBox(
              width: 150, height: 130, //height and width of guage
              child:SfRadialGauge(
                  enableLoadingAnimation: true, //show meter pointer movement while loading
                  animationDuration: 4500, //pointer movement speed
                  axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                    RadialAxis(
                        minimum: 0,maximum: 15,
                        ranges: <GaugeRange>[ //Guage Ranges
                          GaugeRange(startValue: 0,endValue: 5, color: const Color(0xFF7AFF77), startWidth: 10,endWidth: 10),
                          GaugeRange(startValue: 5,endValue: 10,color: const Color(0xFF6DFFCF),startWidth: 10,endWidth: 10),
                          GaugeRange(startValue: 10,endValue: 15,color: const Color(0xFF07BAFE),startWidth: 10,endWidth: 10)
                        ],
                        pointers: const <GaugePointer>[
                          /// pointer dynamic value
                          NeedlePointer(value:8,
                            needleColor: Colors.white,
                            needleEndWidth: 5,
                            knobStyle: KnobStyle(color: Colors.deepOrange,borderColor: Colors.lightBlue,),
                          )
                        ],
                        annotations: const <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Text('',style: TextStyle(fontSize: 0,fontWeight:FontWeight.bold,color: Colors.white)),
                              angle: 90,
                              positionFactor: 0.5),
                          //add more annotations 'texts inside guage' here
                        ]
                    )]
              ),
            ),
          ),
          Row(
            children: [
              const Flexible(
                  child: Text("No. of internals for free add on change",style: textLabel)),
              const Spacer(),
              SizedBox(
                  width: 70,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 33,
                    width: 100,
                     decoration: BoxDecoration(
                         color: Colors.white,
                       borderRadius: BorderRadius.circular(4.0)
                     ),
                    child:DropdownButtonHideUnderline(
                        child:  DropdownButton(
                          iconSize: 24,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                          style: const TextStyle(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          value: internalValue,
                          dropdownColor: Colors.white,focusColor: Colors.blue,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              enabled: true,
                              value: items,
                              child: Text(items,style: blackSubTitle),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              internalValue = newValue!;
                            });
                          },
                        )),),
              ),
            ],
          ),
          const Divider(color: Colors.white,height: 20.0),
          Row(
            children: [
              Flexible(
                  child: Column(
                    children: const [
                      Text("Count of guest for minimum discount",style: textLabel),
                      Text("(No. count can’t exceed the maximum seating  capacity)",style: textHint),
                    ],
                  )
              ),
              const Spacer(),
              SizedBox(
                width: 70,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 33,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.0)
                  ),
                  child:DropdownButtonHideUnderline(
                      child:  DropdownButton(
                        iconSize: 24,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                        style: const TextStyle(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                        value: internalValue,
                        dropdownColor: Colors.white,focusColor: Colors.blue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            enabled: true,
                            value: items,
                            child: Text(items,style: blackSubTitle),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            internalValue = newValue!;
                          });
                        },
                      )),),
              ),
            ],
          ),
          const Divider(color: Colors.white,height: 20.0),
          Row(
            children: const [
              Spacer(),
              Text("Extra Add \non Range %",style: textLabel),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              Column(
                children: [
                  Row(
                     children: const [
                       Text("Minimum Spend range",style: textLabel),
                       SizedBox(width: 10.0),
                       Icon(Icons.add_circle,color: appColor,size: 24,)
                     ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.white,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: blackSubTitle),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.white,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: blackSubTitle),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.white,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: blackSubTitle),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.white,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: blackSubTitle),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.white,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: blackSubTitle),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.black,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.white,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: blackSubTitle),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text("Min",style: textLabel),
                      SizedBox(width: 10.0),
                      Text("Max",style: textLabel),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.black,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: textHint),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.black,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: textHint),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.black,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: textHint),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.black,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: textHint),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.black,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: textHint),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 33,
                          width: 100,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(4.0)
                          ),
                          child:DropdownButtonHideUnderline(
                              child:  DropdownButton(
                                iconSize: 24,
                                icon: const Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,size: 24),
                                style: const TextStyle(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                                value: internalValue,
                                dropdownColor: Colors.black,focusColor: Colors.blue,
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    value: items,
                                    child: Text(items,style: textHint),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    internalValue = newValue!;
                                  });
                                },
                              )),),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: appColor,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Text('Save', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ClubPayManagement()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10.0),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Text('Edit', style: GoogleFonts.poppins(textStyle: buttonText)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

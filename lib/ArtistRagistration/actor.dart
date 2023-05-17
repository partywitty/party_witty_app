import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class actorScreen extends StatefulWidget {
  const actorScreen({Key? key}) : super(key: key);

  @override
  State<actorScreen> createState() => _actorScreenState();
}

class _actorScreenState extends State<actorScreen> {
  TextEditingController ageController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController complexionController = TextEditingController();
  TextEditingController eyeController = TextEditingController();
  TextEditingController hairController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController hipsController = TextEditingController();
  TextEditingController bustController = TextEditingController();
  TextEditingController theatreController = TextEditingController();
  TextEditingController filmsController = TextEditingController();
  TextEditingController skillsController = TextEditingController();

  String? gender = "male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Actor Details",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 20.0),
          Text("Gender", style: GoogleFonts.poppins(textStyle: textLabel)),
          Theme(
            data: ThemeData(
              unselectedWidgetColor: appColor,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: RadioListTile(
                    activeColor: appColor,
                    title: const Text("Male",style: textFill,),
                    value: "male",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  child: RadioListTile(
                    activeColor: appColor,
                    title: const Text("Female",style: textFill,),
                    value: "female",
                    groupValue: gender,
                    onChanged: (value){
                      setState(() {
                        gender = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter born place';
              }
              return null;
            },
            controller: bornController,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter your born place"),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter nationality';
              }
              return null;
            },
            controller: nationalityController,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter your nationality"),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter height ';
                    }
                    return null;
                  },
                  controller: heightController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "Enter your height"),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter weight';
                    }
                    return null;
                  },
                  controller: weightController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "Enter your weight"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter complexion ';
                    }
                    return null;
                  },
                  controller: complexionController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "Enter your complexion"),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter eye colour';
                    }
                    return null;
                  },
                  controller: eyeController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "Enter your eye colour"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter hair colour ';
                    }
                    return null;
                  },
                  controller: hairController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "Enter your hair colour"),
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter age';
                    }
                    return null;
                  },
                  controller: ageController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "Enter your age"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter waist';
                    }
                    return null;
                  },
                  controller: waistController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "waist"),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter hips';
                    }
                    return null;
                  },
                  controller: hipsController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "hips"),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter bust';
                    }
                    return null;
                  },
                  controller: bustController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "bust"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter waist';
                    }
                    return null;
                  },
                  controller: theatreController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "theatre"),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter films';
                    }
                    return null;
                  },
                  controller: filmsController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "films"),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter skills';
                    }
                    return null;
                  },
                  controller: skillsController,
                  style: textFill,
                  decoration: inputDecoration(context,hint: "skills"),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Text("Dress", style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10.0),
          MultiSelectContainer(
              itemsPadding: const EdgeInsets.all(10.0),
              textStyles: const MultiSelectTextStyles(textStyle: TextStyle(color: Colors.white)),
              itemsDecoration: MultiSelectDecorations(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.green.withOpacity(0.1),
                      Colors.yellow.withOpacity(0.1),
                    ]),
                    border: Border.all(color: Colors.green[200]!),
                    borderRadius: BorderRadius.circular(20)),
                selectedDecoration: BoxDecoration(
                    color: appColor,
                    border: Border.all(color: Colors.green[700]!),
                    borderRadius: BorderRadius.circular(20)),
                disabledDecoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey[500]!),
                    borderRadius: BorderRadius.circular(20)),
              ),
              maxSelectableCount: 5,
              items: [
                MultiSelectCard(value: 'ethnic', label: 'ethnic'),
                MultiSelectCard(value: 'western', label: 'western'),
                MultiSelectCard(value: 'night wear', label: 'night wear'),
                MultiSelectCard(value: 'swimming costumes', label: 'swimming costumes'),
                MultiSelectCard(value: 'bikini', label: 'bikini'),
              ],
              onMaximumSelected: (allSelectedItems, selectedItem) {
                //CustomSnackBar.showInSnackBar('The limit has been reached', context);
              },
              onChange: (allSelectedItems, selectedItem) {

              }),
          const SizedBox(height: 55.0),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 2),
        color: drawerColor,
        height: 50,
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            width: 140,
            height: 50.0,
            decoration: boxDecoration(),
            child: const Text('Submit',style: buttonText),
          ),
        ),
      ),
    );
  }
}

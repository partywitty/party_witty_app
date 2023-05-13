import 'package:flutter/material.dart';
import 'package:flutter_app/ArtistRagistration/anchorForm.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/style.dart';
import '../Controller/utils.dart';

class AnchorScreen extends StatefulWidget {
  const AnchorScreen({Key? key}) : super(key: key);

  @override
  State<AnchorScreen> createState() => _AnchorScreenState();
}

class _AnchorScreenState extends State<AnchorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Anchor",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          const SizedBox(height: 20),
          Text("Event you wish to anchor at",style: GoogleFonts.poppins(textStyle: textLabel),),
          const SizedBox(height: 20),
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
                MultiSelectCard(value: 'Corporate', label: 'Corporate'),
                MultiSelectCard(value: 'Mall activity', label: 'Mall activity'),
                MultiSelectCard(value: 'Collage feast', label: 'Collage feast'),
                MultiSelectCard(value: 'Road show', label: 'Road show'),
                MultiSelectCard(value: 'Promotional Activity', label: 'Promotional Activity'),
                MultiSelectCard(value: 'Kitty Party', label: 'Kitty Party'),
                MultiSelectCard(value: 'Wedding/ Private Celebration', label: 'Wedding/ Private Celebration'),
              ],
              onMaximumSelected: (allSelectedItems, selectedItem) {
                //CustomSnackBar.showInSnackBar('The limit has been reached', context);
              },
              onChange: (allSelectedItems, selectedItem) {

              }),
        ],
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const anchorFormScreen()));
            },
            child: Container(
              alignment: Alignment.center,
              width: 140,
              height: 50.0,
              decoration: boxDecoration(),
              child: const Text('Submit',style: buttonText),
            ),
          )
      ),
    );
  }
}

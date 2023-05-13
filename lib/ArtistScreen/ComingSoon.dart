
// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import '../Controller/appBarArtist.dart';
import '../Controller/style.dart';

class comingSoonScreen extends StatefulWidget {
  const comingSoonScreen({Key? key}) : super(key: key);

  @override
  State<comingSoonScreen> createState() => _comingSoonScreenState();
}

class _comingSoonScreenState extends State<comingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Appbars().getArtistAppBar(context: context,title: ""),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(child: Text("Coming Soon",style: extraBold,))
        ],
      ),
    );
  }
}

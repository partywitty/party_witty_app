
// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../Controller/loader.dart';
import '../Controller/style.dart';
import '../Controller/utils.dart';

class anchorFormScreen extends StatefulWidget {
  const anchorFormScreen({Key? key}) : super(key: key);

  @override
  State<anchorFormScreen> createState() => _anchorFormScreenState();
}

class _anchorFormScreenState extends State<anchorFormScreen> {
  final double _height = Get.height, _width = Get.width;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  List<File> imageFileCropped = [];
  List<XFile> _imageFile = [];
  final ImagePicker _picker = ImagePicker();
  List<File?> files = [];
  Widget buildGridView() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      shrinkWrap: true,
      crossAxisCount: 3,
      physics: const ScrollPhysics(),
      children: List.generate(imageFileCropped.length, (index) {
        File asset = imageFileCropped[index];
        Loading().onDone();
        return Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: asset.path.split(".").last =="jpg" || asset.path.split(".").last =="png" || asset.path.split(".").last =="jpeg"?
                Image.file(File(asset.path),width: 70,height: 70,fit: BoxFit.fill,):
                Center(child: Text(asset.path.split("/").last))
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: InkWell(
                  onTap: (){
                    setState(() {
                      imageFileCropped.removeAt(index);
                    });
                  },
                  child: const Icon(
                    Icons.highlight_remove,size: 20,color: Colors.red,)),
            ),
          ],
        );
      }),
    );
  }
  getMultipleFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.video
    );
    if (result != null) {
      List<File?> file = result.paths.map((path) => File(path!)).toList();
      files = file;
      setState(() {});
    } else {
      Loading().onDone();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select at least 1 file',style: textHint),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drawerColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Anchor Details",style: GoogleFonts.poppins(textStyle: appBarText)),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          const SizedBox(height: 20.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter full height';
              }
              return null;
            },
            controller: heightController,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter your height"),
          ),
          const SizedBox(height: 15.0),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter full weight';
              }
              return null;
            },
            controller: weightController,
            style: textFill,
            decoration: inputDecoration(context,hint: "Enter your weight"),
          ),
          const SizedBox(height: 15.0),
          Text("Pictures", style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10.0),
          imageFileCropped.isEmpty ?
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Loading().onLoading();
                    takePhoto(ImageSource.gallery);
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 1.5,
                              width: 32,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 32,
                              width: 1.5,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ],
          ) :
          buildGridView(),
          const SizedBox(height: 10.0),
          Text("Stage show videos", style: GoogleFonts.poppins(textStyle: textLabel)),
          const SizedBox(height: 10.0),
          Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap:()async{
                    Loading().onLoading();
                    getMultipleFile();
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xFF434445),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              height: 1.5,
                              width: 32,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Container(
                              height: 32,
                              width: 1.5,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: files.length,
            itemBuilder: (BuildContext context, int index) {
              var data = files[index];
              Loading().onDone();
              return Row(
                children: [
                  Container(
                      width: _width* 0.70,
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                      decoration: BoxDecoration(
                          color: appBarColor,
                          borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Text(data!.path.split("/").last,style: textLabel)),
                  InkWell(
                      onTap: (){
                        setState(() {
                          files.removeAt(index);
                        });
                      },
                      child: const Icon(Icons.clear,color: Colors.white,size: 24)),
                ],
              );
            },
          ),
        ],
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: Colors.black,
          height: 70,
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => const anchorFormScreen()));
            },
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
  void takePhoto(ImageSource source) async {
    final List<XFile> image = await _picker.pickMultiImage();
    setState(() {
      _imageFile = image;
    });
    for (final XFile file in _imageFile) {
      var selectFile = File(file.path);
      imageFileCropped.add(selectFile.absolute);
    }
    Loading().onDone();
  }
}

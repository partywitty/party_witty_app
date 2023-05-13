import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/Upload_File.dart';
import '../ApiServices/api_link.dart';

class uploadPhotograph extends StatefulWidget {
  var type;
  uploadPhotograph({Key? key,this.type}) : super(key: key);

  @override
  State<uploadPhotograph> createState() => _uploadPhotographState();
}

class _uploadPhotographState extends State<uploadPhotograph> with SingleTickerProviderStateMixin{

  late AnimationController loadingController;

  TextEditingController title = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? _uploadImage;
  late File upImage;
  bool isLoading = false;

  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() { setState(() {}); });
    super.initState();
  }
  File? _file;
  PlatformFile? _platformFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new,color: Colors.white,size: 24,)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          const SizedBox(height: 15.0),
          Form(
            key: _formKey,
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
                autofocus: false,
                controller: title,
                style: const TextStyle(fontSize: 15.0, color: Color(0xFFbdc6cf)),
                decoration: InputDecoration(
                  hintText: 'Title ,location here..',
                  hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize:10, color: Colors.white),
                  fillColor: const Color(0xFF434445),
                  filled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 25.0, bottom: 12.0, top: 0.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF434445)),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFF434445)),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                )),
          ),
          const SizedBox(height: 20),
          widget.type == 0 ?
          const Text("Add Image",style: signUpTitle) :
          const Text("Add Video", style: signUpTitle),
          const SizedBox(height: 20,),

          /// add image

          widget.type == 0 ?
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap:()async{
                final result = await FilePicker.platform.pickFiles(type: FileType.image);
                upImage=File(result!.files.single.path!);
                setState(() {
                  // fileUploadList().imageProgress(file: upImage.path).then((value) {
                  //
                  // });
                  _uploadImage=result.files.single.path;
                }
                );
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Color(0xFF434445),
                    border: Border.all(color: appColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 1.5,
                          width: 32,
                          color: appColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          height: 32,
                          width: 1.5,
                          color: appColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ):
          const SizedBox(),
          widget.type == 1 ?
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap:()async{
                final result = await FilePicker.platform.pickFiles(type: FileType.video);
                upImage=File(result!.files.single.path!);
                setState(() {
                  // fileUploadList().imageProgress(file: upImage.path).then((value) {
                  //
                  // });
                  _uploadImage=result.files.single.path;
                }
                );
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFF434445),
                    border: Border.all(color: appColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 1.5,
                          width: 32,
                          color: appColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          height: 32,
                          width: 1.5,
                          color: appColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ) :
          const SizedBox(),
          widget.type == 2 ?
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap:()async{
                final result = await FilePicker.platform.pickFiles(type: FileType.video);
                upImage=File(result!.files.single.path!);
                setState(() {
                  // fileUploadList().imageProgress(file: upImage.path).then((value) {
                  //
                  // });
                  _uploadImage=result.files.single.path;
                }
                );
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFF434445),
                    border: Border.all(color: appColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 1.5,
                          width: 32,
                          color: appColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          height: 32,
                          width: 1.5,
                          color: appColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ) :
          const SizedBox(),
          widget.type == 3 ?
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap:()async{
                final result = await FilePicker.platform.pickFiles(type: FileType.video);
                upImage=File(result!.files.single.path!);
                setState(() {
                  // fileUploadList().imageProgress(file: upImage.path).then((value) {
                  //
                  // });
                  _uploadImage=result.files.single.path;
                }
                );
              },
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color(0xFF434445),
                    border: Border.all(color: appColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          height: 1.5,
                          width: 32,
                          color: appColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          height: 32,
                          width: 1.5,
                          color: appColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ) :
          const SizedBox(),


          /// uploaded file view

          widget.type == 0 ?
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                height: 100,
                width: 100,
                decoration: _uploadImage==null ?
                BoxDecoration(
                  border: Border.all(color: appColor),
                  borderRadius: BorderRadius.circular(15),
                  // image: const DecorationImage(
                  //     image: AssetImage("assests/party_img.png"),fit: BoxFit.cover
                  // ),
                ):
                BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Color(0xFFE0E0E0)),
                  image: DecorationImage(
                    image: Image.file(upImage).image,fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ) :
          const SizedBox(),
          widget.type == 1 ?
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(15),
              // image: const DecorationImage(
              //     image: AssetImage("assests/party_img.png"),fit: BoxFit.cover
              // ),
            ),
            child: _uploadImage==null ? const Text("") : Text(upImage.path.split("/").last,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center),) :
          const SizedBox(),
          widget.type == 2 ?
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color:appColor),
              borderRadius: BorderRadius.circular(15),
              // image: const DecorationImage(
              //     image: AssetImage("assests/party_img.png"),fit: BoxFit.cover
              // ),
            ),
            child: _uploadImage==null ? const Text("") : Text(upImage.path.split("/").last,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,),) :
          const SizedBox(),
          widget.type == 3 ?
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: appColor),
              borderRadius: BorderRadius.circular(15),
              // image: const DecorationImage(
              //     image: AssetImage("assests/party_img.png"),fit: BoxFit.cover
              // ),
            ),
            child: _uploadImage==null ? const Text("") : Text(upImage.path.split("/").last,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,),) :
          const SizedBox(),

          ///submit button
          const SizedBox(height: 30.0,),
          widget.type == 0 ?
          isLoading ? Center(child: CircularProgressIndicator()) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if(_formKey.currentState!.validate()){
                  if(_uploadImage == null){
                    CommonToast(context: context, title: 'Please select file', alignCenter: true);
                    setState(() {
                      isLoading = false;
                    });
                  }else{
                    fileUploadList().postImage(file: upImage.path,title: title.text,type: 0.toString(),context: context).then((value) {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  }
                }
                else{
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: Container(
                width: 140,
                height: 50.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.1, 0.1),
                    end: FractionalOffset(0.7, 0.1),
                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Center(
                  child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize:14, color: Colors.white)
                  ),
                ),
              ),
            ),
          ) :
          widget.type == 1 ?
          isLoading ? Center(child: CircularProgressIndicator()) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if(_formKey.currentState!.validate()){
                  if(_uploadImage == null){
                    CommonToast(context: context, title: 'Please select file', alignCenter: true);
                    setState(() {
                      isLoading = false;
                    });
                  }else{
                    fileUploadList().postImage(file: upImage.path,title: title.text,type: "1",context: context).then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      // CommonToast(context: context, title: 'File upload successful', alignCenter: true);
                      // Navigator.pop(context);
                    });
                  }
                }
                else{
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: Container(
                width: 140,
                height: 50.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.1, 0.1),
                    end: FractionalOffset(0.7, 0.1),
                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Center(
                  child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize:14, color: Colors.white)
                  ),
                ),
              ),
            ),
          ) :
          const SizedBox(),
          widget.type == 2 ?
          isLoading ? Center(child: CircularProgressIndicator()) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if(_formKey.currentState!.validate()){
                  if(_uploadImage == null){
                    CommonToast(context: context, title: 'Please select file', alignCenter: true);
                    setState(() {
                      isLoading = false;
                    });
                  }else{
                    fileUploadList().postImage(file: upImage.path,title: title.text,type: "2",context: context).then((value) {
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
                width: 140,
                height: 50.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.1, 0.1),
                    end: FractionalOffset(0.7, 0.1),
                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Center(
                  child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize:14, color: Colors.white)
                  ),
                ),
              ),
            ),
          ) :
          const SizedBox(),
          widget.type == 3 ?
          isLoading ? Center(child: CircularProgressIndicator()) :
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLoading = true;
                });
                if(_formKey.currentState!.validate()){
                  if(_uploadImage == null){
                    CommonToast(context: context, title: 'Please select file', alignCenter: true);
                    setState(() {
                      isLoading = false;
                    });
                  }else{
                    fileUploadList().postImage(file: upImage.path,title: title.text,type: "3",context: context).then((value) {
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
                width: 140,
                height: 50.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0.1, 0.1),
                    end: FractionalOffset(0.7, 0.1),
                    colors: [Color(0xFFFE262F),Color(0xFFFD2F71), ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Center(
                  child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize:14, color: Colors.white)
                  ),
                ),
              ),
            ),
          ) :
          const SizedBox(),
        ],
      ),
    );
  }
}


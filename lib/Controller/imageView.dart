
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class imageDetial extends StatefulWidget {
  var url;

  imageDetial({Key? key,this.url,}) : super(key: key);

  @override
  State<imageDetial> createState() => _imageDetialState();
}

class _imageDetialState extends State<imageDetial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          // InkWell(
          //     focusColor: Colors.transparent,
          //     splashColor: Colors.transparent,
          //     onTap: (){
          //   //    Loading().onLoading();
          //    //   file_download().download(widget.url,widget.url.toString().split("/").last).whenComplete(() => Loading().onDone());
          //     },
          //     child: Icon(Icons.downloading,size: 25,color: Colors.white,)),
          // const SizedBox(width: 30,),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Icon(Icons.clear,size: 25,color: Colors.white,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 20,),
        ],
        // title: const Text('Image',style: appbarstyle,),
      ),
      body: Center(
          child: PhotoView(
              imageProvider: NetworkImage("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80"))
      ),
    );
  }
}
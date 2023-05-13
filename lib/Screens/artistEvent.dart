
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Controller/style.dart';

class artistEvent extends StatefulWidget {
  const artistEvent({Key? key}) : super(key: key);

  @override
  State<artistEvent> createState() => _artistEventState();
}

class _artistEventState extends State<artistEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
              child: Text("Event",style: appBarText,)),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: (){
              launch('tel:+918299619469');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(" Help",style: cardSubTitle),
                  const SizedBox(
                      height: 25,
                      child: VerticalDivider(width: 20,color: Colors.white,)),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                      child: const Icon(Icons.support_agent_sharp,color: Colors.white,size: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

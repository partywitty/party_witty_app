
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import '../ApiServices/api_link.dart';
import '../ApiServices/artistListApi.dart';
import '../Modal/AritistM.dart';


class Artist_list extends StatefulWidget {
  const Artist_list({Key? key}) : super(key: key);

  @override
  State<Artist_list> createState() => _Artist_listState();
}

class _Artist_listState extends State<Artist_list> {


  bool loader = false;
  double? _ratingValue;

 List<Artists> getArtistLists = [];
 List<Artists> searchArtistLists = [];
 String? status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
  }
  load(){
    GetArtistList().getArtist().then((value) {
      setState(() {
        getArtistLists =searchArtistLists= value.data!.artists!;
        status = value.data!.requestByStatus;
        loader = true;
      });
    });
  }
  final snackBar = const SnackBar(backgroundColor: appColor, content: Text('copied'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18191a),
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text("Artist List",style: GoogleFonts.poppins(textStyle: appBarText),),
      ),
      body: loader == false ?
      const Center(child: CircularProgressIndicator()) :
          Column(
            children: [
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        searchArtistLists = getArtistLists
                            .where((name) => name.username!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    autofocus: false,
                    style: textFill,
                    decoration: InputDecoration(
                      hintText: 'Search Artist',
                      hintStyle: textHint,
                      fillColor: appBarColor,
                      filled: true,
                      contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF434445)),
                        borderRadius: BorderRadius.circular(20.7),),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF434445)),
                        borderRadius: BorderRadius.circular(20.7),
                      ),
                    )),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    // itemCount: getArtistLists.length,
                    itemCount: searchArtistLists.isEmpty ? 0 : searchArtistLists.length,
                    itemBuilder: (context, index) {
                      var data = searchArtistLists[index];
                      return data.color == "green" ?
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFF747576),
                            border: Border.all(
                                color: Colors.red, width: 0.9),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: OctoImage.fromSet(
                                fit: BoxFit.fill,
                                image: NetworkImage(Api_link.imageUrl + "${data.profile}"),
                                octoSet: OctoSet.circleAvatar(
                                    backgroundColor: appColor,
                                    text: Text(data.username![0].split("").last.toUpperCase())
                                )
                            ),
                          ),
                          title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0,top: 10),
                                  child: Text("${data.username}",style: cardTitle),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 10.0),
                                  child: Row(
                                    children: [
                                      RatingBar(
                                          initialRating: 0,
                                          itemSize: 10,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          glowRadius: 10,
                                          itemCount: 5,
                                          ratingWidget:
                                          RatingWidget(
                                              full: const Icon(Icons.star, size: 10, color: Colors.orange),
                                              half: const Icon(Icons.star_half, size: 10, color: Colors.orange,),
                                              empty: const Icon(Icons.star_outline, size: 10, color: Colors.orange,)
                                          ),
                                          onRatingUpdate:
                                              (value) {
                                            setState(() {
                                              _ratingValue = value;
                                            });
                                          })
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 10.0,top: 2.0),
                                  child: Text("${data.typeOfArtistName}", style: cardSubTitle,),
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 5.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset('assests/mic.png'),
                                      ),
                                      const Text('12',style: likes),
                                      const SizedBox(width: 6,),
                                      const Icon(Icons.person,color: appColor,size: 18,),
                                      const Text('1.5k', style: likes)
                                    ],
                                  ),
                                ),
                              ]),
                          trailing: data.referStatus == null ?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  status == "1" ?
                                  CommonToast(context: context, title: "only one request send", alignCenter:false) :
                                  GetArtistList().sendRequest(
                                      recieverId: "${data.id}",
                                      context: context).then((value){
                                    load();
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(3)),
                                  child: const Text("Referred Code Request",
                                    style: (TextStyle(color: Colors.black, fontSize: 9)),
                                  ),
                                ),
                              ),
                            ],
                          ) :
                          data.referStatus == "0" ?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(3)),
                                child: const Text("Waiting For Response",
                                  style: (TextStyle(
                                      color: Colors.black,
                                      fontSize: 9)),
                                ),
                              ),
                            ],
                          ) :
                          data.referStatus == "1" ?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap :  (){
                                  Clipboard.setData(ClipboardData(text: "${data.referralCode}")).then((value) { //only if ->
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);});
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                            color: Colors.green, width: 0.9),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text("${data.referralCode}",style: const TextStyle(color: Colors.white,fontSize: 12),)
                                ),
                              ),
                            ],
                          ) :
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 68.0,
                                    right: 7,bottom: 5),
                                child: Container(
                                    height: 21,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                        BorderRadius.circular(3)),
                                    child: const Center(
                                      child: Padding(
                                        padding:
                                        EdgeInsets.only(
                                            left: 4.0,
                                            right: 4),
                                        child: Text("Denied",
                                          style: (TextStyle(
                                              color: Colors.black,
                                              fontSize: 9)),
                                        ),
                                      ),
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ) :
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading: SizedBox(
                            height: 50,
                            width: 50,
                            child: OctoImage.fromSet(
                                fit: BoxFit.fill,
                                image: NetworkImage(Api_link.imageUrl + "${data.profile}"),
                                octoSet: OctoSet.circleAvatar(
                                    backgroundColor: appColor,
                                    text: Text(data.username![0].split("").last.toUpperCase())
                                )
                            ),
                          ),
                          title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 8.0,top: 10),
                                  child: Text("${data.username}",style: cardTitle),
                                ),
                                const SizedBox(height: 2),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 10.0),
                                  child: Row(
                                    children: [
                                      RatingBar(
                                          initialRating: 0,
                                          itemSize: 10,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          glowRadius: 10,
                                          itemCount: 5,
                                          ratingWidget:
                                          RatingWidget(
                                              full: const Icon(Icons.star, size: 10, color: Colors.orange),
                                              half: const Icon(Icons.star_half, size: 10, color: Colors.orange,),
                                              empty: const Icon(Icons.star_outline, size: 10, color: Colors.orange,
                                              )),
                                          onRatingUpdate:
                                              (value) {
                                            setState(() {
                                              _ratingValue = value;
                                            });
                                          })
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 10.0,top: 2.0),
                                  child: Text("${data.typeOfArtistName}", style: cardSubTitle,),
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 5.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                            'assests/mic.png'),
                                      ),
                                      const Text('12',style: likes),
                                      const SizedBox(width: 6,),
                                      const Icon(Icons.person,color: appColor,size: 18,),
                                      const Text('1.5k', style: likes)
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      );
                    }),
              ),
            ],
          ),
    );
  }

}
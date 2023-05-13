
import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Controller/appBarArtist.dart';
import '../Screens/Days_page.dart';


class requestAndEvent extends StatefulWidget {
  const requestAndEvent({Key? key}) : super(key: key);

  @override
  State<requestAndEvent> createState() => _requestAndEventState();
}

class _requestAndEventState extends State<requestAndEvent>with SingleTickerProviderStateMixin {

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: Appbars().getArtistAppBar(context: context,title: ""),
      //drawer: artistDrawer().getDrawer(context),
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: const Text("Profile",style: appBarText),
      //   actions: [
      //     InkWell(
      //         onTap: ()async{
      //           final getuser_id=GetUserDetail();
      //           var userId = await getuser_id.remove('id');
      //           print(userId);
      //           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => login(),),(route)=> false);
      //         },
      //         child: const Icon(Icons.login,size: 24,color: Colors.white,)),
      //     const SizedBox(width: 20.0,)
      //   ],
      // ),
      body: Column(
        children: [
          const SizedBox(height: 5.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            // color: Colors.black12,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            height: 50,
            child: TabBar(
              labelColor: Colors.white,
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 0.0,
              indicatorColor: Colors.grey,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                // border: Border.all(color: tabBorderColor),
                color: appColor,
              ),
              tabs: <Widget>[
                Tab(
                  child:Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: appColor),
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: const Text('Request',
                      style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),),
                ),
                Tab(
                  child:Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: const Text("Event",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF747576),
                        border: Border.all(
                            color: Colors.red, width: 0.9),
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        foregroundImage: AssetImage(
                          'assests/shawli.png',
                          // fit: BoxFit.fill,
                        ),
                        // maxRadius: 28,
                        backgroundColor:
                        Colors.blueGrey,
                        // child:
                      ),
                      title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0,top: 10),
                              child: Container(
                                child: const Text("David Borg",style: cardTitle),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(
                                  left: 10.0),
                              child: Container(
                                // width: 100,
                                  child: Row(
                                    children: [
                                      RatingBar(
                                          initialRating:
                                          0,
                                          itemSize: 10,
                                          direction: Axis
                                              .horizontal,
                                          allowHalfRating:
                                          true,
                                          glowRadius: 10,
                                          itemCount: 5,
                                          ratingWidget:
                                          RatingWidget(
                                              full: const Icon(
                                                  Icons
                                                      .star,
                                                  size:
                                                  10,
                                                  color: Colors
                                                      .orange),
                                              half:
                                              const Icon(
                                                Icons
                                                    .star_half,
                                                size:
                                                10,
                                                color:
                                                Colors.orange,
                                              ),
                                              empty:
                                              const Icon(
                                                Icons.star_outline,
                                                size:
                                                10,
                                                color:
                                                Colors.orange,
                                              )),
                                          onRatingUpdate:
                                              (value) {
                                            setState(() {
                                              _ratingValue =
                                                  value;
                                            });
                                          })
                                    ],
                                  )),
                            ),
                            const Padding(
                              padding:
                              EdgeInsets.only(left: 10.0),
                              child: Text("Artist", style: cardSubTitle,),
                            ),
                            const SizedBox(height: 7,),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 5.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image.asset('assests/mic.png'),),
                                  const Text('12',style: likes),
                                  const SizedBox(width: 6,),
                                  const Icon(Icons.person,color: appColor,size: 18,),
                                  const Text('1.5k', style: likes)
                                ],
                              ),
                            ),
                          ]),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                BorderRadius.circular(10.0)),
                            child: const Text("Accepted",
                              style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 9)),
                            ),
                          ),
                        ],
                      )
                    ),
                  );
                },),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: photolist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                          height: 91,
                          width: 300,
                          decoration: BoxDecoration(
                              color: const Color(0xFF434445),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(
                                          10),
                                      child: Image.asset(
                                        photolist[index].image,
                                        fit: BoxFit.fill,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: 26,
                                        height: 28,
                                        decoration: BoxDecoration(
                                            color:
                                            const Color(0xFF676767),
                                            borderRadius:
                                            BorderRadius
                                                .circular(5)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 2.0),
                                          child: Column(
                                            children: [
                                              const Text(
                                                "30",
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 8),
                                              ),
                                              const Text(
                                                "feb",
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 8),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 1, left: 10, bottom: 0),
                                    child: Container(
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Colifornia party:2022",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold),
                                            ),
                                            const SizedBox(height: 2,),
                                            Row(
                                                children: [
                                              Container(
                                                width: 20,
                                                height: 18,
                                                child: Image.asset(
                                                  'assests/clock.png',
                                                  scale: 3.2,
                                                  height: 10,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 6,
                                              ),
                                              const Text(
                                                '05:25 PM',
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 10),
                                              ),
                                            ]),
                                            Container(height: 16,),
                                            Row(
                                                children: [
                                              Icon(Icons.location_on_rounded,color: Colors.white,size: 18,),
                                              const SizedBox(width: 6,),
                                              const Text(
                                                'Colifornia,CA',
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize: 10),
                                              ),
                                              const SizedBox(width: 5.0,),
                                                  Container(
                                                    padding: const EdgeInsets.all(5.0),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0xFF747576),
                                                        borderRadius:
                                                        BorderRadius.circular(10.0)),
                                                    child: const Text("₹ 5000/-",
                                                      style: (TextStyle(color: Colors.white,fontSize: 9)),
                                                    ),
                                                  ),
                                              const SizedBox(width: 10.0,),
                                              Container(
                                                padding: const EdgeInsets.all(5.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.circular(10.0)),
                                                child: const Text("Accepted",
                                                  style: (TextStyle(color: Colors.white,fontSize: 9)),
                                                ),
                                              ),
                                            ]),
                                          ]),
                                    )),
                              ],
                            ),
                          ));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

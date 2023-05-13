import 'package:flutter/material.dart';
import 'package:flutter_app/Controller/style.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/dealsoldApi.dart';
import '../Modal/dealsoldM.dart';

class DealSoldTabbar extends StatefulWidget {
  String club_id;
   DealSoldTabbar({required this.club_id});

  @override
  State<DealSoldTabbar> createState() => _DealSoldTabbarState();
}

class _DealSoldTabbarState extends State<DealSoldTabbar> with SingleTickerProviderStateMixin{

  TabController? _tabController;
  void initState() {
    super.initState();
    load();
    _tabController = TabController(vsync: this, length: 3);
  }
  List stagdata=[];
  List coupledata=[];
  List kidsdata=[];
  bool loader=false;

  List <Offersbook> getproduct=[];
  List <KidsDetail> get=[];

  load(){
    DealSold_api().getproduct_api(widget.club_id).then((value) {
      setState(() {
        setState(() {
          getproduct=value.data!.offersbook!;
          print(getproduct);
          loader=true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:  Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: IconButton(onPressed: (){}, icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),),
        ),
        centerTitle:true,title: Text("Deal Sold",  style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.white,),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            alignment: Alignment.center,
            height: 40,
            child: TabBar(
              labelColor: Colors.white,
              controller: _tabController,
              isScrollable: true,
              indicatorWeight: 0.0,
              indicatorColor: Colors.grey,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
              padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 5.0),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: appColor,
              ),
              tabs: <Widget>[
                Tab(
                  child:Container(
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: appColor),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text('All',
                      style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500),),),
                ),
                Tab(
                  child:Container(
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text("Claimed",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),
                Tab(
                  child:Container(
                    height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 15.0,),
                      decoration: BoxDecoration(
                        border: Border.all(color: appColor),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text("Not Claimed",
                          style: TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w500))
                  ),
                ),

              ],
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0),
            child:     Container(
              height: height,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  BuildAll(context,width),
                  Buildclaim(context,width),
                  BuildNotclaim(context,width),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget BuildAll(context,width){
    return  Padding(
        padding: const EdgeInsets.only(top: 20, right: 28, left: 30,
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: getproduct.length,
            itemBuilder: (context, index) {
              var i =getproduct[index];
              stagdata.add(getproduct.map((e) => e.stagDetail));
              kidsdata.add(getproduct.map((e) => e.kidsDetail));
              coupledata.add(getproduct.map((e) => e.coupleFemale));
              print(stagdata.length);
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context,) => _buildPopupDialog(context,i));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1F1E2E),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0,bottom: 10,top: 10),
                      child: Row(
                        children: [
                          Column( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('31',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white)),
                              Text('Dec',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white)),
                              Text('2022',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white))
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 1,
                            height: 100,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:width*0.6,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(getproduct[index].name.toString(),style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white)),
                                      Container(
                                        padding: EdgeInsets.only(left: 6,right: 4),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Text('Claimed',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.green)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            'Couple :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            'Stag :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            'Kids :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),

                                      ],
                                    ),
                                    // SizedBox(width: 30,),
                                    SizedBox(width: 20,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            getproduct[index].coupleCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            getproduct[index].coupleCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text( getproduct[index].kidsCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                                Text('8pm Onwards',style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 10, color: Colors.green)),
                                Container(
                                  width:width*0.6,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('purchased by Adwerd Shwn',style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 9, color: Colors.white)),
                                      Container(
                                        padding: EdgeInsets.only(left: 8,right: 4,top: 2,bottom: 2),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF494855),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Text('₹${getproduct[index].totalAmount.toString()}/-',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
  Widget Buildclaim(context,width){
    return  Padding(
        padding: const EdgeInsets.only(top: 20,right: 28, left: 30,
        ),
        child:ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: getproduct.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1F1E2E),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0,bottom: 10,top: 10),
                      child: Row(
                        children: [
                          Column( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('32',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white)),
                              Text('Dec',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white)),
                              Text('2022',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white))
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 1,
                            height: 100,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:width*0.6,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(getproduct[index].name.toString(),style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white)),
                                      Container(
                                        padding: EdgeInsets.only(left: 6,right: 4),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Text('Claimed',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.green)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            'Couple :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            'Stag :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            'Kids :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),

                                      ],
                                    ),
                                    // SizedBox(width: 30,),
                                    SizedBox(width: 20,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            getproduct[index].coupleCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            getproduct[index].coupleCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text( getproduct[index].kidsCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                                Text('8pm Onwards',style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 10, color: Colors.green)),
                                Container(
                                  width:width*0.6,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('purchased by Adwerd Shwn',style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 9, color: Colors.white)),
                                      Container(
                                        padding: EdgeInsets.only(left: 8,right: 4,top: 2,bottom: 2),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF494855),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Text('₹${getproduct[index].totalAmount.toString()}/-',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
  Widget BuildNotclaim(context,width){
    return  Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 28, left: 30,
        ),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: getproduct.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF1F1E2E),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0,bottom: 10,top: 10),
                      child: Row(
                        children: [
                          Column( mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('32',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white)),
                              Text('Dec',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white)),
                              Text('2022',style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w200, fontSize: 16, color: Colors.white))
                            ],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 1,
                            height: 100,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:width*0.6,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(getproduct[index].name.toString(),style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white)),
                                      Container(
                                        padding: EdgeInsets.only(left: 6,right: 4),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.green),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Text('Claimed',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.green)),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            'Couple :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            'Stag :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            'Kids :',
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),

                                      ],
                                    ),
                                    // SizedBox(width: 30,),
                                    SizedBox(width: 20,),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            getproduct[index].coupleCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text(
                                            getproduct[index].coupleCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),
                                        Text( getproduct[index].kidsCount.toString(),
                                            overflow: TextOverflow.clip,
                                            softWrap: true,
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                                Text('8pm Onwards',style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400, fontSize: 10, color: Colors.green)),
                                Container(
                                  width:width*0.6,
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('purchased by Adwerd Shwn',style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400, fontSize: 9, color: Colors.white)),
                                      Container(
                                        padding: EdgeInsets.only(left: 8,right: 4,top: 2,bottom: 2),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF494855),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        child: Text('₹${getproduct[index].totalAmount.toString()}/-',style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w400, fontSize: 8, color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  Widget _buildPopupDialog(BuildContext context,i) {
    return  AlertDialog(
      backgroundColor: Color(0xFF1F1E2E),
      title: Text('Details',  style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white)),
      content:  ListView(
        physics: ScrollPhysics(),
      shrinkWrap: true,
        children: [
          Text('Stag',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white)),
          SizedBox(height: 10,),
          ListView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: stagdata.length,
    itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [

                Row(
                  children: [
                    Text(
                        'Name : ',
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                    ),
                    Text(
                        i.stagDetail!.map((e) =>e.name).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                    ),
                    SizedBox(width: 30,),
                    Text('age : ',
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                    ),
                    Text(
                        i.stagDetail!.map((e) =>e.age).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                    ),],
                ),
                Row(
                  children: [
                    Text(
                        'contact : ',
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                    ),
                    Text(
                        i.stagDetail!.map((e) =>e.contact).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                        overflow: TextOverflow.clip,
                        softWrap: true,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                    ),
                  ],
                ),


            ],
          ),
              );  }),
          SizedBox(height: 10,),



          Text('Couple',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white)),
          SizedBox(height: 10,),
          Text('Male', style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: coupledata.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Text(
                              'Name : ',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.coupleMale!.map((e) =>e.name).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),
                          SizedBox(width: 30,),
                          Text('age : ',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.coupleMale!.map((e) =>e.age).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),],
                      ),
                      Row(
                        children: [
                          Text(
                              'contact : ',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.coupleMale!.map((e) =>e.contact).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),
                        ],
                      ),


                    ],
                  ),
                );  }),

          SizedBox(height: 10,),


          Text('Female', style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: coupledata.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Text(
                              'Name :',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.coupleFemale!.map((e) =>e.name).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),
                          SizedBox(width: 30,),
                          Text('age :',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.coupleFemale!.map((e) =>e.age).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),],
                      ),
                      Row(
                        children: [
                          Text(
                              'contact :',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.coupleFemale!.map((e) =>e.contact).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),
                        ],
                      ),


                    ],
                  ),
                );  }),
          SizedBox(height: 10,),


          Text('Kids',  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.white)),
          SizedBox(height: 10,),
          ListView.builder(
              shrinkWrap: true,
              itemCount: kidsdata.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Text(
                              'Name :',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.kidsDetail!.map((e) =>e.name).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),
                          SizedBox(width: 30,),
                          Text('age :',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.kidsDetail!.map((e) =>e.age).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),],
                      ),
                      Row(
                        children: [
                          Text(
                              'contact :',
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 11, color: Colors.white)
                          ),
                          Text(
                              i.kidsDetail!.map((e) =>e.contact).toString().replaceAll( RegExp(r"\p{P}", unicode: true), ""),
                              overflow: TextOverflow.clip,
                              softWrap: true,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)
                          ),
                        ],
                      ),


                    ],
                  ),
                );  }),
        ],
      ),


    );
  }

}

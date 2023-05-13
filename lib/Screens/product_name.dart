import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/product_create_page.dart';
import 'package:flutter_app/Screens/updateproduct.dart';
import 'package:google_fonts/google_fonts.dart';
import '../ApiServices/productApi.dart';
import '../ApiServices/productUpdate.dart';
import '../Modal/getproductM.dart';
import 'colifornia_party.dart';

class Product_name extends StatefulWidget {
  String user_id;
   Product_name({required this.user_id});

  @override
  State<Product_name> createState() => Product_nameState();
}

class Product_nameState extends State<Product_name> {

@override
void initState() {
  load();
    super.initState();
  }
  List <Data> getproduct=[];
bool loader=false;
load(){
  Getproduct_api().getproduct_api(widget.user_id).then((value) {
    setState(() {
      setState(() {
        getproduct=value.data!;
        loader=true;
      });
    });
  });
}
@override
  void dispose() {
  load();
    super.dispose();
  }
          final _formKey=GlobalKey<FormState>();
      @override
      Widget build(BuildContext context) {
        AlertDialog alert = AlertDialog(
          title: Text("AlertDialog"),
          content: Text("delect product file"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('cancel')),
            TextButton( child: Text('ok'),
              onPressed: (){
              RemoveProduct_api().removeProduct_api(id:getproduct[index].id.toString()).then((value) =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Product_name(user_id: '',))));

              },),
          ],
        );
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
            centerTitle:true,title: Text("Event",  style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.white)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          Create_product()));
                    },
                    child: Container(
                      width: 110,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Color(0xFfFD2E6E)
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Create Product +",  style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child:loader==false?Center(child: CircularProgressIndicator(color: Colors.blue,)): Column(children: [
              Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 35, left: 35,
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: getproduct.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(color: Color(0xFF1F1E2E),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0),
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child:  ClipRRect(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                              child: Image.asset('assests/light.png',
                                                fit: BoxFit.fill,
                                                height: 100,
                                                width: 90,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only( left: 10, bottom: 0),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 110),
                                                  child: Container(
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Align(
                                                            alignment:Alignment.topRight,
                                                            child: InkWell(
                                                              onTap: (){
                                                                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                                    Update_product(id: getproduct[index].id.toString(), product_name: getproduct[index].productName.toString(),
                                                                      server_people: getproduct[index].serverPeople.toString(),product_size: getproduct[index].productSize.toString(),
                                                                      price: getproduct[index].price.toString(),

                                                                    )));
                                                              },
                                                              child: Container(
                                                                  width:28,
                                                                  height: 30,
                                                                  child: IconButton(
                                                                    icon: Icon(Icons.edit,color: Colors.white,size: 16,),
                                                                    onPressed: (){
                                                                      setState(() {
                                                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                                                            Update_product(id: getproduct[index].id.toString(), product_name: getproduct[index].productName.toString(),
                                                                              server_people: getproduct[index].serverPeople.toString(),product_size: getproduct[index].productSize.toString(),
                                                                              price: getproduct[index].price.toString(),
                                                                            )));
                                                                      });

                                                                    },)),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10,
                                                          ),
                                                          InkWell(
                                                            onTap: (){


                                                              print('id------${getproduct[index].id}');},
                                                            child: Container (
                                                                alignment: Alignment.center,
                                                                width:28,
                                                                height: 30,
                                                                child: IconButton(
                                                                  icon: Icon(Icons.delete,color: Colors.white,size: 16,),
                                                                  onPressed: (){
                                                                    setState(() {

                                                                          rt(context,getproduct[index].id);
                                                                      // RemoveProduct_api().removeProduct_api(id:getproduct[index].id.toString());
                                                                    });


                                                                  },
                                                                )),
                                                          ),
                                                        ],
                                                      )),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:10.0),
                                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          getproduct[index].productName.toString(),
                                                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                                        ),
                                                        const SizedBox(height: 2,),

                                                        Text(getproduct[index].productSize.toString(),
                                                            style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)
                                                        ),
                                                        const SizedBox(height: 2,),

                                                        Text('${getproduct[index].serverPeople.toString()} people', style: GoogleFonts.poppins(
                                                            fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)
                                                        ),


                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 10,bottom: 10),
                                                          child: Container(
                                                            width:178,
                                                            alignment: Alignment.bottomRight,
                                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Container(width: 10,),
                                                                Container(
                                                                  padding: EdgeInsets.only(left: 10,right: 5),
                                                                  height: 20,
                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFF494855)
                                                                  ),
                                                                  alignment: Alignment.center,
                                                                  child: Text("₹${getproduct[index].price.toString()}/-",  style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),

                                                                ),

                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    )),
                              ),
                            );
                          }))),
            ],),
          ),
        );
      }
      Future rt(context ,id){
        return showDialog(context: context, builder:(context)=>AlertDialog(
          title: Text("AlertDialog"),
          content: Text("delect product file"),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('cancel')),
            TextButton( child: Text('ok'),
              onPressed: (){
                RemoveProduct_api().removeProduct_api(id:id).then((value) =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Product_name(user_id: '',))));

              },),
          ],
        ),
              );
            }
    }


import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/product_name.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../ApiServices/productAdd.dart';

class Create_product extends StatefulWidget {
  const Create_product({Key? key}) : super(key: key);

  @override
  State<Create_product> createState() => Create_productState();
}

class Create_productState extends State<Create_product> {
  final _formKey=GlobalKey<FormState>();
  TextEditingController _productname=TextEditingController();
  TextEditingController _productsize=TextEditingController();
  TextEditingController _price=TextEditingController();
  TextEditingController _people=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading:  Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: IconButton(onPressed: (){}, icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white, size: 20,
              ),),
            ),
            centerTitle:true,title: Text("Event",  style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(left: 20.0, bottom: 3.0, top: 12),
                  child: Text("Product Name",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                ),
                TextFormField(
                  autofocus: true,
                  controller: _productname,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'empty';
                    }else null;
                  },
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon:Icon(Ionicons.close,color: Colors.white,size: 22),
                  onPressed: (){
                    _productname.clear();
                  },),
                    hintText: 'Enter Product Name',
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 10),
                    fillColor: Color(0xFF434445),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(borderSide:
                    BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 20.0, bottom: 3.0, top: 12),
                  child: Text("Portion size",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: _productsize,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'empty';
                    }else null;
                  },
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon:Icon(Ionicons.close,color: Colors.white,size: 22),
                      onPressed: (){
                        _productsize.clear();
                      },),
                    hintText: 'Enter Portion size ',
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 10),
                    fillColor: Color(0xFF434445),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(borderSide:
                    BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 20.0, bottom: 3.0, top: 12),
                  child: Text("Price",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: _price,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'empty';
                    }else null;
                  },
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon:Icon(Ionicons.close,color: Colors.white,size: 22),
                      onPressed: (){
                        _price.clear();
                      },),
                    hintText: 'Enter Enter Price',
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 10),
                    fillColor: Color(0xFF434445),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(borderSide:
                    BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
                  ),
                ),
                Padding(padding: const EdgeInsets.only(left: 20.0, bottom: 3.0, top: 12),
                  child: Text("Serve How Many People",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  controller: _people,
                  validator: (val){
                    if(val!.isEmpty){
                      return 'empty';
                    }else null;
                  },
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon:Icon(Ionicons.close,color: Colors.white,size: 22),
                      onPressed: (){
                        _people.clear();
                      },),
                    hintText: 'Enter People Number',
                    hintStyle: TextStyle(color: Colors.white54, fontSize: 10),
                    fillColor: Color(0xFF444546),
                    filled: true,
                    contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(borderSide:
                    BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.7)),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                      child: GestureDetector(
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            setState(() {
                              Addproduct_api().addproduct_api(
                                  product_name: _productname.text.toString(),
                                  product_size: _productsize.text.toString(),
                                  price: _price.text.toString(),
                                  server_people: _people.text.toString()).then((
                                  value) =>
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) =>
                                          Product_name(user_id: '',))));
                            });

                          }},
                        child: Container(
                          width: 140,
                          height: 50.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset(0.1, 0.1),
                              end: FractionalOffset(0.7, 0.1),
                              colors: [
                                Color(0xFFFE262F),
                                Color(0xFFFD2F71),
                              ],
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: Text('Submit',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.white)),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

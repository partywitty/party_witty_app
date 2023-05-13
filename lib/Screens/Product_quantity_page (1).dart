import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class Product_quantity extends StatefulWidget {
  const Product_quantity({Key? key}) : super(key: key);

  @override
  State<Product_quantity> createState() => _Product_quantityState();
}

class _Product_quantityState extends State<Product_quantity> {
  var Product1_value=1;
  Product1_increment(){
    setState(() {
      Product1_value++;
    });
  }
  Product1_decrement(){
    setState(() {
      if(Product1_value>0){
        Product1_value--;}
    });
  }

  var Product2_value=1;
  Product2_increase(){
    setState(() {
      Product2_value++;
    });
  }
  Product2_decrease(){
    setState(() {
      if(Product2_value>0){
        Product2_value--;}
    });
  }

  var Product3_value=1;
  Product3_increase(){
    setState(() {
      Product3_value++;
    });
  }

  Product3_decrease(){
    setState(() {
      if(Product3_value>0){
        Product3_value--;}
    });
  }

  var Product4_value=1;
  Product4_increment(){
    setState(() {
      Product4_value++;
    });
  }
  Product4_decrement(){
    setState(() {
      if(Product4_value>0){
        Product4_value--;}
    });
  }

  var Product5_value=1;
  Product5_increment(){
    setState(() {
      Product5_value++;
    });
  }
  Product5_decrement(){
    setState(() {
      if(Product5_value>0){
        Product5_value--;}
    });
  }

  var Product6_value=1;
  Product6_increment(){
    setState(() {
      Product6_value++;
    });
  }
  Product6_decrement(){
    setState(() {
      if(Product6_value>0){
        Product6_value--;}
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        centerTitle: true,
        title: Text("Create Event", style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              TextFormField(
                onFieldSubmitted: (val){

                },
                style: TextStyle(
                    fontSize: 15.0, color: Colors.white),
                decoration: InputDecoration(

                    suffixIcon: IconButton(
                      onPressed: (){},
                      icon: Icon(Ionicons.search,color: Colors.white,size: 20,),
                    ),
                    hintText: 'Search..',
                    hintStyle: TextStyle(
                        color: Colors.grey  , fontSize: 10),
                    fillColor: Color(0xFF807e7e),
                    filled: true,

                    contentPadding: const EdgeInsets.only(left: 25.0, bottom: 12.0, top: 0.0),
                    focusedBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF434445)),
                      borderRadius: BorderRadius.circular(25.7),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.7)
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Event",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                    Text("Quatity",
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:31,
                      width: 108,
                      alignment: Alignment.center,
                      decoration:BoxDecoration(
                          color: Color(0xFF434445),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Product 1",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
                    ),
                    Container(
                      height:31,
                      width: 110,
                      decoration:BoxDecoration(
                        color: Color(0xFF434445),
                        borderRadius: BorderRadius.circular(5),),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            Product1_increment();
                          }, icon: Icon(Icons.add,size: 14,color: Colors.white,)),
                          Text(Product1_value.toString(),
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.remove), onPressed: (){
                              Product1_decrement();
                            }, iconSize: 14,color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:31,
                      width: 108,
                      alignment: Alignment.center,
                      decoration:BoxDecoration(
                          color: Color(0xFF434445),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Product 2",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 11, color: Colors.white)),
                    ),
                    Container(
                      height:31,
                      width: 110,
                      decoration:BoxDecoration(
                        color: Color(0xFF434445),
                          borderRadius: BorderRadius.circular(5),),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){Product2_increase();}, icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                          Text(Product2_value.toString(),
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){Product2_decrease();},
                            iconSize: 15,color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:31,
                      width: 108,
                      alignment: Alignment.center,
                      decoration:BoxDecoration(
                          color: Color(0xFF434445),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Product 3",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
                    ),
                    Container(
                      height:31,
                      width: 110,
                      decoration:BoxDecoration(
                        color: Color(0xFF434445),
                        borderRadius: BorderRadius.circular(5),),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){Product3_increase();}, icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                          Text(Product3_value.toString(),
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){Product3_decrease();},
                            iconSize: 15,color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:31,
                      width: 108,
                      alignment: Alignment.center,
                      decoration:BoxDecoration(
                          color: Color(0xFF434445),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Product 4",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
                    ),
                    Container(
                      height:31,
                      width: 110,
                      decoration:BoxDecoration(
                        color: Color(0xFF434445),
                        borderRadius: BorderRadius.circular(5),),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){Product4_increment();}, icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                          Text(Product4_value.toString(),
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){Product4_decrement();},
                            iconSize: 15,color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:31,
                      width: 108,
                      alignment: Alignment.center,
                      decoration:BoxDecoration(
                          color: Color(0xFF434445),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Product 5",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
                    ),
                    Container(
                      height:31,
                      width: 108,
                      decoration:BoxDecoration(
                        color: Color(0xFF434445),
                        borderRadius: BorderRadius.circular(5),),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){Product5_increment();}, icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                          Text(Product5_value.toString(),
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){Product5_decrement();},
                            iconSize: 15,color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0,left: 10,right: 15),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:31,
                      width: 108,
                      alignment: Alignment.center,
                      decoration:BoxDecoration(
                          color: Color(0xFF434445),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Product 6",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.white)),
                    ),
                    Container(
                      height:31,
                      width: 110,
                      decoration:BoxDecoration(
                        color: Color(0xFF434445),
                        borderRadius: BorderRadius.circular(5),),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){Product6_increment();}, icon: Icon(Icons.add,size: 15,color: Colors.white,)),
                          Text(Product6_value.toString(),
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white)),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: (){Product6_decrement();},
                            iconSize: 15,color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40,),
              Center(
                child: Container(
                    child: GestureDetector(
                      onTap: () {},
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
                          child: Text('Add +',
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
    );
  }
}

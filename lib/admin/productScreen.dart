import 'package:decora/admin/addProductScreen.dart';
import 'package:decora/admin/viewProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Color(0xff16403B),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: cstgradient,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
            "PRODUCT",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20, color: Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient: screenGradient
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                      onTap: () {
                        value.getCategory();
                        value.clearAddedProduct();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(from: "NEW", oldid: '',),));
                      },
                      child: Container(
                        height: height/12,
                        width: width/1.2,
                        decoration: BoxDecoration(
                          gradient: containerGradient,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("Add Product",style: TextStyle(color: Colors.white,fontFamily: "philosopher",fontSize: 25),)),
                      ),
                    );
                  }
                ),
                SizedBox(height: 20,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                      onTap: () {
                        value.getAddedProduct();
                        value.getCategory();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewProductScreen(),));
                      },
                      child: Container(
                        height: height/12,
                        width: width/1.2,
                        decoration: BoxDecoration(
                            gradient: containerGradient,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("View Product",style: TextStyle(color: Colors.white,fontFamily: "philosopher",fontSize: 25),)),
                      ),
                    );
                  }
                ),
                SizedBox(height: 20,),
                // Container(
                //   height: height/12,
                //   width: width/1.2,
                //   decoration: BoxDecoration(
                //       gradient: containerGradient,
                //       borderRadius: BorderRadius.circular(20)
                //   ),
                //   child: Center(child: Text("View Recently Added Product",style: TextStyle(color: Colors.white,fontFamily: "philosopher",fontSize: 20),)),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

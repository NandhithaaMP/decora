import 'package:decora/models/adminModel.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';


class ViewProductDetails extends StatefulWidget {
  ProductModel item;



  ViewProductDetails({
    super.key,
    required this.item,


  });

  @override
  State<ViewProductDetails> createState() => _ViewProductDetailsState();
}

class _ViewProductDetailsState extends State<ViewProductDetails> {

  @override



  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
            "BUY NOW",
            style: TextStyle(
                fontFamily: "tradeWinds",
                fontSize: 20,
                color: Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body:
      SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Column(mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      SizedBox(height: height / 40),


                      Center(
                        child: Container(
                          height: height / 1.5,
                          width: width / 1.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(120),
                              border: Border.all(width: 2.5, color: Color(0xffE7C780)),
                              color: green,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff16403B).withOpacity(0.6),
                                  offset: Offset(-10, 0),
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30),
                              Text(widget.item.productName,
                                  style: TextStyle(
                                      fontFamily: "mukta",
                                      color: Color(0xffE4A951),
                                      fontSize: 35)),
                              SizedBox(height: 20),
                              Container(
                                height: height / 3,
                                width: width / 2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage(widget.item.productImage),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("₹ "+widget.item.price.toString(),
                                  style: TextStyle(
                                      fontFamily: "mukta",
                                      color: Color(0xffE4A951),
                                      fontSize: 35)
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.item.productDescription,style: TextStyle(color: Colors.white,fontFamily: "mukta", fontSize: 15),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: cstgreen,
                      ),
                      SizedBox(height: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total no of product :${widget.item.totalProduct}",
                                  style: TextStyle(color: Colors.white,
                                      fontFamily:"mukta",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 5,),
                          Container(height: 1,
                            width: double.infinity,
                            color: cstgreen ,),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.delivery_dining_outlined,color: Colors.white,),
                                Text("Delivery By :",
                                  style: TextStyle(color: Colors.white,
                                      fontFamily:"mukta",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(" 7 oct,tuesday",
                                  style: TextStyle(color: Colors.white,
                                      fontFamily:"mukta",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(height: 1,
                            width: double.infinity,
                            color: cstgreen ,
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Current Status: ${widget.item.status}",style: TextStyle(color: Colors.white,
                                fontFamily:"mukta",
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),
                          ),

                        ],
                      ),


                      SizedBox(height: 20,),


                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}

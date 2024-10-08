import 'package:decora/models/adminModel.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import 'orderSummaryScreen.dart';

class BuyNowScreen extends StatefulWidget {
  ProductModel item;
  String userId;


  BuyNowScreen({
    super.key,
    required this.item,
    required this.userId,

  });

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  bool isLiked = false;
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

      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return Column(

                  children: [
                    SizedBox(height: height / 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                                if (isLiked) {
                                  // value.addToWishList(
                                  //     widget.productName,
                                  //     widget.productImage,
                                  //     widget.productPrice
                                  // );
                                }
                                const snackBar = SnackBar(content: Text("Added to wishlist"));
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: isLiked ? textColor : Colors.transparent,
                                      gradient: isLiked ? null : cstgradient,
                                      borderRadius: BorderRadius.circular(30)),
                                  child:Icon(Icons.favorite_border,color: cstgreen,)
                                  // Image.asset("assets/icons/like.png",
                                  //     scale: 5, color: green),
                                ),
                              ),
                            );
                          }
                      ),
                    ),
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
                            Text("₹ "+widget.item.price,
                                style: TextStyle(
                                    fontFamily: "mukta",
                                    color: Color(0xffE4A951),
                                    fontSize: 35)),
                            // Text("₹ " + widget.productPrice,
                            // Text("₹ " +wiget.productPrice,
                            //     style: TextStyle(
                            //         color: cstyellow,
                            //         fontFamily: "mukta",
                            //         fontSize: 30)),
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
                              Text("Deliver To :",
                                style: TextStyle(color: Colors.black,
                                    fontFamily:"mukta",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Change",
                                style: TextStyle(color: Colors.black,
                                    fontFamily:"mukta",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),)
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Perinthalmanna , Angadippuram , \nIn harinagar ,House Number 88,Malappuram,pin :679338,kerala,India",
                            style: TextStyle(color: Colors.white,
                                fontFamily:"muktaregular",
                                fontSize: 16,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                        )
                      ],
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
                          Icon(Icons.delivery_dining_outlined),
                          Text("Delivery By :",
                            style: TextStyle(color: Colors.black,
                                fontFamily:"mukta",
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(" 7 oct,tuesday",
                            style: TextStyle(color: Colors.black,
                                fontFamily:"mukta",
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),




                    Consumer<MainProvider>(builder: (context, value, child) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       isLiked = !isLiked;
                            //     });
                            //     if (isLiked) {
                            //       value.addToWishList(widget.productName,
                            //           widget.productImage, widget.productPrice);
                            //     }
                            //     const snackBar = SnackBar(content: Text("Added to wishlist"));
                            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            //   },
                            //   child: Container(
                            //     height: 50,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //         color: isLiked ? textColor : Colors.transparent,
                            //         gradient: isLiked ? null : cstgradient,
                            //         borderRadius: BorderRadius.circular(30)),
                            //     child: Image.asset("assets/icons/like.png",
                            //         scale: 5, color: green),
                            //   ),
                            // ),

                            InkWell(
                              onTap: () {
                                value.addToCart(widget.userId, widget.item.pid,widget.item.productImage,widget.item.price,widget.item.productName,);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen(userId: widget.userId)));
                              },
                              child: Container(
                                height: 50,
                                width: width / 3,
                                decoration: BoxDecoration(
                                    gradient: cstgradient,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text("Add to cart",
                                        style: TextStyle(
                                            fontFamily: "philosopher",
                                            fontSize: 20,
                                            color: green))),
                              ),
                            ),
                            // SizedBox(width: 10),

                            SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderSummaryScreen()));
                              },
                              child: Container(
                                height: 50,
                                width: width / 3,
                                decoration: BoxDecoration(
                                    gradient: cstgradient,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text("Buy Now",
                                        style: TextStyle(
                                            fontFamily: "philosopher",
                                            fontSize: 20,
                                            color: green))),
                              ),

                            ),




                          ]);
                    }),

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

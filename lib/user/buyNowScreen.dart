import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
class BuyNowScreen extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productPrice;

  const BuyNowScreen({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
  });

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  bool isLiked=false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor:  Color(0xff16403B),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: cstgradient,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
            "BUY NOW",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20, color: Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height / 14),
                Container(
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
                      ]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Text(widget.productName, style: TextStyle(fontFamily: "mukta", color: Color(0xffE4A951), fontSize: 35)),
                      SizedBox(height: 20),
                      Container(
                        height: height / 3,
                        width: width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(widget.productImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(widget.productPrice, style: TextStyle(color: Colors.white, fontFamily: "mukta", fontSize: 35)),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked=!isLiked;
                          });
                          if(isLiked){
                            value.addToWishList(
                                widget.productName,
                                widget.productImage,
                                widget.productPrice
                            );
                          }
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => WishList(
                          //   productName:widget.productName,
                          //   productImage:widget.productImage,
                          //   productPrice:widget.productPrice
                          // ),
                          // ));
                          const snackBar = SnackBar(content: Text("Added to wishlist"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: isLiked?Colors.red.shade50:Colors.transparent,
                              gradient: isLiked?null:cstgradient,
                              borderRadius: BorderRadius.circular(30)),
                          child: Image.asset("assets/icons/like.png", scale: 5, color: green),
                        ),
                      ),
                      SizedBox(width: 30),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                        },
                        child: Container(
                          height: 50,
                          width: width / 2,
                          decoration: BoxDecoration(
                              gradient: cstgradient, borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text("Buy Now", style: TextStyle(fontFamily: "philosopher", fontSize: 30, color: green))),
                        ),
                      ),
                    ]);
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

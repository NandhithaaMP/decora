import 'package:decora/user/cartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constant_color.dart';

class BuyNowScreen extends StatelessWidget {
  const BuyNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
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
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
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
                SizedBox(height: height/14),
                Container(
                  height: height/1.5,
                  width: width/1.3,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(120),
                   border: Border.all(width: 2.5,color: Color(0xffE7C780)),
                   color: green,
                   boxShadow: [
                     BoxShadow(
                       // color: Colors.black.withOpacity(0.5),
                       color: Color(0xff16403B).withOpacity(0.6),
                       offset: Offset(-10, 0), // horizontal offset, negative for left side
                       blurRadius: 5, // blur radius
                       spreadRadius: 5, // spread radius
                     ),
                   ]
                 ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 30),
                      Text("Swing Arm",style: TextStyle(fontFamily: "astloch",color: Color(0xffE4A951),fontSize: 35),),
                      Text("Lamp",style: TextStyle(fontFamily: "swash",color: Color(0xffE4A951),fontSize: 30),),
                      SizedBox(height:20),
                      Container(
                        height: height/3,
                        width: width/2,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage("assets/lamp2.jpg",),fit: BoxFit.fill
                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("₹ 399",style: TextStyle(color: Colors.white,fontFamily: "mukta",fontSize: 35),)
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                    onTap: () {
                    const snackBar=SnackBar(content: Text("Added to wishlist"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                      child: Container(
                          height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            gradient: cstgradient,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Image.asset("assets/icons/like.png",scale: 5,color: green,),
                      ),
                    ),
                    SizedBox(width: 30,),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen(),));
                      },
                      child: Container(
                          height: 50,
                        width: width/2,
                        decoration: BoxDecoration(
                            gradient: cstgradient,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                            child: Text("Buy Now",style: TextStyle(fontFamily: "philosopher",fontSize: 30,color: green),)),
                      ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

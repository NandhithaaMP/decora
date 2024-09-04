
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'orderDetailsScreen.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: green,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor:  Color(0xffCBB480),

            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: cstgradient,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
            ),
            title: Text(
              "MY ORDER",
              style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
            ),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            Container(
              height: height/15,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.search_rounded),
                  SizedBox(width: 15),
                  Text(
                    "Search Your Order here.....",
                    style: TextStyle(fontFamily:"muktaregular",color: Colors.black26, fontSize: 14),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
               Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: height/8,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: textColor),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image: AssetImage("assets/lamp1.jpg")),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child: Column(
                              children: [
                                Text("Lamp",style: TextStyle(fontFamily: "muktamedium",fontSize: 15,fontWeight: FontWeight.w600),),
                                Text("Qty:1",style: TextStyle(fontFamily: "muktamedium",fontSize: 15,fontWeight: FontWeight.w600),),
                                Text("300",style: TextStyle(fontFamily: "muktamedium",fontSize: 15,fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Icon(Icons.navigate_next_sharp)
                    ],
                  ),
                )
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: height/10,
                //       width: 60,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(12),
                //         color: Colors.white,
                //       ),
                //       child:
                //       Row(
                //         children: [
                //           Image.asset("assets/lamp4.jpg",fit: BoxFit.fill),
                //           Text("   The Secret\n   Qty: 1\n   ₹310",
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 15,
                //               fontWeight: FontWeight.bold,
                //               fontFamily: "aleo",
                //             ),
                //           ),SizedBox(width:150),
                //           Icon(Icons.arrow_forward_ios)
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
              ),

          ]),
        ));
  }
}
import 'dart:ui';

import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor:  Color(0xffCBB480),

          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: cstgradient,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
            "ORDER SUMMARY",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient:LinearGradient(
                  colors: [

                    Color(0xffCBB480),
                    Color(0xff807646),
                  ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )

          ),
          child:  SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(height: 10,),
                Container(
                  decoration:  BoxDecoration(
                      color: Colors.transparent,
                      border: Border(bottom: BorderSide(
                          color:green,width: 3
                      )
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      height: height/4,
                      width: width,
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Deliver to :",style: TextStyle(fontFamily: "philosopher",fontSize: 20,fontWeight: FontWeight.w600), ),
                              Container(
                                height: 40,
                                width: 80,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Center(child: Text("Change",style: TextStyle(color: Color(0xff1327D2,),fontFamily: "philosopher",fontWeight: FontWeight.bold,fontSize: 15),)),
                              )
                            ],
                          ),
                          Text("Nandhitha",style: TextStyle(fontFamily: "philosopher",fontSize: 16,fontWeight: FontWeight.w600), ),
                          Text("Mangavu Parambil house,Kottapparambu , vengara,676304",style: TextStyle(fontFamily: "philosopher",fontSize: 16,fontWeight: FontWeight.w600), ),
                          Text("987654321",style: TextStyle(fontFamily: "philosopher",fontSize: 16,fontWeight: FontWeight.w600), ),
                        ],
                      ),

                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: green,width: 3))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(

                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          Text("Order List",style: TextStyle(fontFamily: "philosopher",fontSize: 24,fontWeight: FontWeight.w600), ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              Container(
                                height: 40,
                                width: 80,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black)
                                ),
                                child: Center(child: Text("Change",style: TextStyle(color: Color(0xff1327D2,),fontFamily: "philosopher",fontWeight: FontWeight.bold,fontSize: 15),)),
                              )
                            ],
                          ),
                          Row(
                            children: [

                              Image.asset("assets/sofa4.jpg",scale: 6),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Widsor Chair",style: TextStyle(fontFamily: "muktaregular",fontSize: 20),),
                                    Text("₹ 499",style: TextStyle(fontFamily: "muktaregular",fontSize: 20),),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Color(0xffD9D9D9),
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text(
                                "Qty : 1 ",style: TextStyle(fontFamily: "philosopher",fontSize: 15),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("Delivery by jul 20 , Sat ",style: TextStyle(fontFamily: "muktaregular",fontSize: 15),),
                          SizedBox(height: 20,)
                        ],
                      ),
                    ),
                  ),
                ),
                Text("Payment",style: TextStyle(fontFamily: "muktaregular",fontSize: 24,fontWeight: FontWeight.w600),)

                

              ],
            ),
          ),
        ),
      ),
    );
  }
}

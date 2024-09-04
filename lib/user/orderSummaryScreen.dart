
import 'package:decora/constants/constant_color.dart';
import 'package:decora/user/successScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'failedScreen.dart';

class OrderSummaryScreen extends StatefulWidget {
  OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  bool order=false;
  bool order1=false;
  int _value = 1;

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
              "ORDER SUMMARY",
              style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
            ),
            centerTitle: true,
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Container(
                      height: height/5,
                      width:width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                         color: cstText,
                          border: Border.all(color: Colors.black26),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 3)
                          ]
                      ),
                      child:
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
                              style: TextStyle(color: Colors.black,
                                  fontFamily:"muktaregular",
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: height/2.8,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: cstText,
                          border: Border.all(color: Colors.black26),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 3)
                          ]
                      ),
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Order List",
                                  style: TextStyle(color: Colors.black,
                                      fontFamily:"mukta",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(width:130),
                                Text("Add More",
                                  style: TextStyle(color: Colors.black,
                                      fontFamily:"mukta",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40,top: 10),
                            child: Text("Items",
                              style: TextStyle(color: Colors.black,
                                  fontFamily:"muktamedium",
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Row(
                              children: [
                                Container(
                                  height: height/8,
                                  width:width/5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/scrt.png"),
                                    ),
                                  ),



                                ),
                                SizedBox(width:20),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text("The Secret",
                                          style: TextStyle(color: Colors.black,
                                              fontFamily:"mukta",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w900
                                          ),
                                        ),
                                        SizedBox(width:width/5),
                                        Icon(Icons.edit_note_rounded,color: Colors.black54,)
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right:90,top: 10),
                                      child: Container(
                                        height: height/18,
                                        width: width/5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            color: Colors.white,
                                            border: Border.all(color: Colors.black26),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black26,
                                                  spreadRadius: 2,
                                                  blurRadius: 3)
                                            ]
                                        ),
                                        child:
                                        Padding(
                                          padding: const EdgeInsets.only(left: 2,top: 5),
                                          child: Text("   -   1    +",
                                            style: TextStyle(color: Colors.black,
                                                fontFamily:"mukta",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),

                                        ),

                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:25,top: 20,right: 25),
                            child: Container(
                              height: 1,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  boxShadow:[BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 3
                                  ),


                                  ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("Total",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily:"mukta",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text("₹310",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily:"mukta",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:cstText,
                        boxShadow:[
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 1,
                            blurRadius: 3
                        ),
                        ],
                      ),
                      child:
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13,top: 13),
                            child: Text("Payment",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "mukta",
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),

                          Row(
                            children: [SizedBox(width:40,),
                              Image.asset("assets/upi.jpg",scale: 4.5,),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:160,top: 10),
                                    child: Text("UPI",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 1),
                                    child: Row(
                                      children: [
                                        Text("Pay by any UPI app",
                                          style: TextStyle(
                                            color: Color(0xff3B994C),
                                            fontFamily: "alef",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width:width/3),
                                        InkWell(onTap: () {
                                          setState(() {
                                            order1=!order1;
                                          });
                                        },


                                            child:  Icon(Icons.arrow_drop_down)),



                                      ],
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                          Visibility(
                            visible: order1,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Google Pay'),
                                      SizedBox(width: 40),
                                      Image.asset("assets/gpay.png",scale:5.8)
                                    ],
                                  ),
                                  leading: Radio<int>(
                                    value: 1,
                                    groupValue: _value,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _value = value!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('PhonePe'),
                                      SizedBox(width: 55),

                                      Image.asset("assets/phonepe.png",scale: 13,)
                                    ],
                                  ),
                                  leading: Radio<int>(
                                    value: 2,
                                    groupValue: _value,
                                    onChanged: (int? value) {
                                      setState(() {
                                        _value = value!;
                                      });
                                    },
                                  ),
                                ),

                                Container(
                                  height: 40,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xffF0DA11)
                                  ),
                                  child:
                                  Center(
                                    child: Text("Pay Now",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left:30,top: 10,right: 30),
                            child: Container(
                              height: 1.2,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.black26
                              ),
                            ),
                          ),
                          SizedBox(height:20),


                          Row(
                            children: [SizedBox(width: 40,),
                              Icon(Icons.delivery_dining_rounded,size: 25,),
                              SizedBox(width: 6),
                              Text("Cash on Delivery",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "mukta",
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width:width/3.5),
                              InkWell(onTap: () {
                                setState(() {
                                  order=!order;
                                });

                              },
                                  child: Icon(Icons.arrow_drop_down))
                            ],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left:30,top: 10,right: 30),
                            child: Container(
                              height: 1.2,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.black26
                              ),
                            ),
                          ),

                          SizedBox(height:40),

                          Visibility(
                            visible: order,
                            child: Column(
                              children: [
                                Text("Due to handling costs, a nominal\n         fee of 5  will be charged",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                                 SizedBox(height: 10,),

                                 Center(
                                   child: Container(
                                      height: 40,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Color(0xffF0DA11)
                                      ),
                                      child:
                                      Center(
                                        child: Text("Place Order",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16
                                          ),
                                        ),
                                      ),
                                    ),
                                 ),
                                SizedBox(height: 20,)

                              ],
                            ),
                          ),


                        ],

                      ),

                    ),
                    SizedBox(height: 20,

                    )    ]
              ),
            )
        )
    );
  }
}

import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(backgroundColor: green,
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
            "ORDER DETAILS",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [


            Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: height/8,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cstText
                ),
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

            ),
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
            Column(
              children: [
                Container(
                  // height: 300,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: cstText,
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3,
                            spreadRadius: 1
                        )
                      ]
                  ),
                  child:
                  Stack(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 50,top: 25),
                        child: Container(
                          height: 80,
                          width: 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff007483),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 41,bottom: 20),
                        child: Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff007483),
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 50,top: 20),
                              child: Column(
                                children: [
                                  Text("Ordered",
                                    style: TextStyle(
                                        color: Color(0xff007483),
                                        fontFamily: "aleo",
                                        fontSize: 18
                                    ),
                                  ),
                                  Text("03 AUG",
                                    style: TextStyle(
                                        color: Colors.black26,
                                        fontFamily: "aleo",
                                        fontSize: 14
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                      ),




            // ..................................................................................................


                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50,top: 100),
                            child: Container(
                              height: 80,
                              width: 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff007483),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 41,top: 70),
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xff007483),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50,top: 20),
                                  child: Column(
                                    children: [
                                      Text("Shipped",
                                        style: TextStyle(
                                            color: Color(0xff007483),
                                            fontFamily: "aleo",
                                            fontSize: 18
                                        ),
                                      ),
                                      Text("06 AUG",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontFamily: "aleo",
                                            fontSize: 14
                                        ),
                                      ),

                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),






            // .................................................................................................



                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 50,top: 180),
                                child:
                                Container(
                                  height: 80,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff007483),
                                  ),
                                ),
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:150,left: 41),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xff007483),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left:50,top: 170),
                                    child: Column(
                                      children: [
                                        Text("Out Of Delivery",
                                          style: TextStyle(
                                              color: Color(0xff007483),
                                              fontFamily: "aleo",
                                              fontSize: 16
                                          ),
                                        ),
                                        Text("07 AUG",
                                          style: TextStyle(
                                              color: Colors.black26,
                                              fontFamily: "aleo",
                                              fontSize: 14
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
            // .....................................................................................................

                              Padding(
                                padding: const EdgeInsets.only(left: 41,top: 220),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xff007483),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left:50,top: 25),
                                          child: Text("Delivery",
                                            style: TextStyle(
                                                color: Color(0xff007483),
                                                fontFamily: "aleo",
                                                fontSize: 18
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 35),
                                          child: Text("08 AUG",
                                            style: TextStyle(
                                                color: Colors.black26,
                                                fontFamily: "aleo",
                                                fontSize: 14
                                            ),
                                          ),
                                        ),

                                      ],
                                    )
                                  ],
                                ),

                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),



                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}
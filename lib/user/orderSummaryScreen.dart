
import 'package:decora/constants/constant_color.dart';
import 'package:decora/user/successScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'failedScreen.dart';

class ordersummery extends StatefulWidget {
  ordersummery({super.key});

  @override
  State<ordersummery> createState() => _ordersummeryState();
}

class _ordersummeryState extends State<ordersummery> {
  bool order=false;
  bool order1=false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(backgroundColor: green,
        appBar: AppBar(backgroundColor: Colors.red,
          title: Text("Order Summery",
            style:TextStyle(color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 20,
              fontFamily: "allerta",
            ),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)
              )
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18,top: 30),
                    child: InkWell(onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SuccesScreen(),));
                    },
                      child: Container(
                        height: 150,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.yellow,
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
                          children: [
                            SizedBox(height: 10,),
                            Row(
                              children: [SizedBox(width: 35),
                                Text("Deliver To :",
                                  style: TextStyle(color: Colors.black,
                                      fontFamily:"aleo",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(width:120),
                                Text("Change",
                                  style: TextStyle(color: Colors.black,
                                      fontFamily:"aleo",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                  ),)
                              ],
                            ),
                            SizedBox(height:15),
                            Text("Perinthalmanna , Angadippuram, "
                                "\nIn harinagar ,House Number 88,"
                                "\npin :679338",
                              style: TextStyle(color: Colors.black,
                                  fontFamily:"aleo",
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FailedScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18,top: 30),
                      child: Container(
                        height: 250,
                        width: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.blue,
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
                              child: Row(
                                children: [
                                  Text("Order List",
                                    style: TextStyle(color: Colors.black,
                                        fontFamily:"aleo",
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(width:130),
                                  Text("Add More",
                                    style: TextStyle(color: Colors.black,
                                        fontFamily:"aleo",
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
                                    fontFamily:"aleo",
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
                                    height: 90,
                                    width: 70,
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
                                                fontFamily:"aleo",
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900
                                            ),
                                          ),
                                          SizedBox(width:50),
                                          Icon(Icons.edit_note_rounded,color: Colors.black54,)
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right:75,top: 10),
                                        child: Container(
                                          height: 30,
                                          width: 70,
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
                                                  fontFamily:"aleo",
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
                              padding: const EdgeInsets.only(left:25,top: 20),
                              child: Container(
                                height: 1,
                                width: 270,
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
                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left:25,top: 10),
                                  child: Text("Total",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily:"aleo",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:10,left: 185),
                                  child: Text("₹310",
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily:"aleo",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:60),
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:Colors.pink,
                      boxShadow:[BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 3
                      ),
                      ],
                    ),
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Payment",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "aleo",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        Row(
                          children: [SizedBox(width:40,),
                            Image.asset("assets/images/upi.png",scale: 4.5,),
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
                                      SizedBox(width:60),
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
                                title: Row(
                                  children: [
                                    Text('Google Pay'),
                                    SizedBox(width: 40),
                                    Image.asset("assets/images/G pay.png",scale:5)
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
                                title: Row(
                                  children: [
                                    Text('PhonePe'),
                                    SizedBox(width: 55),

                                    Image.asset("assets/images/phonepe.png",scale: 5,)
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
                              ListTile(
                                title: Row(
                                  children: [
                                    Text('Slice'
                                    ),
                                    SizedBox(width: 80),

                                    Image.asset("assets/images/slice.png",scale: 5,)
                                  ],
                                ),
                                leading: Radio<int>(
                                  value: 3,
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
                          padding: const EdgeInsets.only(left:40,top: 10),
                          child: Container(
                            height: 1.2,
                            width: 250,
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
                                fontFamily: "alef",
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width:50),
                            InkWell(onTap: () {
                              setState(() {
                                order=!order;
                              });

                            },
                                child: Icon(Icons.arrow_drop_down))
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:40,top: 10),
                          child: Container(
                            height: 1.2,
                            width: 250,
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
                              Text("          Due to handling costs, a nominal\n                  fee of 5  will be charged",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:10,top: 20),
                                child: InkWell(onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SuccesScreen(),));
                                },
                                  child: Container(
                                    height: 40,
                                    width: 150,
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
                              ),
                            ],
                          ),
                        ),


                      ],

                    ),

                  ),
                  SizedBox(height: 20,

                  )    ]
            )
        )
    )
    );
  }
}
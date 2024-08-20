
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrederDetails extends StatefulWidget {
  const OrederDetails({super.key});

  @override
  State<OrederDetails> createState() => _OrederDetailsState();
}

class _OrederDetailsState extends State<OrederDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: green,
      appBar: AppBar(backgroundColor: Colors.red,
        title: Text("Order Detailes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: "allerta",
          ),
        ),
        centerTitle:true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)
            )
        ),
      ),
      body: Column(
        children: [


          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: 80,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:Colors.pink,
                  border: Border.all(color: Colors.black26),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 3),
                  ]
              ),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),

                        child:
                        Row(
                          children: [
                            Image.asset("assets/images/en 6.png",fit: BoxFit.fill),
                            Text("   The Secret",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "aleo",
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ]
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 120,
              width: 330,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color:Colors.purple,
                  border: Border.all(color: Colors.black26),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1,
                        blurRadius: 3),
                  ]
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width:10),
                      Text("Deliver to:",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "aleo",
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 180),
                      Text("Change",
                        style: TextStyle(
                            color: Colors.black38,
                            fontFamily: "aleo",
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20,top: 10),
                    child: Text("Perinthalmanna , Angadippuram,\nIn harinagar,House Number88,pin :679338 ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "aleo",
                          fontSize: 18,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
// ............................................................................................................
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Column(
              children: [
                Container(
                  // height: 300,
                  width: 330,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow,
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
          ),



        ],
      ),
    );
  }
}
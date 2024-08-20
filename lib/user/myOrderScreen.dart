
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
    return Scaffold(
        backgroundColor: green,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              "My Order",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  fontFamily: "allerta"),
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Container(
              height: 45,
              width: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.search_rounded),
                  SizedBox(width: 15),
                  Text(
                    "Search Your Order her.....",
                    style: TextStyle(color: Colors.black26, fontSize: 14),
                  )
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8, top: 20),
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrederDetails(),));
              },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 80,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child:
                        Row(
                          children: [
                            Image.asset("assets/images/en 6.png",fit: BoxFit.fill),
                            Text("   The Secret\n   Qty: 1\n   ₹310",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "aleo",
                              ),
                            ),SizedBox(width:150),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ]));
  }
}
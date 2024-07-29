import 'dart:ui';

import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

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
            "WISH LIST",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient:screenGradient

          ),
          child:  SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: 5,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 100,
                            width: width,
                            decoration: BoxDecoration(
                                color:Color(0xffB6A683)
                            ),
                            child:
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8,8,8,8),
                                      child: Image.asset('assets/sofa4.jpg',),

                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(height: 5,),
                                          Text("Widsor Chair",style: TextStyle(fontFamily: "muktamedium",fontSize: 20),),


                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Image.asset("assets/icons/delete.png",scale: 20,),
                                ),

                              ],
                            )

                        ),
                      );
                    },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

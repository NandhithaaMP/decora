import 'package:decora/user/cartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constant_color.dart';

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

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
            "CLOCK",
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: ScrollPhysics(),
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 260
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 50,

                        decoration: BoxDecoration(
                            gradient: containerGradient,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage("assets/lamp7.jpg"),
                                        fit: BoxFit.fill
                                    )

                                ),

                              ),
                              SizedBox(height: 10,),
                              Text("Clock",style: TextStyle(color: Colors.white,fontFamily: "philosopher",fontSize: 15),),
                              Text("₹ 999",style: TextStyle(color: Colors.white,fontFamily: "mukta",fontSize: 20),),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

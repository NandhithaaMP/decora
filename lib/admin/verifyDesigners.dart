import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifyDesignersScreen extends StatelessWidget {
  const VerifyDesignersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
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
            "ADD CATEGORY",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return  Container(
                    height: height/4.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: textColor,
                    ),margin: EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/PROFILE.jpg"),
                                radius: 45,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nithina",style: TextStyle(fontFamily: "philosopher",fontSize: 15),),
                                  Text("Interior Designer",style: TextStyle(fontFamily: "philosopher",fontSize: 15),),
                                  Text("Kozhikode",style: TextStyle(fontFamily: "philosopher",fontSize: 15),),
                                  Text("9876543210",style: TextStyle(fontFamily: "philosopher",fontSize: 15),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      // SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:70),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: height/18,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green,

                                ),child: Center(child: Text("Approve")),
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: Container(
                                height: height/18,


                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red,

                                ),
                                child: Center(child: Text("Reject")),
                              ),
                            )
                          ],
                        ),
                      ),


                      ],
                    ),
                  );
                },
        
              ),
            )
          ],
        ),
      ),
    );
  }

}


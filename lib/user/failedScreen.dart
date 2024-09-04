import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constant_color.dart';

class FailedScreen extends StatelessWidget {
  const FailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:green,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height:height/2.3 ,
              width: width/1.3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),

              ),
              child: Column(
                children: [
                  Container(
                    height: height/3.5,
                    width: width/1.2,
                    decoration: BoxDecoration(
                        color: cstText,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),

                      )
                    ),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: cstText,
                      // backgroundImage: AssetImage("assets/icons/pswdlock.png"),
                      child: Image.asset("assets/remove.png",scale: 6,),
                    ),

                  ),
                  SizedBox(height:height/18,),
                  Center(child: Text("Oh no , your payment \n            failed",style: TextStyle(fontFamily: "mukta"),)),
                //
                ],
              )

            ),
          )
        ],
      ),
    );
  }
}

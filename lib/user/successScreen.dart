import 'package:decora/constants/call_functions.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constant_color.dart';

class SuccessScreen extends StatelessWidget {
  String userID;
  SuccessScreen({super.key,required this.userID});

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
                        child: Image.asset("assets/success.png",scale: 5,),
                      ),

                    ),
                    SizedBox(height:height/18,),
                    Center(child: Text("Your payment was succeesfully \n                     completed",style: TextStyle(fontFamily: "mukta"),)),
                    //
                  ],
                )

            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {
            callNext(context, CartScreen(userId: userID,));
          }, child: Text("Done"))
        ],
      ),
    );
  }
}

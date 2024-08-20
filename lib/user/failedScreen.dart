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
              height:height/2 ,
              width: width/1.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Column(
                children: [
                  Container(
                    height: height/3.5,
                    width: width/1.2,
                    decoration: BoxDecoration(
                        color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),

                      )
                    ),

                  ),
                  SizedBox(height: 10,),
                  Text("The payment has been done successfully"),
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

import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
  backgroundColor: green,
      body:
      Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            children: [
              SizedBox(
                height: height,
                  child: Image.asset("assets/wall-designs-with-wood.webp",fit: BoxFit.contain,)),
              Container(
                height: height/1.4,
                width: width/2.5,
                child: Image.asset("assets/getStarted1.png",fit: BoxFit.cover,),
              )
            ],
          ),
        ],
      )
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constant_color.dart';

class UploadWorkScreen extends StatelessWidget {
  const UploadWorkScreen({super.key});

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
              "UPLOAD WORK",
              style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
            ),
            centerTitle: true,
          ),
        ),

        body: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(height: height/3.5,
              width: width,
                color: Colors.white70,
                child: Icon(Icons.upload),
              ),
            ),
            Container(
              height: height/15,
              width: width/3,
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.circular(15)
            ),
              child: Center(child: Text("Save")),
            )
          ],
        ),


      );

  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constant_color.dart';

class DesignerProfile extends StatelessWidget {
  const DesignerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
     body: Column(
       children: [
         CircleAvatar(
           radius: 80,
         ),
         TextField(
           decoration: InputDecoration(
             label: Text("Name",style: TextStyle(fontFamily: "philosopher",fontSize: 15),),

           ),
         ),
         TextField(
           decoration: InputDecoration(
             label: Text("Designation",style: TextStyle(fontFamily: "philosopher",fontSize: 15),),

           ),
         ),
         TextField(
           decoration: InputDecoration(
             label: Text("Place",style: TextStyle(fontFamily: "philosopher",fontSize: 15),),

           ),
         ),
       ],
     ),
    );
  }
}

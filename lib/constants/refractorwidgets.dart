import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget btn (double height,double width,Color mycolor,double radius ){
  return Container(
    height:height ,
    width:width ,
    decoration: BoxDecoration(
      color: mycolor,borderRadius: BorderRadius.circular(radius)
    ),
  );
}
// Widget registerField(double Cradius ,String prefixIcon,String suffixIcon,double piconscale,double siconscale,double radius,double Fradius,double Eradius){
//   return Container(
//     decoration: BoxDecoration(
//       color: gradientgreen,
//       borderRadius: BorderRadius.circular(Cradius)
//     ),
//     child: TextFormField(
//
//       decoration: InputDecoration(
//         prefixIcon: Image.asset(prefixIcon,scale: piconscale,),
//         suffixIcon: Image.asset(suffixIcon,scale: siconscale,),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(radius)
//         ),
//
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(Fradius)
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.circular(Eradius)
//         )
//       ),
//     ),
//   );
// }
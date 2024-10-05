import 'package:decora/admin/addCategoryScreen.dart';
import 'package:decora/admin/addProductScreen.dart';
import 'package:decora/admin/productScreen.dart';
import 'package:decora/admin/verifyDesigners.dart';
import 'package:decora/admin/viewOrderScreen.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/mainProvider.dart';
import 'adminProfileScreen.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    List<String> homeGrid=[
      "Categories",
      "Products",
      "View \nOrders",
      "Verify \nDesigners",
    ];
    return  Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Welcome Nandhitha,",style: TextStyle(color: textColor,fontFamily: "philosopher"),),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminProfileScreen(),));
            },
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/PROFILE.jpg"),
            ),
          ),

          SizedBox(width: 10,)
        ],


      ),
      body:

      SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: screenGradient
          ),
          child:
          Column(
            children: [


              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GridView.builder(
                      itemCount: 4,
                        shrinkWrap: true,
                        physics:NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 150

                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                                // value.getCategory();
                              switch(index){
                                case 0:

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddCategoryScreen(),));
                                  break;
                                case 1:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(),));
                                  break;
                                case 2:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewOrderScreen(),));
                                  break;
                                case 3:
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyDesignersScreen(),));
                                  break;
                              }
                            },
                            child: Container(
                              height: 80,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: cstText,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                                    spreadRadius: 6,  // How much the shadow spreads
                                    blurRadius: 15,   // The softness of the shadow
                                    offset: Offset(0, 5), // Horizontal and vertical offset of the shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  homeGrid[index],
                                  style: TextStyle(
                                    fontFamily: "philosopher",
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )

                          );
                        },
                    );
                  }
                ),
              )
            ],
          ),

        ),
      )
    );
  }
}
// import 'package:decora/admin/addCategoryScreen.dart';
// import 'package:decora/admin/addProductScreen.dart';
// import 'package:decora/admin/verifyDesigners.dart';
// import 'package:decora/admin/viewOrderScreen.dart';
// import 'package:decora/constants/constant_color.dart';
// import 'package:decora/provider/mainProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
//
// import 'adminProfileScreen.dart';
//
// class AdminHomeScreen extends StatelessWidget {
//   const AdminHomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<String> homeGrid = [
//       "Add \nCategory",
//       "Add \nProduct",
//       "View \nOrders",
//       "Verify \nDesigners",
//     ];
//
//     // List of destination screens
//     List<Widget> screens = [
//       AddCategoryScreen(),
//       Consumer<MainProvider>(
//         builder: (context,value,child) {
//           return InkWell(
//             onTap: () {
//               value.getCategory();
//             },
//               child: AddProductScreen());
//         }
//       ),
//       ViewOrderScreen(),
//       VerifyDesignersScreen(),
//     ];
//
//     return Scaffold(
//       backgroundColor: green,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text(
//           "Welcome Nandhitha,",
//           style: TextStyle(
//             color: textColor,
//           ),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AdminProfileScreen(),
//                 ),
//               );
//             },
//             child: CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage("assets/PROFILE.jpg"),
//             ),
//           ),
//           SizedBox(width: 10,),
//         ],
//       ),
//       body: SizedBox.expand(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: screenGradient,
//           ),
//           child: Column(
//             children: [
//               SizedBox(height: 20,),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: GridView.builder(
//                   itemCount: homeGrid.length,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 20,
//                     mainAxisSpacing: 20,
//                     mainAxisExtent: 150,
//                   ),
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => screens[index],
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: 80,
//                         width: 30,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: cstText,
//                         ),
//                         child: Center(
//                           child: Text(
//                             homeGrid[index],
//                             style: TextStyle(
//                               fontFamily: "philosopher",
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

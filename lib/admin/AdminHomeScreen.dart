import 'package:decora/admin/addCategoryScreen.dart';
import 'package:decora/admin/addProductScreen.dart';
import 'package:decora/admin/productScreen.dart';
import 'package:decora/admin/verifyDesigners.dart';
import 'package:decora/admin/viewOrderScreen.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Designer/editDprofile.dart';
import '../provider/mainProvider.dart';


class AdminHomeScreen extends StatelessWidget {
  String userId;
  AdminHomeScreen( {super.key,
  required this.userId
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> homeGrid=[
      "Categories",
      "Products",
      "View \nOrders",
      "Verify \nDesigners",
    ];
    List<Widget> screens=[
      AddCategoryScreen(),
      ProductScreen(),
      ViewOrderScreen(),
      Consumer<MainProvider>(
        builder: (contex,dValue,child) {
          dValue.getDesigners();
          return VerifyDesignersScreen();
        }
      )
    ];
    return  Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Consumer<LoginProvider>(
          builder: (context,logvalue,child) {
            return Text("Welcome ${logvalue.loginName},",style: TextStyle(color: textColor,fontFamily: "philosopher"),);
          }
        ),
        // actions: [
        //
        //   // Icon(Icons.more_vert,color: cstText,),
        //   // GestureDetector(
        //   //   onTap: () {
        //   //     Navigator.push(context, MaterialPageRoute(builder: (context) => AdminProfileScreen(user_id: '',),));
        //   //   },
        //   //   child: CircleAvatar(
        //   //     radius: 30,
        //   //     backgroundImage: AssetImage("assets/PROFILE.jpg"),
        //   //   ),
        //   // ),
        //
        //   SizedBox(width: 10,)
        // ],
        actions: [
          Consumer<MainProvider>(
            builder: (context, Pvalue, child) {
              return PopupMenuButton<String>(
                icon: Icon(Icons.more_vert, color:cstyellow), // Set your icon color here
                onSelected: (value) {
                  if (value == 'Account') {
                    // Navigate to the Account Screen
                    Pvalue.editUsers(userId);
                    callNext(context, EditDProfile(user_id: userId,));
                  } else if (value == 'Sign Out') {
                    Pvalue.logOutAlert(context);
                  }
                },
                itemBuilder: (BuildContext context) {
                  return {'Account', 'Sign Out'}.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              );
            },
          ),
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
                              callNext(context, screens[index]);
                            },
                            child:
                            Container(
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
              ),


            ],
          ),

        ),
      )
    );
  }
}


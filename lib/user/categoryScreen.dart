import 'package:decora/constants/call_functions.dart';
import 'package:decora/user/categoryDetailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';

class CategoryScreen extends StatelessWidget {
  String userId;
   CategoryScreen({super.key,required this.userId});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
      return Scaffold(
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
            "CATEGORY",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient:screenGradient

          ),
          child:  SingleChildScrollView(
            child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: GridView.builder(
                      itemCount: value.categoryList.length,
                      shrinkWrap: true,
                      physics:NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: 150

                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            callNext(context, CategoryDetailsScreen( categoryTitle: value.categoryList[index].categoryName, userId: userId,));
                          },
                          child: Container(
                            height: height/10,
                            width: width/10,
                            // height: 80,
                            // width: 30,
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
                              child: Text(value.categoryList[index].categoryName,style: TextStyle(fontFamily: "philosopher",fontSize: 20,),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}

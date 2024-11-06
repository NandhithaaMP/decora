import 'package:decora/constants/call_functions.dart';
import 'package:decora/user/buyNowScreen.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';

class WishListScreen extends StatelessWidget {
  String userId;
  WishListScreen({super.key,required this.userId});

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
            "WISHLIST",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child:
                  Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: value.wishList.length,
                            physics: ScrollPhysics(),
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5,
                                mainAxisExtent: 250
                            ),
                            itemBuilder: (context, index) {

                              final cdproduct=value.wishList[index];
                              return Container(
                                height: 100,
                                width: 50,

                                decoration: BoxDecoration(
                                    gradient: containerGradient,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: height/6,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: NetworkImage(cdproduct.productImage),
                                                fit: BoxFit.fill
                                            )

                                        ),

                                      ),
                                      SizedBox(height: 10,),
                                      Text(cdproduct.productName,style: TextStyle(color: Colors.white,fontFamily: "philosopher",fontSize: 15),),
                                      Text(cdproduct.price.toString(),style: TextStyle(color: Colors.white,fontFamily: "mukta",fontSize: 20),),
                                      Consumer<MainProvider>(
                                        builder: (context,cartvalue,child) {
                                          return GestureDetector(
                                            onTap: () {
                                              cartvalue.addToCart(userId, cdproduct.pid, cdproduct.productImage, cdproduct.price.toString(), cdproduct.productName);
                                            },
                                            child: Container(
                                              height: height/15,
                                              width: width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                color: Colors.grey
                                              ),
                                              child: Center(child: Text("Add to cart")),
                                            ),
                                          );
                                        }
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                      }
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}




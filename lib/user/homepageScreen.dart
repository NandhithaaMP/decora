import 'package:decora/user/connectDesigners.dart';
import 'package:decora/user/designerProfile.dart';
import 'package:decora/user/profileScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../models/adminModel.dart';
import '../provider/mainProvider.dart';
import 'buyNowScreen.dart';
import 'cartScreen.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    List<String> recommendation=[
      "assets/lamp1.jpg",
      "assets/lamp2.jpg",
      "assets/lamp3.jpg",
      "assets/lamp4.jpg",
      "assets/lamp5.jpg",
      "assets/lamp6.jpg",
      "assets/lamp7.jpg",
      "assets/lamp8.jpg",
      "assets/lamp9.jpg",
      "assets/lamp10.jpg",

    ];
    List<String> name=[
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
    ];
    List<String> price=[
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
        ];
    return Container(
      decoration: BoxDecoration(
        gradient: maingradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("DECORA",style: TextStyle(fontFamily: "tradeWinds",fontSize: 25,color: textColor),),

          centerTitle: true,
      leading: Builder(

      builder: (BuildContext context) {
            return IconButton(
              icon:  Image.asset("assets/icons/more-app.png",scale: 20,),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        ),

        drawer: Drawer(
          backgroundColor: cstgreen,
          child: ListView(
            children: [

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFCBB480),
                      Color(0xff16403B),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide.none,
                    ),
                    color: Colors.transparent, // Make the background transparent
                  ),

                  accountName: Text(
                    "Nandhitha",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "muktaregular",
                      fontSize: 20,
                    ),
                  ),
                  accountEmail: Text(
                    "nandhithampnandhu@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "muktaregular",
                      fontSize: 16,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/profile-thin.png"),
                    backgroundColor: cstgreen,
                  ),
                ),
              ),
              // Container(color: Colors.red,height: 5,),
              ListTile(
                leading: Image.asset("assets/icons/profile-thin.png", scale: 15),
                title: Text(
                  "PROFILE",
                  style: TextStyle(
                    fontFamily: "philosopher",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                  )
                  );
                },
              ),
              ListTile(
                leading: Image.asset("assets/icons/arcticons_connect.png", scale: 20),
                title: Text(
                  "CONNECT WITH DESIGNERS",
                  style: TextStyle(
                    fontFamily: "philosopher",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder:(context) => ConnectDesigners(),
                  )
                  );
                },
              ),
              ListTile(
                leading: Image.asset("assets/icons/signout.png", scale: 5),
                title: Text(
                  "SIGN OUT",
                  style: TextStyle(
                    fontFamily: "philosopher",
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column (
            children: [
              Container(
                decoration: BoxDecoration(
                  // gradient: maingradient
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8,8,8,0),
                      child: Container(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("HOME",style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: cstText),),
                            Text("DECORE",style: TextStyle(fontFamily: "mochiy",fontSize: 20,color: cstText),),
                            Text("COLLECTIONS",style: TextStyle(fontFamily: "monoton",fontSize: 20,color: cstText),),
                            SizedBox(height: 5,),
                            Container(
                              height: height/15,
                              width: width,
                              decoration: BoxDecoration(
                                  gradient: cstgradient,
                                  borderRadius: BorderRadius.circular(10)

                              ),
                              child:TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: "Search here",
                                  
                                ),
                              )
                              // Row(mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //
                              //     SizedBox(width: 10,),
                              //     Image.asset("assets/icons/search.png",scale: 22,),
                              //     SizedBox(width: 10,),
                              //     Text("Search here",style: TextStyle(color: Color(0xff10283A),fontFamily: "muktaregular",fontSize: 15),)
                              //   ],
                              // ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),

                    Container(
                      height: height/3,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/living_room.webp"),
                          fit: BoxFit.fill
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            InkWell(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => DesignerProfile(),));
                              },
                                child: Image.asset("assets/icons/profile.png",scale: 4,)),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mahesh Gupta",style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: "philosopher",fontWeight: FontWeight.bold),),
                                Text("Thechipparambu",style: TextStyle(color: Colors.white,fontSize: 11,fontFamily: "philosopher",fontWeight: FontWeight.bold),),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Column(mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 120),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/icons/like.png",scale: 5,),
                                        SizedBox(width: 10,),
                                        Image.asset("assets/icons/message.png",scale: 6,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),

                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 10),
                      child: Text("Recommended for you",style: TextStyle(color: Colors.white,fontFamily: "bakbak",fontSize: 18),),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // height: height,
                        width: width,
                        decoration: BoxDecoration(
                         gradient: LinearGradient(colors: [
                           Color(0xff16403B),
                           Color(0xff807646),
                         ],
                           begin: Alignment.topCenter,
                           end: Alignment.bottomCenter
                         ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 1),
                          child:
                          Consumer<MainProvider>(
                            builder: (context,value,child) {
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: value.productList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 12,
                                  mainAxisExtent: 300,
                                ),
                                itemBuilder: (context, index) {
                                  final product = value.productList[index];
                                  return InkWell(
                                    onTap: () {
                                      print("Product tapped: ${product.productName}");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BuyNowScreen(
                                            productName: product.productName,
                                            productImage: product.productImage,
                                            productPrice: product.price,
                                          ),
                                        ),
                                      );
                                    },
                                    // onTap: () {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => BuyNowScreen(
                                    //         productName: product.productName,
                                    //         productImage: product.productImage,
                                    //         productPrice: product.price,
                                    //       ),
                                    //     ),
                                    //   );
                                    // },
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Container(
                                        height: 230,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          image: DecorationImage(
                                            image: NetworkImage(product.productImage),
                                            fit: BoxFit.fill,
                                          ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                      Text(product.productName, style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "philosopher")),
                                      Text(product.price, style: TextStyle(color: Colors.white, fontSize: 25, fontFamily: "bakbak")),
                                    ]),
                                  );
                                },
                              );

                              //   GridView.builder(
                              //   padding: EdgeInsets.zero,
                              //   itemCount: value.productList.length,
                              //     shrinkWrap: true,
                              //     // scrollDirection:
                              //   physics : NeverScrollableScrollPhysics(),
                              //     gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                              //       crossAxisCount: 2,
                              //       mainAxisSpacing: 5,
                              //       crossAxisSpacing: 12,
                              //         mainAxisExtent: 300,
                              //        // mainAxisExtent: 350,
                              //       // childAspectRatio: 1
                              //     ),
                              //     itemBuilder: (context, index) {
                              //       return Column(crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: [
                              //           Consumer<MainProvider>(
                              //             builder: (context,value,child) {
                              //               return Container(
                              //                  height: 230,
                              //                 // width: 10,
                              //                 decoration: BoxDecoration(
                              //                   color: Colors.blue,
                              //                   image: DecorationImage(
                              //                     image: NetworkImage(value.productList[index].productImage),
                              //                     fit: BoxFit.fill
                              //                   ),
                              //                   borderRadius: BorderRadius.circular(15)
                              //                 ),
                              //
                              //               );
                              //             }
                              //           ),
                              //           Text(value.productList[index].productName,style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "philosopher",),),
                              //           Text(value.productList[index].price,style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "bakbak",)),
                              //         ],
                              //       );
                              //
                              //     },
                              //
                              // );
                            }
                          ),
                        ),
                      ),
                    ),
                    // Text("data")


                  ],
                ),
              ),

            ],

          ),
        ),
        bottomNavigationBar: Container(
            height: 65,
            width: 350,
            color: green,

            child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 70,top: 10),
                  child: InkWell(onTap:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomePage(),));
                  },
                    child: Column(
                      children: [
                        Icon(Icons.home,color:Colors.white,),
                        Text("Home",style: TextStyle(
                            color: Colors.white,fontFamily: "allerta"
                        ),),
                      ],
                    ),
                  ),
                ),

                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WishList(),));
                },
                  child: Padding(
                    padding: const EdgeInsets.only(right:80,top: 10),
                    child: Column(
                      children: [
                        Image.asset("assets/icons/like.png",scale: 7,color:  textColor,),
                        // Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                        Text("Wish",style: TextStyle(
                            color:  textColor,fontFamily: "allerta"
                        ),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  CartScreen(),));
                  },
                    child: Column(
                      children: [
                        Icon(Icons.shopping_cart_outlined,color:  textColor,),
                        Text("Cart",style: TextStyle(
                            color:  textColor,fontFamily: "allerta"
                        ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}

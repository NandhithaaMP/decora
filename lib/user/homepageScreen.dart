import 'package:carousel_slider/carousel_slider.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/models/adminModel.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/user/connectDesigners.dart';
import 'package:decora/user/designerProfile.dart';
import 'package:decora/user/myOrderScreen.dart';
import 'package:decora/user/profileScreen.dart';
import 'package:decora/user/verifypwdScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../constants/constant_color.dart';

import '../provider/mainProvider.dart';
import 'buyNowScreen.dart';
import 'cartScreen.dart';
import 'categoryScreen.dart';
import 'package:decora/user/wishListScreen.dart';


class UserHomePage extends StatefulWidget {


  String user_Name,phone_Number,pass_word,place_,address_,userId;
  UserHomePage({super.key,
    required this.user_Name,required this.phone_Number,required this.pass_word,required this.place_,required this.address_,required this.userId

  });

  @override


  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int activeIndex=0;
  void carouselIndex(int index){
    setState(() {
      activeIndex=index;

    });
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

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

        drawer: Consumer<LoginProvider>(
          builder: (context,valueDrawer,child) {
            return Drawer(
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
                        // "Nandhitha",
                        valueDrawer.loginName,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "muktaregular",
                          fontSize: 20,
                        ),
                      ),
                      accountEmail: Text(
                        valueDrawer.loginPhoneNumber,
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
                    leading: Icon(Icons.account_circle_outlined,color: cstText,),
                    // Image.asset("assets/icons/profile-thin.png", scale: 15),
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
                          builder: (context) => ProfileScreen(user_Name: widget.user_Name, phone_Number: widget.phone_Number, pass_word: widget.pass_word, place_: widget.place_, address_: widget.address_,),
                      )
                      );
                    },
                  ),
                  ListTile(
                    leading:Icon(Icons.favorite_border,color: cstText,),
                    // Image.asset("assets/icons/profile-thin.png", scale: 15),
                    title: Text(
                      "WISHLIST",
                      style: TextStyle(
                        fontFamily: "philosopher",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      callNext(context, WishListScreen());
                      },
                  ),
                  ListTile(
                    leading:Icon(Icons.card_giftcard,color: cstText,),
                    // Image.asset("assets/icons/profile-thin.png", scale: 15),
                    title: Text(
                      "MY ORDERS",
                      style: TextStyle(
                        fontFamily: "philosopher",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyOrder(),
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
            );
          }
        ),
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return Column (
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

                                ),


                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                        CarouselSlider.builder(
                          itemCount:value.workList.length,
                          // value.workList.isNotEmpty?value.workList.first.workImage.length:0,
                          itemBuilder: (context, index, realIndex) {
                            return  Container(
                              height: height/3,
                              width: width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        value.workList[index].workImage
                                          // value.workList.isNotEmpty?value.workList.first.workImage[index]:""
                                          ),
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

                            );
                          }, options: CarouselOptions(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: MediaQuery.of(context).size.height / 2.5,
                            viewportFraction: 1,
                            autoPlay: true,
                            pageSnapping: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            enlargeCenterPage: true,
                            autoPlayInterval: const Duration(seconds: 6),
                            onPageChanged: (index, reason) {
                              value.carouselIndex(index);
                            }),

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
                                  return
                                    GridView.builder(
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
                                              builder: (context) => BuyNowScreen(item: product, userId: widget.userId,),
                                            ),
                                          );
                                        },

                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Container(
                                            height: 230,
                                            decoration: BoxDecoration(
                                              color: cstgreen,
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

              );
            }
          ),
        ),
        // bottomNavigationBar: Container(
        //     height: 65,
        //     width: 350,
        //     color: green,
        //
        //     child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(right: 70,top: 10),
        //           child: InkWell(onTap:  () {
        //             Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomePage(
        //               // userId: '',
        //             ),));
        //           },
        //             child: Column(
        //               children: [
        //                 Icon(Icons.home,color:Colors.white,),
        //                 Text("Home",style: TextStyle(
        //                     color: Colors.white,fontFamily: "allerta"
        //                 ),),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //         InkWell(onTap: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (context) => WishList(),));
        //         },
        //           child: Padding(
        //             padding: const EdgeInsets.only(right:80,top: 10),
        //             child: Column(
        //               children: [
        //                 Image.asset("assets/icons/like.png",scale: 7,color:  textColor,),
        //                 // Icon(Icons.shopping_cart_outlined,color: Colors.white,),
        //                 Text("Wish",style: TextStyle(
        //                     color:  textColor,fontFamily: "allerta"
        //                 ),),
        //               ],
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(top:10),
        //           child: InkWell(onTap: () {
        //             Navigator.push(context, MaterialPageRoute(builder: (context) =>  CartScreen(),));
        //           },
        //             child: Column(
        //               children: [
        //                 Icon(Icons.shopping_cart_outlined,color:  textColor,),
        //                 Text("Cart",style: TextStyle(
        //                     color:  textColor,fontFamily: "allerta"
        //                 ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //
        //       ],
        //     )
        // ),
      ),
    );
  }
}

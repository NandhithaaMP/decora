import 'package:carousel_slider/carousel_slider.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/models/adminModel.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/user/connectDesigners.dart';

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
import 'accountScreen.dart';
import 'buyNowScreen.dart';
import 'cartScreen.dart';
import 'categoryScreen.dart';
import 'package:decora/user/wishListScreen.dart';

import 'designerProfile.dart';

class UserHomePage extends StatefulWidget {
  String user_Name, phone_Number, pass_word, place_, address_, userId;
  UserHomePage(
      {super.key,
      required this.user_Name,
      required this.phone_Number,
      required this.pass_word,
      required this.place_,
      required this.address_,
      required this.userId});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int activeIndex = 0;
  void carouselIndex(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
          title: Text(
            "DECORA",
            style: TextStyle(
                fontFamily: "tradeWinds", fontSize: 25, color: textColor),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(
                  "assets/icons/more-app.png",
                  scale: 20,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),

        drawer: Consumer<LoginProvider>(builder: (context, valueDrawer, child) {
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
                      color:
                          Colors.transparent, // Make the background transparent
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

          backgroundImage: NetworkImage(valueDrawer.loginPhoto),
                      backgroundColor: cstgreen,
                    ),
                  ),
                ),
                // Container(color: Colors.red,height: 5,),
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: cstText,
                  ),
                  // Image.asset("assets/icons/profile-thin.png", scale: 15),
                  title: Text(
                    "ACCOUNT",
                    style: TextStyle(
                      fontFamily: "philosopher",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    callNext(
                        context,
                        AccountScreen(
                          user_Name: widget.user_Name,
                          phone_Number: widget.phone_Number,
                          pass_word: widget.pass_word,
                          place_: widget.place_,
                          address_: widget.address_,
                          userId: widget.userId,
                          from: '',
                          oldid: "EDIT",
                        ));
                  },
                ),

                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    value.getDesigners();
                    return ListTile(
                      leading: Image.asset("assets/icons/arcticons_connect.png",
                          scale: 20),
                      title: Text(
                        "CONNECT WITH DESIGNERS",
                        style: TextStyle(
                          fontFamily: "philosopher",
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConnectDesigners(login_ID: widget.userId, usname: widget.user_Name, usphone: widget.phone_Number, usphoto: "PHOTO",),
                            ));
                      },
                    );
                  }
                ),
                Consumer<MainProvider>(
                  builder: (context,valu,child) {
                    return GestureDetector(
                      onTap: () {
                        valu.logOutAlert(context);
                      },
                      child: ListTile(
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
                    );
                  }
                ),
              ],
            ),
          );
        }),
        body: SingleChildScrollView(
          child: Consumer<MainProvider>(builder: (context, value, child) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // gradient: maingradient
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "HOME",
                                style: TextStyle(
                                    fontFamily: "philosopher",
                                    fontSize: 20,
                                    color: cstText),
                              ),
                              Text(
                                "DECORE",
                                style: TextStyle(
                                    fontFamily: "mochiy",
                                    fontSize: 20,
                                    color: cstText),
                              ),
                              Text(
                                "COLLECTIONS",
                                style: TextStyle(
                                    fontFamily: "monoton",
                                    fontSize: 20,
                                    color: cstText),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  height: height / 15,
                                  width: width,
                                  decoration: BoxDecoration(
                                      gradient: cstgradient,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(child: Text("Decorate your home with love and warmth.",style: TextStyle(fontFamily: "philosopher",color: cstgreen),)),
                                  // child: TextField(
                                  //   decoration: InputDecoration(
                                  //     prefixIcon: Icon(Icons.search),
                                  //     hintText: "Search category here",
                                  //   ),
                                  // )
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      CarouselSlider.builder(
                        itemCount: value.allAddedWorkList.length,
                        itemBuilder: (context, index, realIndex) {
                          var item = value.allAddedWorkList[index];
                          bool isSelected = index == realIndex; // Check if the current index is selected
                          return Container(
                            height: height / 3,
                            width: width,
                            // margin: EdgeInsets.symmetric(horizontal: 8.0), // Add margin for gap
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(item.workImage),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15), // Rounded corners
                              border: isSelected ? Border.all(color: Colors.blueAccent, width: 4) : null, // Border for selected slide
                              boxShadow: [
                                BoxShadow(
                                  color: isSelected ? Colors.black.withOpacity(0.6) : Colors.transparent, // Darker shadow for selected
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: Offset(0, 4), // Shadow position
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0), // More padding for a spacious look
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      value.getDesignerDetails(item.designerId);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DesignerProfile(login_ID: widget.userId, designerId: item.designerId, usname: widget.user_Name, usphone: widget.phone_Number, usphoto: "PHOTO", receiver_name: item.designerName,),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: item.designerId, // Hero animation for smoother transitions
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(item.designerPhoto),
                                        radius: 30, // Larger avatar for better visibility
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12), // Space between avatar and text
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.designerName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: "philosopher",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          item.designerPlace,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14,
                                            fontFamily: "philosopher",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          height: MediaQuery.of(context).size.height / 2.5,
                          viewportFraction: 0.71, // Creates a gap between slides
                          autoPlay: true,
                          pageSnapping: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale, // Scale for highlighting
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800), // Smooth transition
                          onPageChanged: (index, reason) {
                            value.carouselIndex(index);
                          },
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10),
                        child: Text(
                          "Recommended for you",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "bakbak",
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: height,
                          width: width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xff16403B),
                                    Color(0xff807646),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 1),
                            child: Consumer<MainProvider>(
                                builder: (context, value, child) {
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: value.productList.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 12,
                                  mainAxisExtent: 300,
                                ),
                                itemBuilder: (context, index) {
                                  final product = value.productList[index];
                                  return InkWell(
                                    onTap: () {
                                      print(
                                          "Product tapped: ${product.productName}");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BuyNowScreen(

                                            item: product,
                                            userId: widget.userId,
                                            userAddress:widget.address_,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 230,
                                            decoration: BoxDecoration(
                                              color: cstgreen,
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    product.productImage),
                                                fit: BoxFit.fill,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          Text(product.productName,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: "philosopher")),
                                          Text(product.price.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontFamily: "bakbak")),
                                        ]),
                                  );
                                },
                              );
                            }),
                          ),
                        ),
                      ),
                      // Text("data")
                    ],
                  ),
                ),
              ],
            );
          }),
        ),

        //       ],
        //     )
        // ),
      ),
    );
  }
}

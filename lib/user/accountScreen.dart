
import 'package:decora/constants/call_functions.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/myOrderScreen.dart';
import 'package:decora/user/profileScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Designer/editDprofile.dart';
import '../constants/constant_color.dart';

class AccountScreen extends StatefulWidget {
  String user_Name,phone_Number,pass_word,place_,address_;
  String userId;
  String from,oldid;
  AccountScreen({super.key,

    required this.user_Name,required this.phone_Number,required this.pass_word,required this.place_,required this.address_,required this.userId,
    required this .from,required this.oldid

  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

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
            "ACCOUNT",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child:
            Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: height/25,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return Row(
                              children: [
                                Expanded(
                                  child:
                                  GestureDetector(
                                    onTap: () {
                                      value.getBuyNow(widget.userId);
                                      value.getOrder(widget.userId);
                                      callNext(context, MyOrder());
                                    },
                                    child: Container(
                                      height: height/12,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xff807646),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                                            spreadRadius: 6,  // How much the shadow spreads
                                            blurRadius: 15,   // The softness of the shadow
                                            offset: Offset(0, 5), // Horizontal and vertical offset of the shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.card_giftcard,color: Colors.white,),
                                          Text(
                                            "MY ORDERS",
                                            style: TextStyle(
                                              fontFamily: "philosopher",
                                              fontSize: 16,
                                              color:Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  )
                                ),
                                SizedBox(width: 10,),
                                Expanded(
                                    child:
                                    GestureDetector(
                                      onTap: () {
                                        value.getFavorite(widget.userId);
                                        callNext(context, WishListScreen(userId: widget.userId,));
                                      },
                                      child: Container(
                                        height: height/12,
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
                                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.favorite_border,color: cstgreen,),
                                            Text(
                                              "WISHLIST",
                                              style: TextStyle(
                                                fontFamily: "philosopher",
                                                fontSize: 16,
                                                color:cstgreen,
                                              ),
                                            ),
                                          ],
                                        ),

                                      ),
                                    )
                                ),
                              ],
                            );
                          }
                        ),
                      ),
                      SizedBox(height: 15,),

                      Divider(
                        color: cstgreen, // Color of the line
                        thickness: 2, // Thickness of the line
                      ),
                      Text("Account Settings",style: TextStyle(color: Colors.white,fontFamily: "bakbak",fontSize: 18),),
                      Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return GestureDetector(
                            onTap: () {
                              value.editUsers(widget.userId);
                              callNext(context, EditDProfile(user_id: widget.userId,));
                              // callNext(context, ProfileScreen(user_Name: widget.user_Name, phone_Number: widget.phone_Number, pass_word: widget.pass_word, place_: widget.place_, address_: widget.address_, user_id: widget.userId,));
                            },
                            child: ListTile(
                              leading: Icon(Icons.account_circle_outlined,color: Colors.white,),
                              title: Text("Edit Profile",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: Colors.white),),
                              trailing: Icon(Icons.navigate_next,color: Colors.white,),
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 1,),
                      ListTile(
                        leading: Icon(Icons.location_on_outlined,color: Colors.white,),
                        title: Text("Saved Address",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: Colors.white),),
                        trailing: Icon(Icons.navigate_next,color: Colors.white,),
                      ),




                    ],
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}


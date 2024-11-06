import 'package:decora/Designer/chatBoxScreen.dart';
import 'package:decora/Designer/uploadWorkScreen.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../constants/constant_color.dart';
import 'designerProfileScreen.dart';

class NewEnquiryScreen extends StatelessWidget {
  String userId,name,phone;
  NewEnquiryScreen({super.key,required this.userId,required this.name,required this.phone});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
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
            "ENQUIRY",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      drawer: Consumer<LoginProvider>(
        builder: (context,dValue,child) {
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
                      dValue.loginName,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "muktaregular",
                        fontSize: 20,
                      ),
                    ),
                    accountEmail: Text(
                      dValue.loginPhoneNumber,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "muktaregular",
                        fontSize: 16,
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(dValue.loginPhoto),
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
                      builder: (context) => DesignerProfileScreen(userId: '',),
                    )
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.upload,color: textColor,),
                  title: Text(
                    "UPLOAD WORK",
                    style: TextStyle(
                      fontFamily: "philosopher",
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder:(context) => UploadWorkScreen(designerId: userId,),
                    )
                    );
                  },
                ),
                Consumer<MainProvider>(
                  builder: (context,val,child) {
                    return GestureDetector(
                      onTap: () {
                        val.logOutAlert(context);
                      },
                      child: ListTile(
                        leading: Image.asset("assets/icons/signout.png", scale: 5),
                        title: Text(
                          "SIGN OUT ",
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
        }
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      callNext(context, ChatScreen(userId: userId, name: '', phone: '',));
                    },
                    child: Container(
                      height: height / 9.5,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textColor,
                      ),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/PROFILE.jpg"),
                              radius: 25,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Nithina",
                                        style: TextStyle(
                                          fontFamily: "philosopher",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0,right: 8),
                                        child: Text(
                                          "8.55 am",
                                          style: TextStyle(
                                            fontFamily: "philosopher",
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Hello",
                                    style: TextStyle(
                                      fontFamily: "philosopher",
                                      fontSize: 18,
                                      color: cstgreen,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )

            )
          ],
        ),
      ),

    );
  }

}

void _showAlertDialog(BuildContext context, String action) {
  showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure you want to $action?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              // Perform the approve or reject action here
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You selected to $action!')),
              );
            },
          ),
        ],
      );
    },
  );
}

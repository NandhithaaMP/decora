// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../constants/constant_color.dart';
// import '../provider/loginProvider.dart';
// import '../provider/mainProvider.dart'; // Ensure Provider is imported
//
// class NewEnquiryScreen extends StatelessWidget {
//   String userId, name, phone;
//   NewEnquiryScreen({super.key, required this.userId, required this.name, required this.phone});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: green,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor: Color(0xff16403B),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: cstgradient,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//           ),
//           title: Text(
//             "ENQUIRY",
//             style: TextStyle(fontFamily: "tradeWinds", fontSize: 20, color: Color(0xff16403B)),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       drawer: Consumer<LoginProvider>(
//         builder: (context, dValue, child) {
//           return Drawer(
//             backgroundColor: cstgreen,
//             child: ListView(
//               children: [
//                 // Drawer header and items here
//               ],
//             ),
//           );
//         },
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView.builder(
//                 itemCount: 2,
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   String designerId = userId; // Replace with your data
//                   String designerName = "Nithina";
//                   String designerPhone = "1234567890";
//                   String designerPhoto = "assets/PROFILE.jpg"; // Replace with actual photo URL
//
//                   return GestureDetector(
//                     onTap: () {
//                       // Access `MainProvider` and call `onDesignerSelected`
//                       Provider.of<MainProvider>(context, listen: false)
//                           .onDesignerSelected(context, designerId, designerName, designerPhone, designerPhoto);
//                     },
//                     child: Container(
//                       height: height / 9.5,
//                       width: width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: textColor,
//                       ),
//                       margin: EdgeInsets.only(bottom: 5),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CircleAvatar(
//                               backgroundImage: AssetImage(designerPhoto),
//                               radius: 25,
//                             ),
//                           ),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         designerName,
//                                         style: TextStyle(
//                                           fontFamily: "philosopher",
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(top: 8.0, right: 8),
//                                         child: Text(
//                                           "8.55 am",
//                                           style: TextStyle(
//                                             fontFamily: "philosopher",
//                                             fontSize: 13,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     "Hello",
//                                     style: TextStyle(
//                                       fontFamily: "philosopher",
//                                       fontSize: 18,
//                                       color: cstgreen,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void _showAlertDialog(BuildContext context, String action) {
//   showDialog(context: context, builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Confirmation"),
//         content: Text("Are you sure you want to $action?"),
//         actions: <Widget>[
//           TextButton(
//             child: Text("Cancel"),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: Text("Yes"),
//             onPressed: () {
//               // Perform the approve or reject action here
//               Navigator.of(context).pop();
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('You selected to $action!')),
//               );
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
// ---------------------------------------------------------------------------------------------------
import 'package:decora/Designer/chatBoxScreen.dart';
import 'package:decora/Designer/uploadWorkScreen.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/models/messages.dart';
import 'package:decora/provider/chatProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/loginProvider.dart';
import '../provider/mainProvider.dart';
import 'designerProfileScreen.dart'; // Ensure Provider is imported

class NewEnquiryScreen extends StatelessWidget {
  final String userId;
  final String name;
  final String phone;
  final String receiverId;
  final String photo;

  NewEnquiryScreen({
    super.key,
    required this.userId,
    required this.name,
    required this.phone,
    required this.receiverId,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Color(0xff16403B),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: cstgradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          title: Text(
            "ENQUIRY",
            style: TextStyle(
              fontFamily: "tradeWinds",
              fontSize: 20,
              color: Color(0xff16403B),
            ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<ChatProvider>(
                builder: (context, val, child) {
                  // Fetch messages only if the user is logged in and only once
                  if (FirebaseAuth.instance.currentUser != null) {
                    val.fetchRecentMessagesForDesigner(userId);
                  } else {
                    print(" user is not logged in");
                  }

                  return ListView.builder(
                    itemCount: val.userMessagesList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      MessageModel message = val.userMessagesList[index];

                      return GestureDetector(
                        onTap: () {
                          callNext(context, ChatScreen(login_Id: userId, receiver_Id: receiverId));
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
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(message.senderId == userId ? photo : "assets/PROFILE.jpg"),
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
                                            message.senderId == userId ? name : "USER",
                                            style: TextStyle(
                                              fontFamily: "philosopher",
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0, right: 8),
                                            child: Text(
                                              "${message.sentTime.hour}:${message.sentTime.minute}",
                                              style: TextStyle(
                                                fontFamily: "philosopher",
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        message.content,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class NewEnquiryScreen extends StatelessWidget {
//   String userId,
//       name,
//       phone,
//       receiverId,
//       photo
//   ;
//   NewEnquiryScreen({super.key, required this.userId, required this.name, required this.phone,required this.receiverId,required this.photo});
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: green,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor: Color(0xff16403B),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: cstgradient,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//           ),
//           title: Text(
//             "ENQUIRY",
//             style: TextStyle(fontFamily: "tradeWinds", fontSize: 20, color: Color(0xff16403B)),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       drawer: Consumer<LoginProvider>(
//           builder: (context,dValue,child) {
//             return Drawer(
//               backgroundColor: cstgreen,
//               child: ListView(
//                 children: [
//
//                   Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           Color(0xFFCBB480),
//                           Color(0xff16403B),
//                         ],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                       ),
//                     ),
//                     child: UserAccountsDrawerHeader(
//                       decoration: BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide.none,
//                         ),
//                         color: Colors.transparent, // Make the background transparent
//                       ),
//
//                       accountName: Text(
//                         dValue.loginName,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: "muktaregular",
//                           fontSize: 20,
//                         ),
//                       ),
//                       accountEmail: Text(
//                         dValue.loginPhoneNumber,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: "muktaregular",
//                           fontSize: 16,
//                         ),
//                       ),
//                       currentAccountPicture: CircleAvatar(
//                         backgroundImage: NetworkImage(dValue.loginPhoto),
//                         backgroundColor: cstgreen,
//                       ),
//                     ),
//                   ),
//                   // Container(color: Colors.red,height: 5,),
//                   ListTile(
//                     leading: Image.asset("assets/icons/profile-thin.png", scale: 15),
//                     title: Text(
//                       "PROFILE",
//                       style: TextStyle(
//                         fontFamily: "philosopher",
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(
//                         builder: (context) => DesignerProfileScreen(userId: '',),
//                       )
//                       );
//                     },
//                   ),
//                   ListTile(
//                     leading: Icon(Icons.upload,color: textColor,),
//                     title: Text(
//                       "UPLOAD WORK",
//                       style: TextStyle(
//                         fontFamily: "philosopher",
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(
//                         builder:(context) => UploadWorkScreen(designerId: userId,),
//                       )
//                       );
//                     },
//                   ),
//                   Consumer<MainProvider>(
//                       builder: (context,val,child) {
//                         return GestureDetector(
//                           onTap: () {
//                             val.logOutAlert(context);
//                           },
//                           child: ListTile(
//                             leading: Image.asset("assets/icons/signout.png", scale: 5),
//                             title: Text(
//                               "SIGN OUT ",
//                               style: TextStyle(
//                                 fontFamily: "philosopher",
//                                 fontSize: 16,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         );
//                       }
//                   ),
//                 ],
//               ),
//             );
//           }
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Consumer<LoginProvider>(
//                 builder: (context1,value1,child) {
//                   return Consumer<ChatProvider>(
//                     builder: (context,val,child) {
//                       if(FirebaseAuth.instance.currentUser!=null){
//                         val.fetchRecentMessagesForDesigner(receiverId);// Fetch messages only if there is a current user
//                       }
//                       else{
//                         print("_user_is_not_logged_in_-");
//                       }
//
//                       return ListView.builder(
//                         itemCount: val.userMessagesList.length,
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           Message message=val.userMessagesList[index];
//
//
//                           return GestureDetector(
//                             onTap: () {
//                               callNext(context, ChatScreen(login_Id: userId, receiver_Id: receiverId));
//                             },
//                             child: Container(
//                               height: height / 9.5,
//                               width: width,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: textColor,
//                               ),
//                               margin: EdgeInsets.only(bottom: 5),
//                               child: Row(
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: CircleAvatar(
//                                       backgroundImage: NetworkImage(message.senderId==userId?photo:"assets/PROFILE.jpg"),
//                                       radius: 25,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 10),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 message.senderId==userId?name:"USER",
//                                                 style: TextStyle(
//                                                   fontFamily: "philosopher",
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(top: 8.0, right: 8),
//                                                 child: Text(
//                                                   "${message.sentTime.hour}:${message.sentTime.minute}",
//                                                   style: TextStyle(
//                                                     fontFamily: "philosopher",
//                                                     fontSize: 13,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Text(
//                                             message.content,
//                                             style: TextStyle(
//                                               fontFamily: "philosopher",
//                                               fontSize: 18,
//                                               color: cstgreen,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }
//                   );
//                 }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



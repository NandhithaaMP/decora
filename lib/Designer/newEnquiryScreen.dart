

// --------------------------------------------------------ISt Running-------------------------------------------------------------------------------
// import 'package:decora/Designer/chatBoxScreen.dart';
// import 'package:decora/Designer/uploadWorkScreen.dart';
// import 'package:decora/constants/call_functions.dart';
// import 'package:decora/models/messages.dart';
// import 'package:decora/provider/chatProvider.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../constants/constant_color.dart';
// import '../provider/loginProvider.dart';
// import '../provider/mainProvider.dart';
// import 'designerProfileScreen.dart';
//
// class NewEnquiryScreen extends StatelessWidget {
//   final String userId;
//   final String name;
//   final String phone;
//   final String receiverId;
//   final String photo;
//
//   NewEnquiryScreen({
//     super.key,
//     required this.userId,
//     required this.name,
//     required this.phone,
//     required this.receiverId,
//     required this.photo,
//   });
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
//               gradient: cstgradient,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//             ),
//           ),
//           title: Text(
//             "ENQUIRY",
//             style: TextStyle(
//               fontFamily: "tradeWinds",
//               fontSize: 20,
//               color: Color(0xff16403B),
//             ),
//           ),
//           centerTitle: true,
//         ),
//       ),
//
//     drawer: Consumer<LoginProvider>(
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
//
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Consumer<ChatProvider>(
//                 builder: (context, val, child) {
//                   // // Fetch messages only if the user is logged in and only once
//                   // if (FirebaseAuth.instance.currentUser != null) {
//                   //   val.fetchRecentMessagesForDesigner(userId);
//                   // } else {
//                   //   print(" user is not logged in");
//                   // }
//
//                   return ListView.builder(
//                     itemCount: val.userMessagesList.length,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       MessageModel message = val.userMessagesList[index];
//
//                       return Consumer<LoginProvider>(
//                         builder: (context,val1,child1) {
//                           return GestureDetector(
//                             onTap: () {
//                               callNext(context, ChatScreen(login_Id: userId, receiver_Id: receiverId, uname: val1.loginName, uphone: val1.loginPhoneNumber, uphoto: val1.loginPhoto, receiver_name: 'receiver name',));
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
//                                       backgroundImage: NetworkImage(message.senderId == userId ? photo : "assets/PROFILE.jpg"),
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
//                                                 message.senderId == userId ? name : "USER",
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
//                         }
//                       );
//                     },
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
//
//
//

// --------------------------------------------------------2nd Running-------------------------------------------------------------------------------
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
import 'designerProfileScreen.dart';

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
          backgroundColor: const Color(0xff16403B),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: cstgradient,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          title: const Text(
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
        builder: (context, dValue, child) {
          return Drawer(
            backgroundColor: cstgreen,
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFCBB480),
                        const Color(0xff16403B),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide.none,
                      ),
                      color: Colors.transparent, // Make the background transparent
                    ),
                    accountName: Text(
                      dValue.loginName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "muktaregular",
                        fontSize: 20,
                      ),
                    ),
                    accountEmail: Text(
                      dValue.loginPhoneNumber,
                      style: const TextStyle(
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
                ListTile(
                  leading: Image.asset("assets/icons/profile-thin.png", scale: 15),
                  title: const Text(
                    "PROFILE",
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
                        builder: (context) => DesignerProfileScreen(
                          userId: '',
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.upload, color: textColor),
                  title: const Text(
                    "UPLOAD WORK",
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
                        builder: (context) => UploadWorkScreen(
                          designerId: userId,
                        ),
                      ),
                    );
                  },
                ),
                Consumer<MainProvider>(
                  builder: (context, val, child) {
                    return GestureDetector(
                      onTap: () {
                        val.logOutAlert(context);
                      },
                      child: ListTile(
                        leading: Image.asset("assets/icons/signout.png", scale: 5),
                        title: const Text(
                          "SIGN OUT ",
                          style: TextStyle(
                            fontFamily: "philosopher",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ChatProvider>(
            builder: (context, val, child) {
              return ListView.builder(
                itemCount: val.userMessagesForDList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  UserChatModel message = val.userMessagesForDList[index];

                  return GestureDetector(
                    onTap: () {
                      callNext(
                        context,
                        ChatScreen(
                          login_Id: userId,
                          receiver_Id: receiverId,
                          uname: name,
                          uphone: phone,
                          uphoto: photo ?? "",
                          receiver_name: message.userName,
                        ),
                      );
                    },
                    child: Container(
                      height: height / 9.5,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: textColor,
                      ),
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            CircleAvatar(
                              backgroundImage: photo != null && photo.isNotEmpty
                                  ? NetworkImage(photo) // Use NetworkImage for a valid URL
                                  : AssetImage("assets/PROFILE.jpg") as ImageProvider,
                              // backgroundImage: NetworkImage(photo ?? "assets/PROFILE.jpg",),
                              radius: 25,
                            ),
                          ),
                          // Expanded(
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 10),
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Row(
                          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Text(
                          //               message.userName,
                          //               style: const TextStyle(
                          //                 fontFamily: "philosopher",
                          //                 fontSize: 18,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ),
                          //             Padding(
                          //               padding: const EdgeInsets.only(top: 8.0, right: 8),
                          //               child: Text(
                          //                 "${message.lastMessage.sentTime.hour}:${message.lastMessage.sentTime.minute}",
                          //                 style: const TextStyle(
                          //                   fontFamily: "philosopher",
                          //                   fontSize: 13,
                          //                 ),
                          //               ),
                          //             ),
                          //
                          //           ],
                          //         ),
                          //         Text(
                          //           message.lastMessage.content,
                          //           style: const TextStyle(
                          //             fontFamily: "philosopher",
                          //             fontSize: 18,
                          //             color: cstgreen,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}




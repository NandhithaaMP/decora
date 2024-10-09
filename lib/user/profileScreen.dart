
import 'package:decora/provider/loginProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant_color.dart';

class ProfileScreen extends StatefulWidget {
  String user_Name,phone_Number,pass_word,place_,address_;
  ProfileScreen({super.key,
    required this.user_Name,required this.phone_Number,required this.pass_word,required this.place_,required this.address_

  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName="";
  String phoneNumber="";
  String place="";
  @override
  void initState(){
    super.initState();
    loadUserData();
  }
  Future<void> loadUserData() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      userName=prefs.getString("REGISTER_NAME")??"";

      phoneNumber=prefs.getString("REGISTER_PHONENUMBER")??"";
    });
  }
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
            "PROFILE",
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
                  return Column(
                    children: [
                      SizedBox(height: height/10,),
                      Stack(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor:Color(0xff16403B),
                              radius: 50,

                              child: Container(
                                height: 70,
                                width: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:  AssetImage("assets/icons/profile-thin.png",),

                                    )
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 180,top: 70),
                            child:CircleAvatar(
                              backgroundColor: Color(0xff365547),
                              maxRadius: 20,
                              child: Image.asset("assets/icons/edit.png",scale: 20,),
                            )

                            // IconButton(onPressed:() {
                            //
                            // },
                            //     icon: Image.asset("assets/icons/edit.png",scale: 13,)
                            //
                            // ),
                          )
                        ],

                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          child: Column(
                            children: [
                              TextField(
                                // controller: TextEditingController(text: userName),
                                controller: TextEditingController(text: value.loginName),
                                // controller: TextEditingController(),
                                decoration: InputDecoration(
                                    label: Text("UserName",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: value.loginName.isNotEmpty?cstgreen:Colors.black),),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                ),

                              ),
                              SizedBox(height: 10,),
                              TextField(
                                controller: TextEditingController(text: value.loginPhoneNumber),
                                // controller: TextEditingController(),
                                decoration: InputDecoration(
                                    label: Text("Phone Number",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color:value.loginPhoneNumber.isNotEmpty?cstgreen: Colors.black),),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                ),
                                readOnly:true ,

                              ),
                              SizedBox(height: 10,),
                              TextField(
                                controller: TextEditingController(text:value.loginPlace.isNotEmpty?value.loginPlace:""),
                                decoration: InputDecoration(
                                    label: Text("Add Your Place",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color:value.loginPlace.isNotEmpty?cstgreen: Colors.black),),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                ),

                              ),
                              SizedBox(height: 10,),
                              TextField(
                                controller: TextEditingController(text: value.loginAddress.isNotEmpty?value.loginAddress:""),
                                decoration: InputDecoration(
                                    label: Text("Add Your Address",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: value.loginAddress.isNotEmpty?cstgreen:Colors.black),),
                                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                ),

                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      SizedBox(
                        height: height/15,
                        width: width/3,
                        child: ElevatedButton(
                          onPressed: () {

                            Navigator.pop(context);
                          },
                          child: Text("SAVE",style: TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(backgroundColor: green,

                          ),

                        ),
                      )


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





// ----------------------------------------------------------------------------------------------------

// import 'package:decora/provider/loginProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../constants/constant_color.dart';
//
// class ProfileScreen extends StatefulWidget {
//   String user_Name,phone_Number,pass_word,place_,address_;
//   ProfileScreen({super.key,
//   required this.user_Name,required this.phone_Number,required this.pass_word,required this.place_,required this.address_
//
//   });
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   String userName="";
//   String phoneNumber="";
//   String place="";
//   @override
//   void initState(){
//     super.initState();
//     loadUserData();
//   }
//   Future<void> loadUserData() async {
//     SharedPreferences prefs=await SharedPreferences.getInstance();
//     setState(() {
//       userName=prefs.getString("REGISTER_NAME")??"";
//
//       phoneNumber=prefs.getString("REGISTER_PHONENUMBER")??"";
//     });
//   }
//   Widget build(BuildContext context) {
//     var width=MediaQuery.of(context).size.width;
//     var height=MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor:  Color(0xff16403B),
//
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: cstgradient,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//           ),
//           title: Text(
//             "PROFILE",
//             style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
//           ),
//           centerTitle: true,
//         ),
//       ),
//
//       body: SizedBox.expand(
//         child: Container(
//           decoration: BoxDecoration(gradient: screenGradient),
//           child: SingleChildScrollView(
//             child:
//             Consumer<LoginProvider>(
//               builder: (context,value,child) {
//                 return Column(
//                   children: [
//                     SizedBox(height: height/10,),
//                  Stack(
//                    children: [
//                      Center(
//                        child: CircleAvatar(
//                          backgroundColor:Color(0xff16403B),
//                          radius: 50,
//
//                          child: Container(
//                            height: 70,
//                            width: 60,
//                            decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image:  AssetImage("assets/icons/profile-thin.png",),
//
//                             )
//                            ),
//                          ),
//                        ),
//                      ),
//                      Padding(
//                        padding: const EdgeInsets.only(left: 180,top: 70),
//                        child: IconButton(onPressed:() {
//
//                        },
//                            icon: Image.asset("assets/icons/edit.png",scale: 13,)
//
//                        ),
//                      )
//                    ],
//
//                  ),
//                     Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Container(
//                         child: Column(
//                           children: [
//                             TextField(
//                               // controller: TextEditingController(text: userName),
//                               controller: TextEditingController(text: value.loginName),
//                               // controller: TextEditingController(),
//                               decoration: InputDecoration(
//                                 label: Text("UserName",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: value.loginName.isNotEmpty?cstgreen:Colors.black),),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
//
//                               ),
//
//                             ),
//                             SizedBox(height: 10,),
//                             TextField(
//                               controller: TextEditingController(text: value.loginPhoneNumber),
//                               // controller: TextEditingController(),
//                               decoration: InputDecoration(
//                                 label: Text("Phone Number",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color:value.loginPhoneNumber.isNotEmpty?cstgreen: Colors.black),),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
//
//                               ),
//                               readOnly:true ,
//
//                             ),
//                             SizedBox(height: 10,),
//                             TextField(
//                               controller: TextEditingController(text:value.loginPlace.isNotEmpty?value.loginPlace:""),
//                               decoration: InputDecoration(
//                                 label: Text("Add Your Place",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color:value.loginPlace.isNotEmpty?cstgreen: Colors.black),),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
//
//                               ),
//
//                             ),
//                             SizedBox(height: 10,),
//                             TextField(
//                               controller: TextEditingController(text: value.loginAddress.isNotEmpty?value.loginAddress:""),
//                               decoration: InputDecoration(
//                                 label: Text("Add Your Address",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: value.loginAddress.isNotEmpty?cstgreen:Colors.black),),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))
//
//                               ),
//
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   SizedBox(height: 25,),
//                   SizedBox(
//                     height: height/15,
//                     width: width/3,
//                     child: ElevatedButton(
//                         onPressed: () {
//
//                           Navigator.pop(context);
//                         },
//                         child: Text("SAVE",style: TextStyle(color: Colors.white),),
//                       style: ElevatedButton.styleFrom(backgroundColor: green,
//
//                       ),
//
//                     ),
//                   )
//
//
//                   ],
//                 );
//               }
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






// --------------------------------------------------2nd----------------------------------------------------------------


//
// import 'package:decora/provider/loginProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../constants/constant_color.dart';
//
// class ProfileScreen extends StatefulWidget {
//   final String user_Name, phone_Number, pass_word, place_, address_;
//
//   ProfileScreen({
//     super.key,
//     required this.user_Name,
//     required this.phone_Number,
//     required this.pass_word,
//     required this.place_,
//     required this.address_,
//   });
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   String userName = "";
//   String phoneNumber = "";
//   String place = "";
//   bool _showEditText = false; // State variable to control text visibility
//
//   @override
//   void initState() {
//     super.initState();
//     loadUserData();
//   }
//
//   Future<void> loadUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       userName = prefs.getString("REGISTER_NAME") ?? "";
//       phoneNumber = prefs.getString("REGISTER_PHONENUMBER") ?? "";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
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
//             "PROFILE",
//             style: TextStyle(
//               fontFamily: "tradeWinds",
//               fontSize: 20,
//               color: Color(0xff16403B),
//             ),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: SizedBox.expand(
//         child: Container(
//           decoration: BoxDecoration(gradient: screenGradient),
//           child: SingleChildScrollView(
//             child: Consumer<LoginProvider>(
//               builder: (context, value, child) {
//                 return Column(
//                   children: [
//                     SizedBox(height: height / 10),
//                     Stack(
//                       children: [
//                         Center(
//                           child: CircleAvatar(
//                             backgroundColor: Color(0xff16403B),
//                             radius: 50,
//                             child: Container(
//                               height: 70,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage("assets/icons/profile-thin.png"),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 180, top: 70),
//                           child: Column(
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _showEditText = !_showEditText; // Toggle the text visibility
//                                   });
//                                 },
//                                 icon: Image.asset("assets/icons/edit.png", scale: 13),
//                               ),
//                               // Display text conditionally
//                               AnimatedOpacity(
//                                 opacity: _showEditText ? 1.0 : 0.0,
//                                 duration: Duration(milliseconds: 300),
//                                 child: _showEditText
//                                     ? Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                                   decoration: BoxDecoration(
//                                     color: Colors.black54,
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Text(
//                                     "EDIT",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 )
//                                     : SizedBox.shrink(),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Container(
//                         child: Column(
//                           children: [
//                             TextField(
//                               controller: TextEditingController(text: value.loginName),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "UserName",
//                                   style: TextStyle(
//                                     fontFamily: "muktaregular",
//                                     fontSize: 20,
//                                     color: value.loginName.isNotEmpty ? cstgreen : Colors.black,
//                                   ),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                               controller: TextEditingController(text: value.loginPhoneNumber),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "Phone Number",
//                                   style: TextStyle(
//                                     fontFamily: "muktaregular",
//                                     fontSize: 20,
//                                     color: value.loginPhoneNumber.isNotEmpty ? cstgreen : Colors.black,
//                                   ),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                               readOnly: true,
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                               controller: TextEditingController(text: value.loginPlace.isNotEmpty ? value.loginPlace : ""),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "Add Your Place",
//                                   style: TextStyle(
//                                     fontFamily: "muktaregular",
//                                     fontSize: 20,
//                                     color: value.loginPlace.isNotEmpty ? cstgreen : Colors.black,
//                                   ),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                               controller: TextEditingController(text: value.loginAddress.isNotEmpty ? value.loginAddress : ""),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "Add Your Address",
//                                   style: TextStyle(
//                                     fontFamily: "muktaregular",
//                                     fontSize: 20,
//                                     color: value.loginAddress.isNotEmpty ? cstgreen : Colors.black,
//                                   ),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                     SizedBox(
//                       height: height / 15,
//                       width: width / 3,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           "SAVE",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: green,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// --------------------------------------------------------------------------------------------------------------------
// import 'package:decora/provider/loginProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async'; // Import the Timer library
//
// import '../constants/constant_color.dart';
//
// class ProfileScreen extends StatefulWidget {
//   String user_Name, phone_Number, pass_word, place_, address_;
//   ProfileScreen({
//     super.key,
//     required this.user_Name,
//     required this.phone_Number,
//     required this.pass_word,
//     required this.place_,
//     required this.address_,
//   });
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   String userName = "";
//   String phoneNumber = "";
//   bool showEditText = false; // Variable to control the visibility of the text
//   Timer? _timer; // Timer to manage text visibility
//
//   @override
//   void initState() {
//     super.initState();
//     loadUserData();
//   }
//
//   Future<void> loadUserData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       userName = prefs.getString("REGISTER_NAME") ?? "";
//       phoneNumber = prefs.getString("REGISTER_PHONENUMBER") ?? "";
//     });
//   }
//
//   void _onEditIconPressed() {
//     setState(() {
//       showEditText = true; // Show the text
//     });
//
//     // Set a timer to hide the text after 2 seconds
//     _timer = Timer(Duration(seconds: 2), () {
//       setState(() {
//         showEditText = false; // Hide the text
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel(); // Cancel the timer if the widget is disposed
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor: Color(0xff16403B),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: cstgradient,
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20)),
//             ),
//           ),
//           title: Text(
//             "PROFILE",
//             style: TextStyle(
//                 fontFamily: "tradeWinds", fontSize: 20, color: Color(0xff16403B)),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: SizedBox.expand(
//         child: Container(
//           decoration: BoxDecoration(gradient: screenGradient),
//           child: SingleChildScrollView(
//             child: Consumer<LoginProvider>(
//               builder: (context, value, child) {
//                 return Column(
//                   children: [
//                     SizedBox(height: height / 10),
//                     Stack(
//                       children: [
//                         Center(
//                           child: CircleAvatar(
//                             backgroundColor: Color(0xff16403B),
//                             radius: 50,
//                             child: Container(
//                               height: 70,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage("assets/icons/profile-thin.png"),
//                                   )),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 180, top: 70),
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 onPressed: _onEditIconPressed, // Call the method on press
//                                 icon: Image.asset(
//                                   "assets/icons/edit.png",
//                                   scale: 13,
//                                 ),
//                               ),
//                               if (showEditText) // Check if the text should be shown
//                                 Container(
//                                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                                   decoration: BoxDecoration(
//                                     color: Colors.black,
//                                     borderRadius: BorderRadius.circular(15),
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey.withOpacity(0.5),
//                                         spreadRadius: 2,
//                                         blurRadius: 5,
//                                         offset: Offset(0, 3), // changes position of shadow
//                                       ),
//                                     ],
//                                   ),
//                                   child: Text(
//                                     "Edit", // Text to display
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       color: cstText,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Container(
//                         child: Column(
//                           children: [
//                             TextField(
//                               controller: TextEditingController(text: value.loginName),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "UserName",
//                                   style: TextStyle(
//                                       fontFamily: "muktaregular",
//                                       fontSize: 20,
//                                       color: value.loginName.isNotEmpty
//                                           ? cstgreen
//                                           : Colors.black),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                               controller: TextEditingController(text: value.loginPhoneNumber),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "Phone Number",
//                                   style: TextStyle(
//                                       fontFamily: "muktaregular",
//                                       fontSize: 20,
//                                       color: value.loginPhoneNumber.isNotEmpty
//                                           ? cstgreen
//                                           : Colors.black),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                               ),
//                               readOnly: true,
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                               controller: TextEditingController(
//                                   text: value.loginPlace.isNotEmpty
//                                       ? value.loginPlace
//                                       : ""),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "Add Your Place",
//                                   style: TextStyle(
//                                       fontFamily: "muktaregular",
//                                       fontSize: 20,
//                                       color: value.loginPlace.isNotEmpty
//                                           ? cstgreen
//                                           : Colors.black),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                               controller: TextEditingController(
//                                   text: value.loginAddress.isNotEmpty
//                                       ? value.loginAddress
//                                       : ""),
//                               decoration: InputDecoration(
//                                 label: Text(
//                                   "Add Your Address",
//                                   style: TextStyle(
//                                       fontFamily: "muktaregular",
//                                       fontSize: 20,
//                                       color: value.loginAddress.isNotEmpty
//                                           ? cstgreen
//                                           : Colors.black),
//                                 ),
//                                 enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                     SizedBox(
//                       height: height / 15,
//                       width: width / 3,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: Text(
//                           "SAVE",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: green,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

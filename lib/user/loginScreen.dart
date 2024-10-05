// import 'package:decora/constants/constant_color.dart';
// import 'package:decora/provider/loginProvider.dart';
// import 'package:decora/user/forgotPwdScreen.dart';
// import 'package:decora/user/homepageScreen.dart';
// import 'package:decora/user/registerScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../constants/constant_images.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//
//   @override
//   void dispose() {
//     phoneController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: cstgreen,
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 50,),
//               Center(child: Image.asset(logo, scale: 3,)),
//               SizedBox(height: 30,),
//               TextField(
//                 controller: phoneController,
//                 style: TextStyle(color: Colors.white,fontFamily: "muktaregular"),
//                 decoration: InputDecoration(
//                   prefixIcon: Image.asset("assets/icons/email.png", scale: 25,),
//                   label: Text("PHONE NUMBER", style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),),
//                 ),
//                 keyboardType: TextInputType.phone,
//                 maxLength: 10,
//               ),
//               SizedBox(height: 20,),
//               TextField(
//                 style: TextStyle(color: Colors.white,fontFamily: "muktaregular"),
//
//                 controller: passwordController,
//                 obscureText: !_isPasswordVisible,
//                 decoration: InputDecoration(
//                   prefixIcon: Image.asset("assets/icons/password.png", scale: 30,),
//                   label: Text("PASSWORD", style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                       color: Colors.white,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isPasswordVisible = !_isPasswordVisible;
//                       });
//                     },
//                   ),
//                 ),
//                 maxLength: 10,
//               ),
//               SizedBox(height: 30,),
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotpwdScreen(),));
//                 },
//                 child: Center(child: Text("Forgotten your password?", style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),)),
//               ),
//               SizedBox(height: height / 6,),
//               Consumer<LoginProvider>(
//                   builder: (context, loginProvider, child) {
//                     return InkWell(
//                       onTap: () async {
//
//                         SharedPreferences prefs = await SharedPreferences.getInstance();
//                         String? registeredPhoneNumber = prefs.getString("REGISTER_PHONENUMBER");
//                         String? registeredPassword = prefs.getString("REGISTER_PASSWORD");
//
//                         String inputPhoneNumber = phoneController.text;
//                         String inputPassword = passwordController.text;
//
//                         if (registeredPhoneNumber != null && registeredPassword != null) {
//                           if (registeredPhoneNumber == inputPhoneNumber && registeredPassword == inputPassword) {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomePage(),));
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text("Invalid phone number or password"),
//                               duration: Duration(seconds: 2),
//                             ));
//                           }
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("No registered user found"),
//                             duration: Duration(seconds: 2),
//                           ));
//                         }
//                       },
//                       child: Center(
//                         child: Container(
//                           height: height / 14,
//                           width: width / 1.38,
//                           decoration: BoxDecoration(
//                             gradient: cstgradient,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Center(
//                             child: Text("LOGIN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "mukta"),),
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//               ),
//               SizedBox(height: 20,),
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("No account?", style: TextStyle(color: Colors.white, fontFamily: "muktaregular", fontWeight: FontWeight.bold, fontSize: 15),),
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
//                       },
//                       child: Text(" Create one", style: TextStyle(color: cstyellow, fontFamily: "muktamedium", fontWeight: FontWeight.bold, fontSize: 15),),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:decora/constants/call_functions.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/forgotPwdScreen.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:decora/user/registerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant_images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: cstgreen,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Center(child: Image.asset(logo, scale: 3,)),
              SizedBox(height: 30,),
              TextField(
                controller: phoneController,
                style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/icons/email.png", scale: 25,),
                  label: Text("PHONE NUMBER", style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),),
                ),
                keyboardType: TextInputType.phone,
                maxLength: 10,
              ),
              SizedBox(height: 20,),
              TextField(
                style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),
                controller: passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/icons/password.png", scale: 30,),
                  label: Text("PASSWORD", style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                maxLength: 10,
              ),
              SizedBox(height: 30,),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotpwdScreen(),));
                },
                child: Center(child: Text("Forgotten your password?", style: TextStyle(color: Colors.white, fontFamily: "muktaregular"),)),
              ),
              SizedBox(height: height / 10,),


                    Consumer<LoginProvider>(
                      builder: (context,value,child) {
                        return InkWell(
                        onTap: () async {

                          value.usersAuthorized(phoneController.text, passwordController.text, context);

                          // callNextReplacement(context, className)
                          // // value.addRegistration();
                          // // value.getWishList();
                          // value.getAddedProduct();
                          // value.getDesignerWork();
                          // value.getDesignerData();
                          // SharedPreferences prefs = await SharedPreferences.getInstance();
                          // String? registeredPhoneNumber = prefs.getString("REGISTER_PHONENUMBER");
                          // String? registeredPassword = prefs.getString("REGISTER_PASSWORD");
                          //
                          // String inputPhoneNumber = phoneController.text;
                          // String inputPassword = passwordController.text;
                          //
                          // // Debugging outputs
                          // print("Stored Phone Number: $registeredPhoneNumber");
                          // print("Stored Password: $registeredPassword");
                          // print("Input Phone Number: $inputPhoneNumber");
                          // print("Input Password: $inputPassword");
                          //
                          // if (registeredPhoneNumber != null && registeredPassword != null) {
                          //   if (registeredPhoneNumber == inputPhoneNumber && registeredPassword == inputPassword) {
                          //     Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomePage(),));
                          //   } else {
                          //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //       content: Text("Invalid phone number or password"),
                          //       duration: Duration(seconds: 2),
                          //     ));
                          //   }
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text("No registered user found"),
                          //     duration: Duration(seconds: 2),
                          //   ));
                          // }
                        },
                        child: Center(
                          child: Container(
                            height: height / 14,
                            width: width / 1.38,
                            decoration: BoxDecoration(
                              gradient: cstgradient,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text("LOGIN", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "mukta"),),
                            ),
                          ),
                        ),
                                          );
                      }
                    ),


              SizedBox(height: 20,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No account?", style: TextStyle(color: Colors.white, fontFamily: "muktaregular", fontWeight: FontWeight.bold, fontSize: 15),),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                      },
                      child: Text(" Create one", style: TextStyle(color: cstyellow, fontFamily: "muktamedium", fontWeight: FontWeight.bold, fontSize: 15),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

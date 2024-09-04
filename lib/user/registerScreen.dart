// import 'package:decora/Designer/newEnquiryScreen.dart';
// import 'package:decora/constants/constant_color.dart';
// import 'package:decora/constants/refractorwidgets.dart';
// import 'package:decora/user/homepageScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/loginProvider.dart';
// import '../provider/mainProvider.dart';
//
// class RegisterScreen extends StatefulWidget {
//
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   bool isChecked=false;
//   String? selectDesignation;
//   final List<String> designation=["USER","DESIGNER"];
//   final FocusNode nameFocusNode=FocusNode();
//   final FocusNode emailFocusNode=FocusNode();
//   final FocusNode passwordFocusNode=FocusNode();
//   final FocusNode designatoionFocusNode=FocusNode();
//
//   bool isNameValid=true;
//   bool isEmailValid=true;
//   bool isPasswordValid=true;
//   bool isDesignationValid=true;
//
//
//   @override
//   Widget build(BuildContext context) {
//     var width=MediaQuery.of(context).size.width;
//     var height=MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Image.asset("assets/icons/arrow-back.png",scale: 15,)),
//       ),
//       backgroundColor: cstgreen,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Consumer<LoginProvider>(
//             builder: (context,value,child) {
//               return Column(
//                 children: [
//
//                   Center(child: Text("Register",style: TextStyle(color: cstyellow,fontFamily: "muktarbold",fontSize: 30,fontWeight: FontWeight.w600),)),
//                   Text("Create your new account",style: TextStyle(fontFamily: "mukatamedium",color: Colors.white,fontSize: 20),),
//
//                   SizedBox(height: 20,),
//                   Container(
//                     height: height/13,
//                     decoration: BoxDecoration(
//                       color:gradientgreen,
//                       borderRadius: BorderRadius.circular(20)
//                     ),
//                     child: TextFormField(
//                       controller: value.RegisterNameController,
//                       style: TextStyle(color: Colors.white,fontFamily: "muktaregular",),
//                       decoration: InputDecoration(
//                         prefixIcon: Image.asset("assets/icons/mdi_user.png",scale: 5,),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)
//                           ),
//                         label: Text("USER NAME",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontWeight: FontWeight.w500),),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(20)
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:  BorderSide.none,
//                             borderRadius: BorderRadius.circular(20)
//                         ),
//
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 13,),
//                   //phone number
//                   Container(
//                     height: height/13,
//                     decoration: BoxDecoration(
//                         color:gradientgreen,
//                         borderRadius: BorderRadius.circular(20)
//                     ),
//                     child: TextFormField(
//                       controller: value.RegisterPhoneController,
//
//                       style: TextStyle(color: Colors.white,fontFamily: "muktaregular",),
//                       decoration: InputDecoration(
//                           prefixIcon: Image.asset("assets/icons/email.png",scale: 25,),
//                           border: OutlineInputBorder(
//                               borderRadius:BorderRadius.circular(20)
//                           ),
//                           label: Text("PHONE NUMBER",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontWeight: FontWeight.w500),),
//                         // hintText: "user@gmail.com",
//                         hintStyle: TextStyle(color: Colors.white),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.circular(20)
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:  BorderSide.none,
//                               borderRadius: BorderRadius.circular(20)
//                           ),
//
//
//                       ),
//                       keyboardType: TextInputType.phone,
//                       maxLength: 10,
//                     ),
//                   ),
//                   SizedBox(height: 13,),
//                   Container(
//                     height: height/13,
//                     decoration: BoxDecoration(
//                         color:gradientgreen,
//                         borderRadius: BorderRadius.circular(20)
//                     ),
//                     child:
//                     TextFormField(
//                       controller: value.RegisterPasswordController,
//                       style: TextStyle(color: Colors.white,fontFamily: "muktaregular",),
//                       decoration: InputDecoration(
//
//                           prefixIcon: Image.asset("assets/icons/password.png",scale: 40,),
//                           suffixIcon: Image.asset("assets/icons/visible-solid.png",scale: 40,),
//                           border: OutlineInputBorder(
//                               borderRadius:BorderRadius.circular(20)
//                           ),
//                           label: Text("PASSWORD",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontWeight: FontWeight.w500),),
//                         // hintText: "aaaa",
//                         hintStyle: TextStyle(color: Colors.white),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.circular(20)
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide:  BorderSide.none,
//                               borderRadius: BorderRadius.circular(20)
//                           ),
//
//
//
//                       ),
//                       maxLength: 10,
//                       // obscureText:true,
//
//                     ),
//                   ),
//                   SizedBox(height: 13,),
//                   Container(
//
//                     height: height / 13,
//                     decoration: BoxDecoration(
//                       color: gradientgreen,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: DropdownButtonFormField<String>(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide.none,  // No border when focused
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide.none,  // No border when enabled
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: "Designation",
//                         labelStyle: TextStyle(fontSize: 15, color: Colors.white, fontFamily: "muktaregular"),
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                       ),
//                       value: selectDesignation,
//                       style: TextStyle(fontSize: 15, color: Colors.white, fontFamily: "muktaregular"),
//                       dropdownColor: gradientgreen,  // Dropdown color to match the field
//                       items: designation.map((String designation) {
//                         return DropdownMenuItem<String>(
//                           value: designation,
//                           child: Text(designation),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           selectDesignation = newValue;
//                           value.designationController.text=newValue!;// Update the controller here
//                         });
//                       },
//                       icon: Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: height/13,),
//                   // btn(50, 100, Colors.white, 12)
//                   Consumer<MainProvider>(
//                     builder: (context,value1,child) {
//                       return InkWell(
//                         onTap: () {
//                             value.addRegistration();
//                             value1.getAddedProduct();
//                             value1.getDesignerWork();
//                             value1.getDesignerData();
//
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => UserHomePage(),));
//                           // Navigator.push(context, MaterialPageRoute(builder: (context) => NewEnquiryScreen(),));
//                         },
//                         child: Container(
//                           height: height/14,
//                           width: width,
//                           decoration: BoxDecoration(
//                             gradient: cstgradient,
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           child: Center(child: Text("LOGIN",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "mukta"),)),
//
//                         ),
//                       );
//                     }
//                   ),
//                   // SizedBox(height: 10,),
//                   Row(
//                     children: [
//                       Checkbox(
//                         // tristate: true,
//                         activeColor: cstyellow,
//
//                           value: isChecked,
//                           onChanged: (value) {
//                             setState(() {
//                               isChecked=value!;
//                             });
//                           },
//                       ),
//
//                       Text("Remember Me ",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 16),),
//                       SizedBox(width: 60,),
//                       Text("Forgot Password ?",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 16))
//                     ],
//                   ),
//                   SizedBox(height: height/6,),
//                   Center(
//                       child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Already have an account?",style: TextStyle(color: Colors.white,fontFamily: "mukta",fontSize: 16)),
//                       TextButton(
//                           onPressed: (){},
//                           child: Text("Sign Up",style: TextStyle(color:cstyellow,fontFamily: "mukta",fontSize: 16))
//                       )
//                     ],
//                   ))
//                 ],
//               );
//             }
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
import 'package:decora/Designer/newEnquiryScreen.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/constants/refractorwidgets.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/mainProvider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;
  String? selectDesignation;
  final List<String> designation = ["USER", "DESIGNER"];
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode designationFocusNode = FocusNode();

  bool isNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isDesignationValid = true;

  bool _isPasswordVisible = false; // For password visibility toggle

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/icons/arrow-back.png",
            scale: 15,
          ),
        ),
      ),
      backgroundColor: cstgreen,
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: cstyellow,
                            fontFamily: "muktarbold",
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      )),
                  Text(
                    "Create your new account",
                    style: TextStyle(
                        fontFamily: "mukatamedium",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: height / 13,
                    decoration: BoxDecoration(
                        color: gradientgreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: value.RegisterNameController,
                      focusNode: nameFocusNode,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "muktaregular",
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          "assets/icons/mdi_user.png",
                          scale: 5,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(
                          "USER NAME",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "muktaregular",
                              fontWeight: FontWeight.w500),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: height / 13,
                    decoration: BoxDecoration(
                        color: gradientgreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: value.RegisterPhoneController,
                      focusNode: phoneFocusNode,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "muktaregular",
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          "assets/icons/email.png",
                          scale: 25,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(
                          "PHONE NUMBER",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "muktaregular",
                              fontWeight: FontWeight.w500),
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: height / 13,
                    decoration: BoxDecoration(
                        color: gradientgreen,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      controller: value.RegisterPasswordController,
                      focusNode: passwordFocusNode,
                      obscureText: !_isPasswordVisible, // Hide password
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "muktaregular",
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Image.asset(
                          "assets/icons/password.png",
                          scale: 40,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        label: Text(
                          "PASSWORD",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "muktaregular",
                              fontWeight: FontWeight.w500),
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      maxLength: 10,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: height / 13,
                    decoration: BoxDecoration(
                      color: gradientgreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none, // No border when focused
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none, // No border when enabled
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Designation",
                        labelStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "muktaregular"),
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      ),
                      value: selectDesignation,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: "muktaregular"),
                      dropdownColor: gradientgreen, // Dropdown color
                      items: designation.map((String designation) {
                        return DropdownMenuItem<String>(
                          value: designation,
                          child: Text(designation),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectDesignation = newValue;
                            value.designationController.text =
                                newValue; // Update the controller here
                          });
                        }
                      },
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 13,
                  ),
                  Consumer<MainProvider>(builder: (context, value1, child) {
                    return InkWell(
                      onTap: () {
                        if (value.RegisterNameController.text.isNotEmpty &&
                            value.RegisterPhoneController.text.isNotEmpty &&
                            value.RegisterPasswordController.text.isNotEmpty &&
                            selectDesignation != null) {
                          // Registration process
                          value.addRegistration();
                          value1.getAddedProduct();
                          value1.getDesignerWork();
                          value1.getDesignerData();

                          // Navigate based on designation
                          if (selectDesignation == "USER") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserHomePage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewEnquiryScreen(),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please fill all fields correctly"),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                      child: Container(
                        height: height / 14,
                        width: width,
                        decoration: BoxDecoration(
                          gradient: cstgradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                            child: Text(
                              "REGISTER",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "mukta"),
                            )),
                      ),
                    );
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "muktaregular",
                            fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to login screen
                        },
                        child: Text("Log In",
                            style: TextStyle(
                                color: cstyellow,
                                fontFamily: "mukta",
                                fontSize: 16)),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

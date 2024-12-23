import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decora/admin/verifyDesigners.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/provider/chatProvider.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:decora/user/userBottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Designer/dbottomNavigation.dart';
import '../admin/AdminHomeScreen.dart';

class LoginProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  String loginPhoneNumber = "";
  String loginName = "";
  String loginPassword = "";
  String loginUserId = "";
  String loginPlace = "";
  String loginAddress = "";
  String loginType="";
  String loginPhoto="";
  List<dynamic> favProductIdList=[];

  Future<void> usersAuthorized(String? lgphoneNumber, String? lgpassword, BuildContext context) async {
    MainProvider mainPro = Provider.of<MainProvider>(context, listen: false);
    ChatProvider chatPro = Provider.of<ChatProvider>(context, listen: false);


    try {

      print("Starting login process for phone number: $lgphoneNumber");
      // Query Firestore to check if the user exists with the provided phone number and password

      db.collection("USERS").where("REGISTER_PHONENUMBER",isEqualTo: lgphoneNumber).where("REGISTER_PASSWORD",isEqualTo: lgpassword).get().then((value) async {
        if(value.docs.isNotEmpty){
          SharedPreferences prefs=await SharedPreferences.getInstance();
          prefs.setString("_PhoneNumber", lgphoneNumber!);
          prefs.setString("_Password", lgpassword!);
          Map<dynamic,dynamic>map=value.docs.first.data();
          loginUserId=map["REGISTER_ID"]??"";
          loginPhoneNumber=map["REGISTER_PHONENUMBER"]??"";
          loginName=map["REGISTER_NAME"]??"";
          loginPassword=map["REGISTER_PASSWORD"]??"";
          loginPlace=map["PLACE"]??"";
          loginAddress=map["ADDRESS"]??"";
          loginType=map["DESIGNATION"]??"";
          loginPhoto=map["USERS_IMAGE"]??"";
          favProductIdList=map["WISHLIST"]??[];


          if (map['DESIGNATION'].toString() == "ADMIN") {
            print("I entered in admin side");
            callNextReplacement(context, AdminHomeScreen(userId: loginUserId,));
            print("Navigating to Admin Home Screen");

            // Optionally add any logic required for the admin

            // mainPro.addCategory();
            mainPro.getAllOrders();
            mainPro.getCategory();
            mainPro.getAddedProduct();
            // mainPro.logOutAlert(context);
            notifyListeners();

          }
          else if (map['DESIGNATION'].toString() == "USER") {
            print("I entered in user side");
            // Navigate to user home screen
            print("Navigating to User Home Page");
            await mainPro.getAllAddedWork();
            mainPro.getAddedProduct();
            mainPro.getCategory();
            mainPro.getDesignerWork(loginUserId);
            mainPro.getAddedCart(loginUserId);
            mainPro.getDesigners();
            // chatPro.updateCurrentUSer(userType: "USER");
            // mainPro.getDesignerDetails(designerID);
            notifyListeners();
            callNextReplacement(context, UserBottomNavigation(user_Name: loginName, phone_Number: loginPhoneNumber, pass_word: loginPhoneNumber, place_: loginPlace, address_: loginPassword, userId: loginUserId,));

          }
          else if (map['DESIGNATION'].toString() == "DESIGNER") {
            print("I entered in designer side");
            // chatPro.fetchRecentUsersForDesigner(loginUserId);
            // chatPro.fetchLastMessagesForDesigner(loginUserId);
            mainPro.getDesignerWork(loginUserId);
            // chatPro.updateCurrentUSer(userType: "DESIGNER");
            callNextReplacement(context, DesignerBottomNavigation(userId: loginUserId, name: loginName, phone: loginPhoneNumber, receiver_ID: "", photo: loginPhoto,)); // Navigate to designer screen
            print("Navigating to Verify Designers Screen");

            // mainPro.addDesignerWork();
            mainPro.addDesignerWork(loginUserId);
            notifyListeners();
          }
          else {
            // Show error if the user type is not valid
            print("INVALID USER TYPE");
            const snackBar = SnackBar(
              content: Text(
                "INVALID USER",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

        }
        else {
          // Show a message if no user is found
          print("User not found or invalid credentials");
          const snackBar = SnackBar(
            content: Text(
              "User not found or invalid credentials",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });

    }
    catch (error) {
      // Handle any potential errors during the process
      print("Error during login: $error");
      const snackBar = SnackBar(
        content: Text(
          "An error occurred. Please try again.",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }


}


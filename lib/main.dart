import 'package:decora/admin/verifyDesigners.dart';
import 'package:decora/user/buyNowScreen.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:decora/user/chairScreen.dart';
import 'package:decora/user/connectDesigners.dart';
import 'package:decora/user/createpswdScreen.dart';
import 'package:decora/user/designerProfile.dart';
import 'package:decora/user/forgotPwdScreen.dart';
import 'package:decora/user/getStartedScreen.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:decora/user/lampScreen.dart';
import 'package:decora/user/loginScreen.dart';
import 'package:decora/user/orderSummary.dart';
import 'package:decora/user/profileScreen.dart';
import 'package:decora/user/registerScreen.dart';
import 'package:decora/user/splashScreen.dart';
import 'package:decora/user/verifypwdScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/material.dart';

import 'admin/AdminHomeScreen.dart';
import 'admin/addCategoryScreen.dart';
import 'admin/addProductScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: SplashScreen(),

      // home: WishList(),
      home: AddProductScreen(),
    );
  }
}



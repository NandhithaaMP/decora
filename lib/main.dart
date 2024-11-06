import 'package:decora/admin/verifyDesigners.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/accountScreen.dart';
import 'package:decora/user/buyNowScreen.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:decora/user/chairScreen.dart';
import 'package:decora/user/connectDesigners.dart';
import 'package:decora/user/createpswdScreen.dart';
import 'package:decora/user/designerProfile.dart';
import 'package:decora/user/failedScreen.dart';
import 'package:decora/user/forgotPwdScreen.dart';
import 'package:decora/user/getStartedScreen.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:decora/user/categoryDetailsScreen.dart';
import 'package:decora/user/loginScreen.dart';
import 'package:decora/user/myOrderScreen.dart';
import 'package:decora/user/newDeliveryAddressScreen.dart';
import 'package:decora/user/orderDetailsScreen.dart';
import 'package:decora/user/orderSummary.dart';

import 'package:decora/user/orderSummaryScreen.dart';
import 'package:decora/user/profileScreen.dart';
import 'package:decora/user/registerScreen.dart';
import 'package:decora/user/splashScreen.dart';
import 'package:decora/user/successScreen.dart';
import 'package:decora/user/ubottomNavigation.dart';
import 'package:decora/user/verifypwdScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Designer/chatBoxScreen.dart';
import 'Designer/dbottomNavigation.dart';
import 'Designer/designerProfileScreen.dart';
import 'Designer/newEnquiryScreen.dart';
import 'Designer/uploadWorkScreen.dart';
import 'admin/AdminHomeScreen.dart';
import 'admin/addCategoryScreen.dart';
import 'admin/addProductScreen.dart';
import 'admin/productScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBw_HntOWzYactj7vAVIAeo4n3knZtr_28",
          appId: "1:904792350518:android:bbcd7c5cf7b0be4eb95d97",
          messagingSenderId: "904792350518",
          projectId: "decora-3edd1",
          storageBucket: "decora-3edd1.appspot.com"
      )
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Decora',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
        //  home:ChatBoxScreen(),
        //  home:ChatScreen(),
      ),
    );
  }
}



import 'package:decora/constants/constant_color.dart';
import 'package:decora/constants/constant_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      },);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cstgreen,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(logo)
          ],
        ),
      ),
    );
  }
}

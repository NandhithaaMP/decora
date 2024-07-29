import 'package:decora/constants/constant_color.dart';
import 'package:decora/constants/constant_images.dart';
import 'package:decora/user/forgotPwdScreen.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:decora/user/registerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: cstgreen,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Center(child: Image.asset(logo, scale: 3,)),

            TextField(

              decoration: InputDecoration(
                prefixIcon: Image.asset("assets/icons/email.png",scale: 25,),

                label: Text("EMAIL",style: TextStyle(color: Colors.white,fontFamily: "muktaregular"),)
              ),
            ),
            SizedBox(height: 20,),
            TextField(


              decoration: InputDecoration(
                prefixIcon: Image.asset("assets/icons/password.png",scale:30,),

                label: Text("PASSWORD",style: TextStyle(color: Colors.white,fontFamily:"muktaregular" ),),
                suffixIcon: Image.asset("assets/icons/visible-solid.png",scale:30,),
              ),
            ),
            SizedBox(height: 30,),
            TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ForgotpwdScreen(),));
              },
                child: Center(child: Text("Foregotten your password ? ",style: TextStyle(color: Colors.white,fontFamily: "muktaregular"),))),
            SizedBox(height: height/5,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              },
              child: Center(
                child: Container(
                  height: height/14,
                  width: width/1.38,
                  decoration: BoxDecoration(
                    gradient: cstgradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("LOGIN",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "mukta"),)),

                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("No account ?",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontWeight: FontWeight.bold,fontSize: 15),),
                InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => RegisterScreen(),));
                  },
                    child: Text(" Create one ",style: TextStyle(color: cstyellow,fontFamily: "muktamedium",fontWeight: FontWeight.bold,fontSize: 15),)),

              ],
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:decora/constants/constant_color.dart';
import 'package:decora/user/createpswdScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VerifypwdScreen extends StatelessWidget {
  const VerifypwdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/arrow-back.png",scale: 20,)),
        backgroundColor: Colors.transparent,
        title: Text('Verify your mail',style: TextStyle(fontFamily: "muktamedium",color: cstyellow),),
        centerTitle: true,
      ),
      backgroundColor: green,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color(0xffE4C8BB),
                // backgroundImage: AssetImage("assets/icons/pswdlock.png"),
                child: Image.asset("assets/verifyemail.png",scale: 4,),
              ),
            ),
            SizedBox(height: 30,),
            Center(child: Text("Please Enter  The 4 Digit Code Sent \n             To user@gmail.com",style: TextStyle(fontFamily: "muktaregular",color: Colors.white,fontSize: 20),)),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      // width: width/18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 5,
                      // width: width/18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 5,
                      // width: width/18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 5,
                      // width: width/18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(onPressed: () {

            }, child: Text("Resend Code",style: TextStyle(color: Color(0xffECA3BD),fontSize: 12),)
            ),
            SizedBox(height: height/10,),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreatepwdScreen(),));
              },
              child: Container(
                height: height/15,
                width: width/1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: cstyellow,
                ),
                child: Center(child: Text("VERIFY",style: TextStyle(color: Colors.white,fontSize: 22,fontFamily: "muktaregular",),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

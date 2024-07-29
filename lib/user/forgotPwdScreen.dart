import 'package:decora/constants/constant_color.dart';
import 'package:decora/user/verifypwdScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotpwdScreen extends StatelessWidget {
  const ForgotpwdScreen({super.key});

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
        title: Text('Forgot Password',style: TextStyle(fontFamily: "muktamedium",color: cstyellow),),
        centerTitle: true,
      ),
      backgroundColor: green,
      body: SingleChildScrollView(
        child: Padding(
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
                  child: Image.asset("assets/icons/pswdlock.png",scale: 4,),
                ),
              ),
              SizedBox(height: 30,),
              Center(child: Text("Please Enter Your Email Address To \n Receive a Verification Code",style: TextStyle(fontFamily: "muktaregular",color: Colors.white,fontSize: 20),)),
              SizedBox(height: 30,),
              Container(
                height: height/13,
                decoration: BoxDecoration(
                  // color: Colors.red,
                 borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                  fillColor:gradientgreen,
                    filled: true,
                    label: Text("Email address",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 20),),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                        // borderSide: BorderSide(
                        //     color: Colors.white
                        // )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      // borderSide: BorderSide(
                      //   color: Colors.white
                      // )

                    )
                  ),
                ),
              ),
              SizedBox(height: height/5,),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerifypwdScreen(),));
                },
                child: Container(
                  height: height/15,
                  width: width/1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: cstyellow,
                  ),
                  child: Center(child: Text("SEND",style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: "muktaregular",),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

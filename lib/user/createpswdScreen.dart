import 'package:decora/constants/constant_color.dart';
import 'package:decora/user/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreatepwdScreen extends StatelessWidget {
  const CreatepwdScreen({super.key});

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
        title: Text('Create New Password',style: TextStyle(fontFamily: "muktamedium",color: cstyellow),),
        centerTitle: true,
      ),
      backgroundColor: green,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Color(0xffE4C8BB),
                  // backgroundImage: AssetImage("assets/icons/pswdlock.png"),
                  child: Image.asset("assets/newpwd.png",scale: 6,),
                ),
              ),
              SizedBox(height: 30,),
              Center(child: Text("Your New Password Must Be Different \n     From  Previously Used Password",style: TextStyle(fontFamily: "muktaregular",color: Colors.white,fontSize: 17),)),
              SizedBox(height: 30,),
              TextFormField(
                decoration: InputDecoration(
                label: Text("New Password",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: Colors.white),),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),

                  ),

                ),
                maxLength: 10,
                obscureText: true,


              ),
              // SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Confirm Password",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: Colors.white),),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),

                  ),

                ),
                maxLength: 10,
                obscureText: true,


              ),
              SizedBox(height: height/18),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Container(
                  height: height/15,
                  width: width/1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: cstyellow,
                  ),
                  child: Center(child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "muktaregular",),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

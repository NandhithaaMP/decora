import 'package:decora/constants/constant_color.dart';
import 'package:decora/constants/refractorwidgets.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/arrow-back.png",scale: 15,)),
      ),
      backgroundColor: cstgreen,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
        
              Center(child: Text("Register",style: TextStyle(color: cstyellow,fontFamily: "muktarbold",fontSize: 30,fontWeight: FontWeight.w600),)),
              Text("Create your new account",style: TextStyle(fontFamily: "mukatamedium",color: Colors.white,fontSize: 20),),
        
              SizedBox(height: 20,),
              Container(
                height: height/13,
                decoration: BoxDecoration(
                  color:gradientgreen,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Image.asset("assets/icons/mdi_user.png",scale: 5,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    label: Text("USER NAME",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontWeight: FontWeight.w500),),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide.none,
                        borderRadius: BorderRadius.circular(20)
                    )
                  ),
        
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: height/13,
                decoration: BoxDecoration(
                    color:gradientgreen,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Image.asset("assets/icons/email.png",scale: 25,),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20)
                      ),
                      label: Text("EMAIL",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontWeight: FontWeight.w500),),
                    hintText: "user@gmail.com",
                    hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                      )
        
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: height/13,
                decoration: BoxDecoration(
                    color:gradientgreen,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Image.asset("assets/icons/password.png",scale: 40,),
                      suffixIcon: Image.asset("assets/icons/visible-solid.png",scale: 40,),
                      border: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(20)
                      ),
                      label: Text("PASSWORD",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontWeight: FontWeight.w500),),
                    hintText: "user@gmail.com",
                    hintStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:  BorderSide.none,
                          borderRadius: BorderRadius.circular(20)
                      )
        
                  ),
                ),
              ),
              SizedBox(height: height/13,),
              // btn(50, 100, Colors.white, 12)
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                },
                child: Container(
                  height: height/14,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: cstgradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(child: Text("LOGIN",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "mukta"),)),

                ),
              ),
              // SizedBox(height: 10,),
              Row(
                children: [
                  Checkbox(
                    // tristate: true,
                    activeColor: cstyellow,
        
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked=value!;
                        });
                      },
                  ),
                  Text("Remember Me ",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 16),),
                  SizedBox(width: 60,),
                  Text("Forgot Password ?",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 16))
                ],
              ),
              SizedBox(height: height/6,),
              Center(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(color: Colors.white,fontFamily: "mukta",fontSize: 16)),
                  TextButton(
                      onPressed: (){},
                      child: Text("Sign Up",style: TextStyle(color:cstyellow,fontFamily: "mukta",fontSize: 16))
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName="";
  String phoneNumber="";
  String place="";
  @override
  void initState(){
    super.initState();
    loadUserData();
  }
  Future<void> loadUserData() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      userName=prefs.getString("REGISTER_NAME")??"";
      phoneNumber=prefs.getString("REGISTER_PHONENUMBER")??"";
    });
  }
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor:  Color(0xff16403B),

          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: cstgradient,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
            "PROFILE",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height/10,),
             Stack(
               children: [
                 Center(
                   child: CircleAvatar(
                     backgroundColor:Color(0xff16403B),
                     radius: 50,

                     child: Container(
                       height: 70,
                       width: 60,
                       decoration: BoxDecoration(
                        image: DecorationImage(
                            image:  AssetImage("assets/icons/profile-thin.png",),

                        )
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 180,top: 70),
                   child: IconButton(onPressed:() {

                   },
                       icon: Image.asset("assets/icons/edit.png",scale: 13,)

                   ),
                 )
               ],

             ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Column(
                      children: [
                        TextField(
                          controller: TextEditingController(text: userName),
                          decoration: InputDecoration(
                            label: Text("USER NAME",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: Colors.white),),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                          ),

                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: TextEditingController(text: phoneNumber),
                          decoration: InputDecoration(
                            label: Text("PHONE NUMBER",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: Colors.white),),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                          ),
                          readOnly:true ,

                        ),
                        SizedBox(height: 10,),
                        TextField(

                          decoration: InputDecoration(
                            label: Text("PLACE",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: Colors.white),),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 25,),
              SizedBox(
                height: height/15,
                width: width/3,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("SAVE",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: green,

                  ),

                ),
              )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

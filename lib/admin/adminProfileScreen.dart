import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constant_color.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
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
                SizedBox(height:10,),
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
                          icon: Icon(Icons.add_a_photo_outlined,color: textColor,)
                        // Image.asset("assets/icons/edit.png",scale: 13,)

                      ),
                    )
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(

                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              label: Text("USER NAME",style: TextStyle(fontFamily: "muktaregular",fontSize: 15,color: Colors.white),),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                          ),

                        ),
                        // SizedBox(height: 10,),
                        TextField(
                          decoration: InputDecoration(
                              label: Text("DESIGNATION",style: TextStyle(fontFamily: "muktaregular",fontSize: 15,color: Colors.white),),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                          ),

                        ),
                        // SizedBox(height: 10,),
                        TextField(
                          decoration: InputDecoration(
                              label: Text("PLACE",style: TextStyle(fontFamily: "muktaregular",fontSize: 15,color: Colors.white),),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                          ),

                        ),
                        TextField(
                          decoration: InputDecoration(
                              label: Text("PHONE NUMBER",style: TextStyle(fontFamily: "muktaregular",fontSize: 15,color: Colors.white),),
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                          ),

                        ),
                        SizedBox(height: 10,),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
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

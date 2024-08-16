import 'package:decora/Designer/uploadWorkScreen.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constant_color.dart';
import '../constants/constant_color.dart';
import 'designerProfileScreen.dart';

class NewEnquiryScreen extends StatelessWidget {
  const NewEnquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
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
            "ENQUIRY",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      drawer: Drawer(
        backgroundColor: cstgreen,
        child: ListView(
          children: [

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFCBB480),
                    Color(0xff16403B),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide.none,
                  ),
                  color: Colors.transparent, // Make the background transparent
                ),

                accountName: Text(
                  "Nandhitha",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "muktaregular",
                    fontSize: 20,
                  ),
                ),
                accountEmail: Text(
                  "nandhithampnandhu@gmail.com",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "muktaregular",
                    fontSize: 16,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/icons/profile-thin.png"),
                  backgroundColor: cstgreen,
                ),
              ),
            ),
            // Container(color: Colors.red,height: 5,),
            ListTile(
              leading: Image.asset("assets/icons/profile-thin.png", scale: 15),
              title: Text(
                "PROFILE",
                style: TextStyle(
                  fontFamily: "philosopher",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DesignerProfileScreen(),
                )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.upload,color: textColor,),
              title: Text(
                "UPLOAD WORK",
                style: TextStyle(
                  fontFamily: "philosopher",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder:(context) => UploadWorkScreen(),
                )
                );
              },
            ),
            ListTile(
              leading: Image.asset("assets/icons/signout.png", scale: 5),
              title: Text(
                "SIGN OUT",
                style: TextStyle(
                  fontFamily: "philosopher",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                // padding: EdgeInsets.zero,
                itemCount: 5,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return  Container(
                    height: height/4.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: textColor,
                    ),margin: EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/PROFILE.jpg"),
                                radius: 45,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nithina",style: TextStyle(fontFamily: "philosopher",fontSize: 18),),
                                  Text("Kozhikode",style: TextStyle(fontFamily: "philosopher",fontSize: 18),),
                                  Text("9876543210",style: TextStyle(fontFamily: "philosopher",fontSize: 18),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:55),
                          child: Row(
                            children: [
                              Expanded(
                                child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                                  child: Text("Approve",style: TextStyle(color: Colors.black,fontFamily: "muktaregular"),),

                                  onPressed: () {
                                    _showAlertDialog(context,"Approve");
                                  },
                                )

                              ),
                              SizedBox(width: 30,),
                              Expanded(
                                child:
                                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                                  child: Text("Reject",style: TextStyle(color: Colors.black,fontFamily: "muktaregular"),),

                                  onPressed: () {
                                    _showAlertDialog(context,"Reject");
                                  },
                                )

                              )
                            ],
                          ),
                        ),


                      ],
                    ),
                  );
                },

              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 65,
          width: 350,
          color: green,

          child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 70,top: 10),
                child: InkWell(onTap:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewEnquiryScreen(),));
                },
                  child: Column(
                    children: [
                      Icon(Icons.home,color:Colors.white,),
                      Text("Home",style: TextStyle(
                          color: Colors.white,fontFamily: "allerta"
                      ),),
                    ],
                  ),
                ),
              ),

              InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UploadWorkScreen(),));
              },
                child: Padding(
                  padding: const EdgeInsets.only(right:80,top: 10),
                  child: Column(
                    children: [
                      // Image.asset("assets/icons/like.png",scale: 7,color:  textColor,),

                      Icon(Icons.upload,color:  textColor,),
                      Text("Work",style: TextStyle(
                          color:  textColor,fontFamily: "allerta"
                      ),),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10),
                child: InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  DesignerProfileScreen(),));
                },
                  child: Column(
                    children: [
                      Icon(Icons.account_circle_outlined,color:textColor,),
                      Text("Profile",style: TextStyle(
                          color:  textColor,fontFamily: "allerta"
                      ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }

}

void _showAlertDialog(BuildContext context, String action) {
  showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure you want to $action?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              // Perform the approve or reject action here
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You selected to $action!')),
              );
            },
          ),
        ],
      );
    },
  );
}

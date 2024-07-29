import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constant_color.dart';
import 'designerProfile.dart';

class ConnectDesigners extends StatelessWidget {
  const ConnectDesigners({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
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
              "CONNECT WITH DESIGNERS",
              style: TextStyle(fontFamily: "tradeWinds", fontSize: 15,color:Color(0xff16403B)),
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
                SizedBox(height: 20,),
      
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 4,
                  physics: ScrollPhysics(),
                  itemBuilder:(context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5,5,5,5),
                      child: Container(

                       height: 100,
                        width: width,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: green,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage("assets/PROFILE.jpg"),

                            ),
                              title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Malhotra",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 20),),
                                  Text("Kozhikode",style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 15),),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) => DesignerProfile(),
                                      ));
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 100,

                                      decoration: BoxDecoration(
                                        color: Color(0xffB6A683),
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Center(child: Text("Connect",style: TextStyle(fontFamily: "mukta",fontSize: 15),)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
              )
      
      
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:decora/constants/call_functions.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      
              Consumer<MainProvider>(
                builder: (context,value,child) {
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: value.designerList.length,
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
                                leading: GestureDetector(
                                  onTap: () {
                                    value.getDesignerDetails(value.designerList[index].id);
                                    callNext(context, DesignerProfile());
                                  },
                                  child:
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.transparent,
                                    child: ClipOval(
                                      child: Image.network(
                                        value.designerList[index].userImage,
                                        fit: BoxFit.fill,
                                        width: 60, // same as double the radius
                                        height: 60,
                                      ),
                                    ),
                                  ),

                                ),
                                  title: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(value.designerList[index].usersName,style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 20),),
                                      Text(value.designerList[index].usersPlace,style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 15),),
                                      Text(value.designerList[index].usersPhoneNumber,style: TextStyle(color: Colors.white,fontFamily: "muktaregular",fontSize: 15),),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                  );
                }
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

import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class VerifyDesignersScreen extends StatelessWidget {
  const VerifyDesignersScreen({super.key});

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
            "DESIGNERS",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return ListView.builder(
                    itemCount: value.designerList.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var item=value.designerList[index];
                      return  Container(
                        height: height/9,
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
                                  child: ClipOval(
                                    child: Image.network(
                                      value.designerList[index].userImage,
                                      fit: BoxFit.fill,
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item.usersName,style: TextStyle(fontFamily: "philosopher",fontSize: 15),),
                                      Text(item.usersPlace,style: TextStyle(fontFamily: "philosopher",fontSize: 15),),
                                      Text(item.usersPhoneNumber,style: TextStyle(fontFamily: "philosopher",fontSize: 15),),
                                    ],
                                  ),
                                ),
                              ],
                            ),



                          ],
                        ),
                      );
                    },

                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }

}


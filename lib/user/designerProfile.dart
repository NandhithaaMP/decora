import 'package:decora/constants/refractorwidgets.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Designer/chatBoxScreen.dart';
import '../constants/constant_color.dart';

class DesignerProfile extends StatelessWidget {
  String login_ID,designerId,usname,usphone,usphoto,receiver_name;
   DesignerProfile({super.key,required this.login_ID,required this.designerId,required this.usname,required this.usphone,required this.usphoto,required this.receiver_name});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color:  Color(0xffCBB480),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          leading: Builder(

            builder: (BuildContext context) {
              return IconButton(
                icon:Icon(Icons.arrow_back_sharp),
                // Image.asset("assets/icons/arrow-back.png",scale: 20, color: green,),
                onPressed: () {
                  Navigator.pop(context);
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),),

        body: SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xffCBB480),
                      Color(0xff415C4C),
                      Color(0xff16403B),
                      Color(0xff16403B),

                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0,
                      0.25,
                      0.35,
                      1
                    ]
                )
            ),
            child: SingleChildScrollView(
              child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              // color: Colors.purple,
                              child:
                              CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(value.designerProfilePic),
                              ),
                            ),

                          ],
                        ),
                        Text(value.designerName,style: TextStyle(fontFamily: "philosopher",fontSize: 30,color: Colors.white),),
                        Text(value.designation,style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on_sharp,color: Colors.white,),
                            Text(value.designerPlace,style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.call,color: Colors.white,),
                            Text(value.designerPhone,style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: height/12,
                          width: width,
                          decoration: BoxDecoration(
                              gradient: cstgradient
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5,right: 8),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Collections",style: TextStyle(fontFamily: "philosopher",fontSize: 30),),

                                ElevatedButton(
                                  onPressed: () {
                                    showAlertDialog(context, "connect", login_ID, designerId, usname, usphone, usphoto,receiver_name);
                                    // showAlertDialog(context, "connect", login_ID, designerId);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: cstgreen,
                                  ),
                                  child: Text("Connect", style: TextStyle(color: Colors.white)),
                                ),

                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: value.designerWork.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5
                            ),
                            itemBuilder:(context, index) {
                              return Container(

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                        image: NetworkImage(value.designerWork[index]),fit: BoxFit.fill
                                    )
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }
              ),
            ),
          ),
        ),
      ),
    );
  }

}

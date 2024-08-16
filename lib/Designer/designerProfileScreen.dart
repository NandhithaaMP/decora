import 'package:decora/Designer/uploadWorkScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';
import 'editDprofile.dart';
import 'newEnquiryScreen.dart';

class DesignerProfileScreen extends StatelessWidget {
  const DesignerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "assets/living_room.webp",
      "assets/small-monochrome-bedroom.jpg",
      "assets/small-monochrome-bedroom.jpg",
      "assets/small-monochrome-bedroom.jpg",
      "assets/small-monochrome-bedroom.jpg",
      "assets/living_room.webp",
      "assets/living_room.webp",
      "assets/living_room.webp", "assets/living_room.webp",
      "assets/small-monochrome-bedroom.jpg",
      "assets/small-monochrome-bedroom.jpg",
      "assets/small-monochrome-bedroom.jpg",
      "assets/small-monochrome-bedroom.jpg",
      "assets/living_room.webp",
      "assets/living_room.webp",
      "assets/living_room.webp",
    ];
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
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.grey,
                              backgroundImage: AssetImage("assets/PROFILE.jpg"),
                            ),
                          ),
                          Positioned(
                            bottom: 1, // Adjust the value as needed
                            right: 6,  // Adjust the value as needed
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) =>EditDProfile() ,));
                              },
                                child: Image.asset("assets/icons/edit.png",scale: 20,color: Colors.black,)
                            ),
                          ),
                        ],
                      ),

                      Text("Malhotra",style: TextStyle(fontFamily: "philosopher",fontSize: 30,color: Colors.white),),
                      Text("Interior Designer",style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_sharp,color: Colors.white,),
                          Text("Kozhikode",style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call,color: Colors.white,),
                          Text("987654321",style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
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
                          padding: const EdgeInsets.only(left: 8.0,top: 5),
                          child: Text("Collections",style: TextStyle(fontFamily: "philosopher",fontSize: 30),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: value.workList.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5
                          ),
                          itemBuilder:(context, index) {
                            return GestureDetector(
                              onTap: () {
                                _showFullScreenImage(context, images[index]);
                              },
                              child: Container(

                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                        image: NetworkImage(value.workList[index].wid),fit: BoxFit.fill
                                    )
                                ),
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
                        Icon(Icons.home,color:textColor,),
                        Text("Home",style: TextStyle(
                            color: textColor,fontFamily: "allerta"
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
                        Icon(Icons.account_circle_outlined,color:Colors.white,),
                        Text("Profile",style: TextStyle(
                            color:  Colors.white,fontFamily: "allerta"
                        ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }
}
void _showFullScreenImage(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: InteractiveViewer(
              child: Image.asset(imagePath),
              maxScale: 4.0,
              minScale: 0.5,
            ),
          ),
        ),
      );
    },
  );
}
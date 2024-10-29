import 'package:decora/Designer/uploadWorkScreen.dart';
import 'package:decora/constants/refractorwidgets.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';
import 'editDprofile.dart';
import 'newEnquiryScreen.dart';

class DesignerProfileScreen extends StatelessWidget {
  String userId;
  DesignerProfileScreen({super.key,required this.userId});

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

          // leading: Builder(
          //
          //   builder: (BuildContext context) {
          //     return IconButton(
          //       icon:Icon(Icons.arrow_back_sharp),
          //       // Image.asset("assets/icons/arrow-back.png",scale: 20, color: green,),
          //       onPressed: () {
          //         Navigator.pop(context);
          //       },
          //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          //     );
          //   },
          // ),
        ),

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
                  return Consumer<LoginProvider>(
                    builder: (context,Pvalue,child) {
                      return Column(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Consumer<MainProvider>(
                            builder: (context,value,child) {
                              return Stack(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: CircleAvatar(
                                      radius: 80,
                                      backgroundColor: Colors.grey,
                                      backgroundImage: NetworkImage(Pvalue.loginPhoto),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 1, // Adjust the value as needed
                                    right: 6,  // Adjust the value as needed
                                    child: InkWell(
                                      onTap: () {
                                        value.editUsers(userId);
                                        Navigator.push(context,MaterialPageRoute(builder: (context) =>EditDProfile(user_id: userId,) ,));
                                      },
                                        child: Image.asset("assets/icons/edit.png",scale: 20,color: Colors.black,)
                                    ),
                                  ),
                                ],
                              );
                            }
                          ),

                          // Text("Malhotra",style: TextStyle(fontFamily: "philosopher",fontSize: 30,color: Colors.white),),
                          Text(Pvalue.loginName,style: TextStyle(fontFamily: "philosopher",fontSize: 30,color: Colors.white),),
                          Text(Pvalue.loginType,style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_sharp,color: Colors.white,),
                              Text(Pvalue.loginPlace,style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.call,color: Colors.white,),
                              Text(Pvalue.loginPhoneNumber,style: TextStyle(fontFamily: "philosopher",fontSize: 20,color: Colors.white),),
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

                          Consumer<MainProvider>(
                              builder: (context12,val,child){
                                return
                                val.workList.isNotEmpty ?
                               Padding(
                                padding: const EdgeInsets.all(5),
                                child: GridView.builder(
                                  // padding: EdgeInsets.zero,
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
                                        _showFullScreenImage(context, value.workList[index].workImage);
                                      },
                                      onLongPress: (){
                                        showDeleteConfirmationDialog(context, value.workList[index].wid, "deleteDwork");
                                      },
                                      child: Container(

                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                image: NetworkImage(value.workList[index].workImage),fit: BoxFit.fill,
                                              onError: (exception, stackTrace) {
                                                // If an error occurs, you can handle it here
                                                print('Failed to load image: $exception');
                                              },
                                            )
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                                :SizedBox(
                                  height: 100,
                                  child: Center(child: Text("No works",style: TextStyle(color: Colors.white),)),
                                );
                            }
                          )


                        ],
                      );
                    }
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
void _showFullScreenImage(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var height=MediaQuery.of(context).size.height;
      var width=MediaQuery.of(context).size.width;
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: InteractiveViewer(
              child: Container(
                height: height,
                width: width,
                color: cstgreen,
                child: Image.network(imagePath,
                  fit: BoxFit.contain,
                  height: height,
                  width: width,
                  errorBuilder: (context, error, stackTrace) {
                    // If there's an error loading the image
                    return Center(child: Text("Failed to load image"));
                  },
                ),
              ),

              maxScale: 4.0,
              minScale: 0.5,
            ),
          ),
        ),
      );
    },
  );
}

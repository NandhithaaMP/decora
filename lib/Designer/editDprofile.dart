import 'package:decora/constants/call_functions.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/loginProvider.dart';
import 'designerProfileScreen.dart';

class EditDProfile extends StatefulWidget {
  String user_id;
  EditDProfile({super.key,required this.user_id});

  @override
  State<EditDProfile> createState() => _EditDProfileState();
}

class _EditDProfileState extends State<EditDProfile> {
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
            child:
            Consumer<LoginProvider>(
                builder: (context,value,child) {
                  return Column(
                    children: [
                      SizedBox(height: height/10,),
                      Center(
                        child: Consumer<MainProvider>(
                          builder: (context, value, child) {
                            return GestureDetector(
                              onTap: () {
                                showBottomSheet(context);  // Open the bottom sheet when CircleAvatar is tapped
                              },
                              child: CircleAvatar(
                                backgroundColor: Color(0xff16403B),
                                radius: 50,
                                child: ClipOval(
                                  child: value.addUsersImage != null
                                      ? Image.file(
                                    value.addUsersImage!,
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  )
                                      : Icon(Icons.upload,color:cstyellow, size: 50),
                                ),
                              ),
                            );
                          },
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          child: Column(
                            children: [
                              Consumer<MainProvider>(
                                  builder: (context,value,child) {
                                    return TextField(

                                      controller: value.RegisterNameController,

                                      decoration: InputDecoration(
                                          label: Text("UserName",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color:
                                          // value.loginName.isNotEmpty?
                                          cstgreen
                                            // :Colors.black
                                          ),),
                                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                      ),

                                    );
                                  }
                              ),
                              SizedBox(height: 10,),
                              Consumer<MainProvider>(
                                  builder: (context,value,child) {
                                    return TextField(
                                      controller: value.RegisterPhoneController,
                                      // controller: TextEditingController(),
                                      decoration: InputDecoration(
                                          label: Text("Phone Number",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color:
                                          // value.loginPhoneNumber.isNotEmpty?
                                          cstgreen
                                            // : Colors.black
                                          ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                      ),
                                      readOnly:true ,

                                    );
                                  }
                              ),
                              SizedBox(height: 10,),
                              Consumer<MainProvider>(
                                  builder: (context,value,child) {
                                    return TextField(
                                      // controller: TextEditingController(text:value.loginPlace.isNotEmpty?value.loginPlace:""),
                                      controller: value.PlaceController,
                                      decoration: InputDecoration(
                                          label: Text("Add Your Place",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,
                                            // color:value.loginPlace.isNotEmpty?cstgreen: Colors.black
                                          ),),
                                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                      ),

                                    );
                                  }
                              ),
                              SizedBox(height: 10,),
                              Consumer<MainProvider>(
                                  builder: (context66,value1,child) {
                                    return TextField(
                                      // controller: TextEditingController(text: value.loginAddress.isNotEmpty?value.loginAddress:""),
                                      controller: value1.AddressController,
                                      decoration: InputDecoration(
                                          label: Text("Add Your Address",style: TextStyle(fontFamily: "muktaregular",fontSize: 20,color: value.loginAddress.isNotEmpty?cstgreen:Colors.black),),
                                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black))

                                      ),

                                    );
                                  }
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Consumer<MainProvider>(
                          builder: (context,value,child) {
                            return SizedBox(
                              height: height/15,
                              width: width/3,
                              child: GestureDetector(
                                onTap: () {
                                  showUploadConfirmationDialog(context, value);
                                },
                                child: ElevatedButton(
                                  onPressed: () {
                                    value.addRegistration(context, "EDIT", widget.user_id);

                                    // Navigator.pop(context);
                                  },
                                  child: Text("SAVE",style: TextStyle(color: Colors.white),),
                                  style: ElevatedButton.styleFrom(backgroundColor: green,

                                  ),

                                ),
                              ),
                            );
                          }
                      )


                    ],
                  );
                }
            ),
          ),
        ),
      ),

    );
  }
}
void showBottomSheet(BuildContext context) {
  MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading:  Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.blue,
                ),
                title: const Text('Camera',),
                onTap: () => {
                  mainprovider.UsersgetImagecamera(), Navigator.pop(context)
                }),
            ListTile(
                leading:  Icon(Icons.photo, color: Colors.blue),
                title: const Text('Gallery',),
                onTap: () => {
                  mainprovider.UsersgetImagegallery(),Navigator.pop(context)
                }),
          ],
        );
      });
  // ImageSource
}
void showUploadConfirmationDialog(
    BuildContext context, MainProvider value) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) { // Use dialogContext for the dialog
      return AlertDialog(
        title: const Text("Confirm Upload"),
        content: const Text("Are you sure you want save this?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop(); // Close the dialog
            },
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop(); // Close the dialog

              // Call the upload function (assuming addRegistration is for upload)
              value.addRegistration(context, "EDIT", "your_user_id_here");

              // Use the original context to show the snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Successfully Saved!"),
                  duration: Duration(seconds: 3),
                ),
              );
            },
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );
}



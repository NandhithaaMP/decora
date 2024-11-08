import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';
import 'designerProfileScreen.dart';
import 'newEnquiryScreen.dart';

class UploadWorkScreen extends StatelessWidget {
  String designerId;
  UploadWorkScreen({super.key,required this.designerId});

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
              "UPLOAD WORK",
              style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
            ),
            centerTitle: true,
          ),
        ),

        body: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: GestureDetector(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child: Container(
                      height: height/3.5,
                      width: width,
                      color: Colors.white70,
                      child:value.addWorkFileImg!=null?Image.file(value.addWorkFileImg!,fit: BoxFit.fill,) :Icon(Icons.upload),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // value.addDesignerWork();
                    showUploadConfirmationDialog(context,value);
                  },
                  child: Container(
                    height: height/15,
                    width: width/3,
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(15)
                  ),
                    child: Center(child: Text("Save")),
                  ),
                )
              ],
            );
          }
        ),


      );

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
                    mainprovider.DesignerImgCamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.blue),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.DesignerImgGallery(),Navigator.pop(context)
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
      builder: (BuildContext dialogContext) { // Use a separate context for the dialog
        return AlertDialog(
          title: const Text("Confirm Upload"),
          content: const Text("Are you sure you want to upload this work?"),
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
                await value.addDesignerWork(designerId);// Upload work

                // Show the snackbar using the main context
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Image uploaded successfully!"),
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

}

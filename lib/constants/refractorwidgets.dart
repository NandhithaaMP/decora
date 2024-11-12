import 'package:decora/constants/call_functions.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/chatProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Designer/chatBoxScreen.dart';
import '../provider/mainProvider.dart';

Widget btn (double height,double width,Color mycolor,double radius ){
  return Container(
    height:height ,
    width:width ,
    decoration: BoxDecoration(
      color: mycolor,borderRadius: BorderRadius.circular(radius)
    ),
  );
}
Widget registerField(
    double containerRadius,
    String text,
    IconData prefixIcon,
    double borderRadius,
    double focusBorder,
    double enabledBorder) {
  return Container(
    decoration: BoxDecoration(
      color: gradientgreen,
      borderRadius: BorderRadius.circular(containerRadius),
    ),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: text,labelStyle:TextStyle(
          color: Colors.white,
          fontFamily: "muktaregular",
          fontWeight: FontWeight.w500),
        prefixIcon: Icon(
          prefixIcon,color: cstyellow,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(focusBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(enabledBorder),
        ),
      ),
    ),
  );
}

// Widget textWidPopins(String text, Color colors, double textsize, FontWeight fontWeight ) {
//   return Text(
//       text,
//       style: GoogleFonts.poppins(
//           fontSize: textsize,  // Ensure textsize is a double
//           color: colors,
//           fontWeight: fontWeight,
//           ),
//   );
//   textWidPopins(
//     item.name,
//     cl202020,
//     12,
//     FontWeight.w500,
//   ),
// }


// void showAlertDialog(BuildContext context, String action,String login_Id,String receiver_Id) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Confirmation"),
//         content: Text("Do you want to connect with designer?"),
//         actions: <Widget>[
//           TextButton(
//             child: Text("Cancel"),
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog and stay on the same screen
//             },
//           ),
//           Consumer<MainProvider>(
//               builder: (context1,value1,child) {
//                 return Consumer<ChatProvider>(
//                   builder: (context2,value2,child) {
//                     return TextButton(
//                       child: Text("Yes"),
//                       onPressed: () {
//                         value2.fetchUserMessages(login_Id, receiver_Id);
//                         callNext(context, ChatScreen(login_Id: login_Id, receiver_Id: receiver_Id,));
//                         // Navigator.of(context).pop(); // Close the first dialog
//                         // showAlertConformationDialog(context, action); // Show the confirmation dialog
//                       },
//                     );
//                   }
//                 );
//               }
//           ),
//         ],
//       );
//     },
//   );
// }

// ------------------------------------------------------------------------------------------------
void showAlertDialog(BuildContext context, String action, String login_Id, String receiver_Id) async {

  // Check if connection exists
  bool isConnected = await checkIfConnected(login_Id, receiver_Id);

  if (isConnected) {
    // If already connected, directly navigate to the ChatScreen
    callNext(context, ChatScreen(login_Id: login_Id, receiver_Id: receiver_Id));
  } else {
    // If not connected, show the alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text("Do you want to connect with the designer?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog and stay on the same screen
              },
            ),
            Consumer<MainProvider>(
                builder: (context1, value1, child) {
                  return Consumer<ChatProvider>(
                      builder: (context2, value2, child) {
                        return TextButton(
                          child: Text("Yes"),
                          onPressed: () async {
                            // Save the connection to avoid showing the dialog again
                            await saveConnection(login_Id, receiver_Id);
                            value2.fetchUserMessages(login_Id, receiver_Id);
                            callNext(context, ChatScreen(login_Id: login_Id, receiver_Id: receiver_Id));
                          },
                        );
                      }
                  );
                }
            ),
          ],
        );
      },
    );
  }
}


Future<bool> checkIfConnected(String login_Id, String receiver_Id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('$login_Id-$receiver_Id') ?? false;
}

Future<void> saveConnection(String login_Id, String receiver_Id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('$login_Id-$receiver_Id', true);
}


// ------------------------------------------------------------------------------------------------
// void showAlertConformationDialog(BuildContext context, String action) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Final Confirmation"),
//         content: Text("You have chosen to $action. Are you sure?"),
//         actions: <Widget>[
//           TextButton(
//             child: Text("Cancel"),
//             onPressed: () {
//               Navigator.of(context).pop(); // Close this dialog and stay on the same screen
//             },
//           ),
//           TextButton(
//             child: Text("Yes"),
//             onPressed: () {
//               callNext(context, ChatScreen());
//               // Navigator.of(context).pop(); // Close the confirmation dialog
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('You selected to $action!')),
//               );
//             },
//           ),
//         ],
//       );
//     },
//   );
// }


void showDeleteConfirmationDialog(BuildContext context, String id,String  from) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Are you sure you want to delete?"),
        content: Text("This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text("Cancel"),
          ),
          Consumer<MainProvider>(
              builder: (context,value,child) {
                return ElevatedButton(
                  onPressed: () {
                    if(from=="deleteDwork"){
                      value.deleteDesignerWork(id, context);
                    }
                    else if(from=="deleteProduct"){
                      value.deleteProduct(id, context);
                    }
                    else if(from=="deleteCategory") {
                     value.deleteCategory(id, context);
                    }

                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Delete"),
                );
              }
          ),
        ],
      );
    },
  );
}

// void showUploadConfirmationDialogg(BuildContext context,String id,String from) {
//   showDialog(
//     context: context,
//     builder: (BuildContext dialogContext) { // Use a separate context for the dialog
//       return AlertDialog(
//         title: const Text("Confirm Upload"),
//         content: const Text("Are you sure you want to upload this?"),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(dialogContext).pop(); // Close the dialog
//             },
//             child: const Text("No"),
//           ),
//           Consumer<MainProvider>(
//             builder: (context,value,child) {
//               return TextButton(
//                 onPressed: () async {
//                   if(from=="uploadProduct"){
//                     value.addProduct();
//                   }
//                   else if(from=="uploadDwork"){
//                     value.addDesignerWork(id);
//                   }
//                   Navigator.of(dialogContext).pop(); // Close the dialog
//                   // Show the snackbar using the main context
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text("Successfully Uploaded!"),
//                       duration: Duration(seconds: 3),
//                     ),
//                   );
//                 },
//                 child: const Text("Yes"),
//               );
//             }
//           ),
//         ],
//       );
//     },
//   );
// }
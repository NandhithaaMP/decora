import 'package:decora/Designer/newEnquiryScreen.dart';
import 'package:decora/Designer/uploadWorkScreen.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/chatProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'designerProfileScreen.dart';

class DesignerBottomNavigation extends StatefulWidget {
  String userId,name,phone,receiver_ID,photo;
  DesignerBottomNavigation({super.key,required this.userId,required this.name,required this.phone,required this.receiver_ID,required this.photo
  });

  @override
  State<DesignerBottomNavigation> createState() => _DesignerBottomNavigationState();
}

class _DesignerBottomNavigationState extends State<DesignerBottomNavigation> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  int indexNum=0;
  List<Widget> getScreens(){
    return [
      // Consumer<ChatProvider>(
      //   builder: (context,value,child) {
      //     // value.fetchMsgFromUser(widget.userId, widget.receiver_ID);
      //     value.fetchLastMessagesForDesigner(widget.userId);
      //     return NewEnquiryScreen(userId: widget.userId, name: widget.name, phone: widget.phone, receiverId: widget.receiver_ID, photo: '',);
      //   }
      // ),
      NewEnquiryScreen(userId: widget.userId, name: widget.name, phone: widget.phone, receiverId: widget.receiver_ID, photo: '',),
      UploadWorkScreen(designerId: widget.userId,),
      DesignerProfileScreen(userId: widget.userId,),
    ];
  }
  @override
  Widget build(BuildContext context) {
    var Screens = getScreens();
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(

        backgroundColor: cstgreen,
        selectedItemColor: cstyellow,
        unselectedItemColor: cstText,
        unselectedLabelStyle: TextStyle(fontFamily: "mochiy", fontSize: 10,color:Color(0xff16403B)),
        selectedLabelStyle: TextStyle(fontFamily: "tradeWinds",fontSize: 15,color: cstyellow,),

        items:[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: cstgreen
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: "Work",
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: "Profile",
              backgroundColor: Colors.yellow
          )
        ],
        currentIndex: indexNum,
        onTap: (int index) {
          setState(() {
            indexNum=index;
          });
        },

      ),
      body: Screens[indexNum],
    );
  }
}
















// import 'package:decora/Designer/uploadWorkScreen.dart';
// import 'package:decora/constants/constant_color.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../admin/AdminHomeScreen.dart';
//
// import 'designerProfileScreen.dart';
// import 'newEnquiryScreen.dart';
//
// class DBottomNav extends StatefulWidget {
//   const DBottomNav({super.key});
//
//   @override
//   State<DBottomNav> createState() => _DBottomNavState();
// }
//
// class _DBottomNavState extends State<DBottomNav> {
//   int indexNum = 0;
//   final List<Widget>pages=[
//     NewEnquiryScreen(),
//     UploadWorkScreen(),
//     DesignerProfileScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//             backgroundColor: cstyellow,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.upload),
//             label: "Work",
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_outlined),
//             label: "Profile",
//             backgroundColor: Colors.blue,
//           ),
//         ],
//         currentIndex: indexNum,
//         onTap: (int index){
//           setState(() {
//             indexNum=index;
//           });
//         }
//       ),
//       body:pages[indexNum]
//
//     );
//   }
// }

import 'package:decora/Designer/uploadWorkScreen.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../admin/AdminHomeScreen.dart';

import 'designerProfileScreen.dart';
import 'newEnquiryScreen.dart';

class DBottomNav extends StatefulWidget {
  const DBottomNav({super.key});

  @override
  State<DBottomNav> createState() => _DBottomNavState();
}

class _DBottomNavState extends State<DBottomNav> {
  int indexNum = 0;
  final List<Widget>pages=[
    NewEnquiryScreen(),
    UploadWorkScreen(),
    DesignerProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: cstyellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: "Work",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Profile",
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: indexNum,
        onTap: (int index){
          setState(() {
            indexNum=index;
          });
        }
      ),
      body:pages[indexNum]

    );
  }
}

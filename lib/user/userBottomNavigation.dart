import 'package:decora/constants/constant_color.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:decora/user/homepageScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBottomNavigation extends StatefulWidget {
  String user_Name,phone_Number,pass_word,place_,address_,userId;
   UserBottomNavigation({super.key,
     required this.user_Name,required this.phone_Number,required this.pass_word,required this.place_,required this.address_,required this.userId
   });

  @override
  State<UserBottomNavigation> createState() => _UserBottomNavigationState();
}

class _UserBottomNavigationState extends State<UserBottomNavigation> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  int indexNum=0;
  List<Widget> getScreens(){
    return [
      UserHomePage(user_Name: widget.user_Name, phone_Number: widget.phone_Number, pass_word: widget.pass_word, place_: widget.place_, address_: widget.address_, userId: widget.userId,),
      WishList(),
      CartScreen(userId: widget.userId,),
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
                icon: Icon(Icons.favorite_border),
              label: "Wish",
              backgroundColor: Colors.red
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
              label: "Cart",
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

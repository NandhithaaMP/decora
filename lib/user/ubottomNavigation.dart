// import 'package:decora/user/wishListScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'cartScreen.dart';
// import 'homepageScreen.dart';
//
// class UBottomNavigation extends StatefulWidget {
//   const UBottomNavigation({super.key});
//
//   @override
//   State<UBottomNavigation> createState() => _UBottomNavigationState();
// }
//
// class _UBottomNavigationState extends State<UBottomNavigation> {
//   int indexNum=0;
//   final List<Widget>pages=[
//     HomePage(),
//     WishList(),
//     CartScreen()
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//             backgroundColor: Colors.pink
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset("assets/icons/like.png",scale: 8,color: Colors.black,),
//             label: "WishList",
//             backgroundColor: Colors.red
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart_outlined),
//               // Image.asset("assets/icons/like.png",scale: 10,),
//               label: "WishList",
//             backgroundColor: Colors.yellow
//           )
//         ],
//         currentIndex: indexNum,
//         onTap: (int index){
//           setState(() {
//             indexNum=index;
//           });
//         },
//       ),
//       body: pages[indexNum],
//     );
//   }
// }

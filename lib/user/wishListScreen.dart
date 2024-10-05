// import 'dart:ui';
//
// import 'package:decora/constants/constant_color.dart';
// import 'package:decora/provider/mainProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'cartScreen.dart';
// import 'homepageScreen.dart';
//
// class WishList extends StatefulWidget {
//   final String productName;
//   final String productImage;
//   final String productPrice;
//   const WishList(
//       {super.key,
//       required this.productName,
//       required this.productImage,
//       required this.productPrice});
//
//   @override
//   State<WishList> createState() => _WishListState();
// }
//
// class _WishListState extends State<WishList> {
//   void initState() {
//     super.initState();
//     // Fetch the wishlist once when the widget is first built
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<MainProvider>(context, listen: false).getWishList();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor: Color(0xff16403B),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: cstgradient,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//           ),
//           title: Text(
//             "WISH LIST",
//             style: TextStyle(
//                 fontFamily: "tradeWinds",
//                 fontSize: 20,
//                 color: Color(0xff16403B)),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: SizedBox.expand(
//         child: Container(
//           decoration: BoxDecoration(gradient: screenGradient),
//           child: SingleChildScrollView(
//             child: Consumer<MainProvider>(
//               builder: (context,value,child) {
//                 if(value.wishList.isEmpty){
//                   return Center(
//                     child: Text("No items in wishlist"),
//                   );
//                 }
//                 return Column(
//                   children: [
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: value.wishList.length,
//                       physics: ScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         value.getWishList();
//                         final wishItem=value.wishList[index];//get the wishlist item
//                         final imageurl=wishItem.productImage??'';// Default to an empty string if null
//                         final productName=wishItem.productName??'Unknown Product';
//                         final productPrice=wishItem.productPrice??'0';
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                               height: height/7,
//                               width: width,
//                               decoration: BoxDecoration(color: Color(0xffB6A683)),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.all(8),
//                                         child: imageurl.isNotEmpty?Image.network(imageurl,fit: BoxFit.cover,height: height/10,width: width/5,
//                                         errorBuilder: (context, error, stackTrace) {
//                                           return Icon(Icons.error);
//                                         },
//                                         ):Icon(Icons.image,size: 80,)
//                                           // productImage,
//                                           // fit: BoxFit.cover,
//                                           // height: height/10,
//                                           // width: width/5,
//                                         ),
//                                      ),
//                                       Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             // SizedBox(height: 5,),
//                                             Text(
//                                               widget.productName,
//                                               style: TextStyle(
//                                                   fontFamily: "muktamedium",
//                                                   fontSize: 20),
//                                             ),
//                                             Text(
//                                               widget.productPrice,
//                                               style: TextStyle(
//                                                   fontFamily: "muktamedium",
//                                                   fontSize: 20),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(right: 10),
//                                     child: GestureDetector(
//                                         onTap: () {
//                                           _showAlertDialog(context, "Delete");
//                                         },
//                                         child: Image.asset(
//                                           "assets/icons/delete.png",
//                                           scale: 20,
//                                         )),
//                                   ),
//                                 ],
//                               )
//                         );
//                          // );
//                       },
//                     )
//                   ],
//                 );
//               }
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//           height: 65,
//           width: 350,
//           color: green,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 70, top: 10),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => UserHomePage(),
//                         ));
//                   },
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.home,
//                         color: textColor,
//                       ),
//                       Text(
//                         "Home",
//                         style:
//                             TextStyle(color: textColor, fontFamily: "allerta"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => WishList(
//                           productName: widget.productName,
//                           productImage: widget.productImage,
//                           productPrice: widget.productPrice,
//                         ),
//                       ));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 80, top: 10),
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         "assets/icons/like.png",
//                         scale: 7,
//                         color: Colors.white,
//                       ),
//                       Text(
//                         "wish",
//                         style: TextStyle(
//                             color: Colors.white, fontFamily: "allerta"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CartScreen(),
//                         ));
//                   },
//                   child: Column(
//                     children: [
//                       Icon(
//                         Icons.shopping_cart_outlined,
//                         color: textColor,
//                       ),
//                       Text(
//                         "Cart",
//                         style:
//                             TextStyle(color: textColor, fontFamily: "allerta"),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
//
// void _showAlertDialog(BuildContext context, String action) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Confirmation"),
//           content: Text("Are you sure want to $action"),
//           actions: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text("Cancel")),
//             TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("You selected to $action!")),
//                   );
//                 },
//                 child: Text("Yes"))
//           ],
//         );
//       });
// }
//
//
//
//
import 'dart:ui';
import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cartScreen.dart';
import 'homepageScreen.dart';

class WishList extends StatefulWidget {
   // String productName;
   // String productImage;
   // String productPrice;

  const WishList({
    super.key,
    // required this.productName,
    // required this.productImage,
    // required this.productPrice,
  });

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  void initState() {
    super.initState();

    // Fetch the wishlist once when the widget is first built
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Provider.of<MainProvider>(context, listen: false).getWishList();
    // });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: const Color(0xff16403B),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: cstgradient,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          title: const Text(
            "WISH LIST",
            style: TextStyle(
              fontFamily: "tradeWinds",
              fontSize: 20,
              color: Color(0xff16403B),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: Consumer<MainProvider>(
            builder: (context, value, child) {
              if (value.wishList.isEmpty) {
                return const Center(
                  child: Text("No items in wishlist"),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: value.wishList.length,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  var wishItem = value.wishList[index];  // Get the wishlist item
                  String productName = wishItem.productName ?? 'Unknown Product';  // Fallback for product name
                  String productPrice = wishItem.productPrice ?? '0';  // Fallback for product price
                  String productImage = wishItem.productImage ?? 'Cannot load image ';  // Fallback for product price

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height / 7,
                      width: width,
                      decoration: const BoxDecoration(color: Color(0xffB6A683)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  productImage, // Use your desired image
                                  fit: BoxFit.cover,
                                  height: 90,
                                  width: 90,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productName,
                                      style: const TextStyle(
                                        fontFamily: "muktamedium",
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      '\$' + productPrice,
                                      style: const TextStyle(
                                        fontFamily: "muktamedium",
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                // value.deleteWishList(value.wishList[index].id);
                                _showAlertDialog(context, "Delete");
                              },
                              child: Image.asset(
                                "assets/icons/delete.png",
                                scale: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 65,
      //   width: 350,
      //   color: green,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(right: 70, top: 10),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) =>  UserHomePage(
      //                   // userId: '',
      //                 ),
      //               ),
      //             );
      //           },
      //           child: Column(
      //             children: const [
      //               Icon(
      //                 Icons.home,
      //                 color: textColor,
      //               ),
      //               Text(
      //                 "Home",
      //                 style: TextStyle(color: textColor, fontFamily: "allerta"),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => WishList(
      //                 // productName: widget.productName,
      //                 // productImage: widget.productImage,
      //                 // productPrice: widget.productPrice,
      //               ),
      //             ),
      //           );
      //         },
      //         child: Padding(
      //           padding: const EdgeInsets.only(right: 80, top: 10),
      //           child: Column(
      //             children: [
      //               Image.asset(
      //                 "assets/icons/like.png",
      //                 scale: 7,
      //                 color: Colors.white,
      //               ),
      //               const Text(
      //                 "Wish",
      //                 style: TextStyle(color: Colors.white, fontFamily: "allerta"),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.only(top: 10),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => CartScreen(),
      //               ),
      //             );
      //           },
      //           child: Column(
      //             children: const [
      //               Icon(
      //                 Icons.shopping_cart_outlined,
      //                 color: textColor,
      //               ),
      //               Text(
      //                 "Cart",
      //                 style: TextStyle(color: textColor, fontFamily: "allerta"),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void _showAlertDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: Text("Are you sure you want to $action?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("You removed product from wishlist!")),
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



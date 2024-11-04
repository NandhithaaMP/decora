// import 'package:decora/constants/constant_color.dart';
// import 'package:decora/provider/mainProvider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'orderDetailsScreen.dart';
//
// class MyOrder extends StatelessWidget {
//   const MyOrder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: green,  // Ensure green is defined in constants
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor: Color(0xffCBB480),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: cstgradient,  // Ensure cstgradient is defined in constants
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(5),
//                 bottomRight: Radius.circular(5),
//               ),
//             ),
//           ),
//           title: Text(
//             "MY ORDER",
//             style: TextStyle(
//               fontFamily: "tradeWinds",
//               fontSize: 20,
//               color: Color(0xff16403B),
//             ),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             Container(
//               height: height / 15,
//               width: width,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   SizedBox(width: 20),
//                   Icon(Icons.search_rounded),
//                   SizedBox(width: 15),
//                   Text(
//                     "Search Your Order here.....",
//                     style: TextStyle(
//                       fontFamily: "muktaregular",
//                       color: Colors.black26,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10),
//             Expanded(
//               child: Consumer<MainProvider>(
//                 builder: (context, value, child) {
//                   return
//
//
//                     ListView.builder(
//                     itemCount: value.orderList.length,
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) {
//                       var order = value.orderList[index];
//                       String productId = order.pid;
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           height: height / 8,
//                           width: width,
//                           decoration: BoxDecoration(
//                             color: Color(0xffB6A683),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8),
//                                 child: Container(
//                                   height: height / 8,
//                                   width: width / 5,
//                                   decoration: BoxDecoration(
//                                     color: Colors.grey,
//                                     image: DecorationImage(
//                                       image: NetworkImage(order.productImage),
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     order.productName,
//                                     style: TextStyle(
//                                       fontFamily: "muktamedium",
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                   Text(
//                                     "Qty : ${value.countBuyController[productId]?.text ?? "0"}",
//                                     style: TextStyle(
//                                       fontFamily: "muktamedium",
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                   Text(
//                                     "${value.totalPriceBuyController[productId]?.text ?? "0.00"}",
//                                     style: TextStyle(
//                                       fontFamily: "muktamedium",
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:decora/constants/constant_color.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'orderDetailsScreen.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: green,  // Ensure green is defined in constants
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Color(0xffCBB480),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: cstgradient,  // Ensure cstgradient is defined in constants
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          title: Text(
            "MY ORDER",
            style: TextStyle(
              fontFamily: "tradeWinds",
              fontSize: 20,
              color: Color(0xff16403B),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: height / 15,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.search_rounded),
                  SizedBox(width: 15),
                  Text(
                    "Search Your Order here.....",
                    style: TextStyle(
                      fontFamily: "muktaregular",
                      color: Colors.black26,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Consumer<MainProvider>(
                builder: (context, value, child) {
                  // Access the order list retrieved from the getOrder function
                  return ListView.builder(
                    itemCount: value.orderList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var order = value.orderList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Container(
                          height: height / 8,
                          width: width,
                          decoration: BoxDecoration(
                            color: Color(0xffB6A683),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  height: height / 8,
                                  width: width / 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      image: NetworkImage(order["PRODUCT_IMAGE"]),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    order["PRODUCT_NAME"],
                                    style: TextStyle(
                                      fontFamily: "muktamedium",
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "Qty: ${order["PRODUCT_COUNT"]}",
                                    style: TextStyle(
                                      fontFamily: "muktamedium",
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "\$${order["TOTAL_PRICE"].toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontFamily: "muktamedium",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
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
          ],
        ),
      ),
    );
  }
}

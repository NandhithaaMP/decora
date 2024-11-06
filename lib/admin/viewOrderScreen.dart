
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';

class ViewOrderScreen extends StatelessWidget {
  const ViewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: green,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Color(0xff16403B),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: cstgradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
          title: Text(
            "VIEW ORDERS",
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
          child: Column(
            children: [
              SizedBox(height: 10),
              Consumer<MainProvider>(
                builder: (context, oValue, child) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: oValue.allOrdersList.length,
                      itemBuilder: (context, index) {
                        var order = oValue.allOrdersList[index];
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
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
                                    ),
                                    child: Image.network(
                                      order["PRODUCT_IMAGE"],
                                      fit: BoxFit.fill,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(Icons.error, color: Colors.red);
                                      },
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      order["PRODUCT_NAME"] ?? "N/A",
                                      style: TextStyle(
                                        fontFamily: "muktamedium",
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Qty: ${order["PRODUCT_COUNT"] ?? '0'}",
                                      style: TextStyle(
                                        fontFamily: "muktamedium",
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      // "\$${(order["TOTAL_PRICE"] as num).toStringAsFixed(2)}",
                                      "\$${(order["TOTAL_PRICE"])}",
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
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

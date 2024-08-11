import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> recommendation = [
      "assets/lamp1.jpg",
      "assets/lamp2.jpg",
      "assets/lamp3.jpg",
      "assets/lamp4.jpg",
      "assets/lamp5.jpg",
      "assets/lamp6.jpg",
      "assets/lamp7.jpg",
      "assets/lamp8.jpg",
      "assets/lamp9.jpg",
      "assets/lamp10.jpg",
    ];
    List<String> name = [
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
      "Lamp",
    ];
    List<String> price = [
      "₹499",
      "₹499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
      "₹ 499",
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
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
            "VIEW PRODUCT",
            style: TextStyle(
              fontFamily: "tradeWinds",
              fontSize: 20,
              color: Color(0xff16403B),
            ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: screenGradient,
        ),
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Container(
                height: height / 15,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search category",
                    hintStyle: TextStyle(fontFamily: "philosopher"),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    filled: true,
                    fillColor: textColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: height / 20, // Adjust the height according to your design
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(), // Replace with a concrete class
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      height: height / 25,
                      width: width / 4,
                      decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(child: Text("data",style: TextStyle(color: Colors.white),)),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff16403B),
                        Color(0xff807646),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 1),
                    child: Consumer<MainProvider>(
                      builder: (context, value, child) {
                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: value.productList.length,
                          physics: BouncingScrollPhysics(), // Prevents inner scrolling
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 190,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    image: DecorationImage(
                                      image: NetworkImage(value.productList[index].productImage),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Text(
                                  value.productList[index].productName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "philosopher",
                                  ),
                                ),
                                Text(
                                  "₹${value.productList[index].price}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "bakbak",
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

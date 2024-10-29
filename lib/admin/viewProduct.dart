import 'package:decora/admin/viewProductDetails.dart';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/constants/refractorwidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            SizedBox(height: 15),
            SizedBox(
              height: height / 20, // Adjust the height according to your design
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return
                    ListView.builder(
                    // itemCount: value.categoryList.length,
                    itemCount: value.categoryList.length+1,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(), // Replace with a concrete class
                    itemBuilder: (context, index) {

                      final categoryName=index==0?"All":value.categoryList[index - 1].categoryName;

                      final isSelected=value.selectedCategory==categoryName;
                      final buttonColor=isSelected?cstgradient:containerGradient;

                      return GestureDetector(
                        onTap: () {
                          value.filteredSelectedCategory(categoryName,);

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: height / 25,
                            width: width / 4,
                            decoration: BoxDecoration(
                              gradient: buttonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text(categoryName,style: TextStyle(color: Colors.white),)),
                            // child: Center(child: Text(value.categoryList[index].categoryName,style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                      );
                    },
                  );
                }
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
                          itemCount: value.filteredProductsList.length,
                          physics: BouncingScrollPhysics(), // Prevents inner scrolling
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 12,
                            mainAxisExtent: 190,
                          ),
                          itemBuilder: (context, index) {
                            final product=value.filteredProductsList[index];
                            final productItem = value.productList[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                   callNext(context, ViewProductDetails(item: productItem,));

                                  },
                                  onLongPress: () {
                                    showConfirmationDialog(context, value.productList[index].pid);
                                  // showDeleteConfirmationDialog(context, value.productList[index].pid, "deleteProduct");
                                  }
                                  ,
                                  child: Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        image: NetworkImage(product.productImage),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                ),
                                Text(
                                  product.productName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: "philosopher",
                                  ),
                                ),
                                Text(
                                  "₹${product.price}",
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


void showConfirmationDialog(BuildContext context, String productId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirm Action"),
        content: Text("Do you want to edit or delete this item?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Handle the edit action here
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
            ),
            child: Text("Edit"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Show delete confirmation dialog
              showDeleteConfirmationDialog(context, productId, "deleteProduct");
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
            ),
            child: Text("Delete"),
          ),
        ],
      );
    },
  );
}



// Usage example (in a widget):
// ElevatedButton(
//   onPressed: () => showConfirmationDialog(context),
//   child: Text("Show Dialog"),
// ),

import 'dart:ui';
import 'package:decora/constants/call_functions.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/mainProvider.dart';
import 'orderSummaryScreen.dart';


class CartScreen extends StatefulWidget {
  final String userId;
  CartScreen({super.key,
    required this.userId
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    MainProvider mprovider =Provider.of<MainProvider>(context,listen: false);
    mprovider.getGrandTotal(widget.userId);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          backgroundColor:  Color(0xff16403B),

          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: cstgradient,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
            "CART",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient:screenGradient

          ),
          child:  SingleChildScrollView(
            child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  if(value.cartList.isEmpty){
                    return Center(child: Text("Your cart is empty"));
                  }
                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:value.cartList.length ,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          var product=value.cartList[index];
                          String productId=product.pid;
                          double unitPrice=double.parse(product.price);
                          // Initialize controllers for each product
                          mprovider.initController(productId, unitPrice);

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Container(
                                height: height/6,
                                width: width,
                                decoration: BoxDecoration(
                                    color:Color(0xffB6A683)
                                ),
                                child:
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SingleChildScrollView(
                                      child: Row(
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.fromLTRB(8,8,8,8),
                                              // child: Image.asset('assets/sofa4.jpg',),
                                              child: Container(
                                                height: height/8,
                                                width: width/5,

                                                decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    image: DecorationImage(
                                                        image: NetworkImage(value.cartList.isNotEmpty?value.cartList[index].productImage:""),

                                                        fit: BoxFit.fill
                                                    )
                                                ),
                                              )


                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                // Text("Widsor Chair",style: TextStyle(fontFamily: "muktamedium",fontSize: 18),),
                                                Text(value.cartList[index].productName,style: TextStyle(fontFamily: "muktamedium",fontSize: 18),),
                                                // Text("Qty : 1",style: TextStyle(fontFamily: "muktamedium",fontSize: 18),),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text("Qty :",style: TextStyle(fontFamily: "muktamedium",fontSize: 18)),
                                                    // Text("Price :${product.price}",style: TextStyle(fontFamily: "muktamedium",fontSize: 18)),
                                                    IconButton(

                                                      onPressed: () {
                                                        mprovider.decrement(productId, unitPrice, widget.userId);
                                                      },
                                                      icon: Icon(Icons.remove),
                                                      color: Colors.red,
                                                    ),
                                                    Container(
                                                      width: width/10,
                                                      child: TextFormField(
                                                        controller: value.countController[productId],
                                                        readOnly: true,
                                                        style: TextStyle(fontFamily: "muktamedium", fontSize: 18,color: Colors.black),
                                                        // Make it read-only
                                                      ),
                                                    ) ,

                                                    IconButton(
                                                      onPressed: () {
                                                        mprovider.increment(productId, unitPrice, widget.userId) ;
                                                        print("hhhhhhhhhhgvhgvhg ${value.countController[productId]}");
                                                        },
                                                      icon: Icon(Icons.add),
                                                      color: Colors.green,
                                                    ),
                                                  ],
                                                ),
                                                // Text("₹ "+value.cartList[index].price,style: TextStyle(fontFamily: "muktamedium",fontSize: 18),),
                                                Text("Total:₹ ${value.totalPriceController[productId]?.text??0.00}",style: TextStyle(fontFamily: "muktamedium",fontSize: 18),),


                                              ],
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                          onTap: () {
                                            _showAlertDialog(context,"Delete",widget.userId,productId);
                                          },
                                          child: Image.asset("assets/icons/delete.png",scale: 20,)),
                                    ),

                                  ],
                                )

                            ),
                          );
                        },
                      ),
                      SizedBox(height: height/5,),
                      Padding(
                        padding: const EdgeInsets.only(left: 30,right: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                // width: 100,
                                decoration: BoxDecoration(
                                    color: Color(0xffB6A683)
                                ),
                                child: Center(child:
                                // Text("Grand Total : ${value.calculateGrandTotal().toStringAsFixed(2)}",style: TextStyle(fontFamily: "muktabold",fontSize: 20,fontWeight: FontWeight.w500),)),
                                Text("Grand Total : ${value.calculateGrandTotal().toStringAsFixed(2)}",style: TextStyle(fontFamily: "muktabold",fontSize: 20,fontWeight: FontWeight.w500),)),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  mprovider.addGrandTotalToUsers(widget.userId);
                                  value.getUsers();
                                  value.addToOrder(widget.userId);
                                  callNext(context, OrderSummaryScreen(userId: widget.userId,));
                                },
                                child: Container(
                                  height: 50,
                                  // width: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xffB6A683)
                                  ),
                                  child: Center(child: Text("Place Order",style: TextStyle(fontFamily: "muktabold",fontSize: 20,fontWeight: FontWeight.w500),)),

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,)
                    ],
                  );
                }
            ),
          ),
        ),
      ),

    );
  }
}
void _showAlertDialog(BuildContext context,String action,String userId,String productId){
  showDialog(context: context, builder: (BuildContext context){

    MainProvider deleteProvider=Provider.of<MainProvider>(context,listen: false);
    return AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure want to $action"),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel")
        ),
        TextButton(
            onPressed: () {
              deleteProvider.deleteProductFromCart(userId, productId);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You selected to $action!")),);
            },
            child: Text("Yes")
        )
      ],
    );

  });
}
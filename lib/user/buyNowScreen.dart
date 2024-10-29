import 'package:decora/models/adminModel.dart';
import 'package:decora/provider/loginProvider.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:decora/user/cartScreen.dart';
import 'package:decora/user/wishListScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import 'orderSummaryScreen.dart';

class BuyNowScreen extends StatefulWidget {
  ProductModel item;
  String userId;
  String userAddress;

  BuyNowScreen({
    super.key,
    required this.item,
    required this.userId,
    required this.userAddress
  });

  @override
  State<BuyNowScreen> createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {

  @override



  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                    bottomRight: Radius.circular(20))),
          ),
          title: Text(
            "BUY NOW",
            style: TextStyle(
                fontFamily: "tradeWinds",
                fontSize: 20,
                color: Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body:
      SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return Column(

                  children: [
                    SizedBox(height: height / 40),

                    Consumer<LoginProvider>(
                      builder: (context11,likeValue,child) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 200),
                          child: Consumer<MainProvider>(
                            builder: (context, value, child) {
                              return GestureDetector(
                                onTap: () {



                                    value.toggleFavorite(widget.userId, widget.item.pid,context);
                                    print("like..................${value.isLiked}");

                                  // else {
                                  //   value.removeFromWishList(widget.userId, widget.item.pid
                                  //   );
                                  //
                                  // }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: likeValue.favProductIdList.contains(widget.item.pid)?textColor:Colors.transparent,
                                      // color: value.isLiked ? textColor : Colors.transparent,
                                      gradient: likeValue.favProductIdList.contains(widget.item.pid) ? null : cstgradient,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Icon(
                                      likeValue.favProductIdList.contains(widget.item.pid) ? Icons.favorite : Icons.favorite_border,
                                      color: cstgreen,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    ),

                    Center(
                      child: Container(
                        height: height / 1.5,
                        width: width / 1.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(120),
                            border: Border.all(width: 2.5, color: Color(0xffE7C780)),
                            color: green,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff16403B).withOpacity(0.6),
                                offset: Offset(-10, 0),
                                blurRadius: 5,
                                spreadRadius: 5,
                              ),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30),
                            Text(widget.item.productName,
                                style: TextStyle(
                                    fontFamily: "mukta",
                                    color: Color(0xffE4A951),
                                    fontSize: 35)),
                            SizedBox(height: 20),
                            Container(
                              height: height / 3,
                              width: width / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(widget.item.productImage),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text("₹ "+widget.item.price,
                                style: TextStyle(
                                    fontFamily: "mukta",
                                    color: Color(0xffE4A951),
                                    fontSize: 35)),
                            // Text("₹ " + widget.productPrice,
                            // Text("₹ " +wiget.productPrice,
                            //     style: TextStyle(
                            //         color: cstyellow,
                            //         fontFamily: "mukta",
                            //         fontSize: 30)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.item.productDescription,style: TextStyle(color: Colors.white,fontFamily: "mukta", fontSize: 15),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: cstgreen,
                    ),
                    SizedBox(height: 5,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Deliver To :",
                                style: TextStyle(color: Colors.black,
                                    fontFamily:"mukta",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Change",
                                style: TextStyle(color: Colors.black,
                                    fontFamily:"mukta",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),)
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          Consumer<LoginProvider>(
                            builder: (context11,logValue,child) {
                              return Text(logValue.loginAddress,
                              // Text("Perinthalmanna , Angadippuram , \nIn harinagar ,House Number 88,Malappuram,pin :679338,kerala,India",
                                style: TextStyle(color: Colors.white,
                                    fontFamily:"muktaregular",
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                              );
                            }
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5,),
                    Container(height: 1,
                      width: double.infinity,
                      color: cstgreen ,),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.delivery_dining_outlined),
                          Text("Delivery By :",
                            style: TextStyle(color: Colors.black,
                                fontFamily:"mukta",
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(" 7 oct,tuesday",
                            style: TextStyle(color: Colors.black,
                                fontFamily:"mukta",
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),

                    Consumer<MainProvider>(builder: (context, value, child) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            InkWell(
                              onTap: () {
                                print(widget.userId+"hhhhhhhhhhhhhhhhhhhhh");
                                value.addToCart(widget.userId, widget.item.pid,widget.item.productImage,widget.item.price,widget.item.productName,);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen(userId: widget.userId)));
                              },
                              child: Container(
                                height: 50,
                                width: width / 3,
                                decoration: BoxDecoration(
                                    gradient: cstgradient,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                    child: Text("Add to cart",
                                        style: TextStyle(
                                            fontFamily: "philosopher",
                                            fontSize: 20,
                                            color: green))),
                              ),
                            ),
                            // SizedBox(width: 10),

                            SizedBox(width: 15),
                            Consumer<MainProvider>(
                              builder: (context1,mprovider,child) {
                                return InkWell(
                                  onTap: () {
                                    var product=widget.item;
                                    String productId=product.pid;
                                    double unitPrice=double.parse(product.price);
                                    // Initialize controllers for each product
                                    mprovider.initBuyController(productId, unitPrice);

                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => OrderSummaryScreen(userId: widget.userId,)));
                                  Scaffold.of(context).showBottomSheet((context) {
                                    return
                                      Container(
                                      height: height/3,
                                      width: width,
                                      decoration: BoxDecoration(
                                        gradient: containerGradient,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                                      ),
                                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(height: 10,),
                                          Center(
                                            child: Text("Are you sure to buy now?",style: TextStyle(fontFamily: "philosopher",
                                                fontSize: 20,
                                                color: cstyellow),),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Container(
                                                  height: height / 6,
                                                  width: width / 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      image: DecorationImage(image: NetworkImage(product.productImage),fit: BoxFit.fill)
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(product.productName,  // Replace with your list data
                                                    style: TextStyle(fontFamily: "muktamedium", fontSize: 18,color: Colors.black),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Qty : ",  // Replace with dynamic data
                                                        style: TextStyle(fontFamily: "muktamedium", fontSize: 18,color: Colors.black),
                                                      ),
                                                      IconButton(

                                                        onPressed: () {
                                                          mprovider.decrementBuy(productId, unitPrice, widget.userId);
                                                        },
                                                        icon: Icon(Icons.remove),
                                                        color: Colors.red,
                                                      ),
                                                      Container(
                                                        width: width/10,
                                                        child: TextFormField(
                                                          controller: mprovider.countBuyController[productId],
                                                          readOnly: true,
                                                          style: TextStyle(fontFamily: "muktamedium", fontSize: 18,color: Colors.black),
                                                          // Make it read-only
                                                        ),
                                                      ) ,

                                                      IconButton(
                                                        onPressed: () {

                                                          mprovider.incrementBuy(productId, unitPrice, widget.userId);
                                                          print("hhhhhhhhhhgvhgvhg ${value.countBuyController[productId]}");
                                                        },
                                                        icon: Icon(Icons.add),
                                                        color: Colors.green,
                                                      ),
                                                    ],
                                                  ),
                                                  Consumer<MainProvider>(
                                                      builder: (context13,val,child) {
                                                      return Text("₹ ${ val.totalPriceBuyController[productId]?.text ?? 0.00}",  // Replace with dynamic data
                                                        style: TextStyle(fontFamily: "muktamedium", fontSize: 18,color: Colors.black),
                                                      );
                                                    }
                                                  ),

                                                  SizedBox(height: 20,),
                                                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Container(
                                                        height: height/20,
                                                        width: width/3,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(20),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "Cancel",style: TextStyle(
                                                            color: Colors.black,
                                                          ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10,),
                                                      GestureDetector(onTap: () {
                                                        value.addToBuyNow(product.productImage, product.productName, product.price, widget.userId,productId);
                                                      },

                                                        child: Container(
                                                          height: height/20,
                                                          width: width/3,
                                                          decoration: BoxDecoration(
                                                            color: Colors.yellow,
                                                            borderRadius: BorderRadius.circular(20),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                                "Place order"
                                                            ),
                                                          ),

                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: width / 3,
                                    decoration: BoxDecoration(
                                        gradient: cstgradient,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Center(
                                        child: Text("Buy Now",
                                            style: TextStyle(
                                                fontFamily: "philosopher",
                                                fontSize: 20,
                                                color: green))),
                                  ),

                                );
                              }
                            ),




                          ]);
                    }),

                    SizedBox(height: 20,),
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

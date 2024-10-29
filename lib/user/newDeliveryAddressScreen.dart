
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/refractorwidgets.dart';
import 'orderDetailsScreen.dart';

class NewDeliveryAddress extends StatefulWidget {
  const NewDeliveryAddress({super.key});

  @override
  State<NewDeliveryAddress> createState() => _NewDeliveryAddressState();
}

class _NewDeliveryAddressState extends State<NewDeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: green,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBar(
            backgroundColor:  Color(0xffCBB480),

            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: cstgradient,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
            ),
            title: Text(
              "NEW DELIVERY ADDRESS",
              style: TextStyle(fontFamily: "tradeWinds", fontSize: 18,color:Color(0xff16403B)),
            ),
            centerTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [
              registerField(20, "Full Name", Icons.person_outline_outlined, 20, 20, 20),
              SizedBox(height: 20,),
              registerField(20, "Phone number", Icons.add_ic_call, 20, 20, 20),
            
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: height / 13,
                      decoration: BoxDecoration(
                        color: gradientgreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "muktaregular",
                        ),
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.pin_outlined,color: cstyellow,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          labelText: "PINCODE", // Label text
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "muktaregular",
                              fontWeight: FontWeight.w500,fontSize: 15),
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Space between the fields
                  Expanded(
                    child:
                    Container(
                      height: height / 13,
                      decoration: BoxDecoration(
                        gradient: cstgradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
            
                          Icon(Icons.location_searching,color: cstgreen,),
                          SizedBox(width: 5,),
                          Text("Use my location",style: TextStyle(
                            color: Colors.white,
                            fontFamily: "muktaregular",
                          ),)
                        ],
                      ),

                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child:
                    Container(
                      height: height / 13,
                      decoration: BoxDecoration(
                        color: gradientgreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "muktaregular",
                        ),
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.g,color: cstyellow,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          labelText: "STATE", // Label text
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "muktaregular",
                              fontWeight: FontWeight.w500,fontSize: 15),
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Space between the fields
                  Expanded(
                    child:
                    Container(
                      height: height / 13,
                      decoration: BoxDecoration(
                        color: gradientgreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "muktaregular",
                        ),
                        decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.city,color: cstyellow,),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          labelText: "CITY", // Label text
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: "muktaregular",
                              fontWeight: FontWeight.w500,fontSize: 15),
                          hintStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              registerField(20, "House No,Building Name", Icons.house, 20, 20, 20),
              SizedBox(height: 20,),
              registerField(20, "Road name,Area,Colony", Icons.add_road, 20, 20, 20),
              SizedBox(height: 20,),
              Container(
                height: height / 13,
                width: width/2.5,
                decoration: BoxDecoration(
                  gradient: cstgradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Save",style: TextStyle(
                    color: Colors.white,
                    fontFamily: "muktaregular",
                    fontSize: 20
                  ),),
                ),

              ),
            
            
            
            ]),
          ),
        ));
  }
}
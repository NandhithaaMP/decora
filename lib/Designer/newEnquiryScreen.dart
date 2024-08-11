import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewEnquiryScreen extends StatelessWidget {
  const NewEnquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
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
            "ENQUIRY",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                // padding: EdgeInsets.zero,
                itemCount: 5,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return  Container(
                    height: height/4.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: textColor,
                    ),margin: EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundImage: AssetImage("assets/PROFILE.jpg"),
                                radius: 45,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nithina",style: TextStyle(fontFamily: "philosopher",fontSize: 18),),
                                  Text("Kozhikode",style: TextStyle(fontFamily: "philosopher",fontSize: 18),),
                                  Text("9876543210",style: TextStyle(fontFamily: "philosopher",fontSize: 18),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:55),
                          child: Row(
                            children: [
                              Expanded(
                                child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                                  child: Text("Approve",style: TextStyle(color: Colors.black,fontFamily: "muktaregular"),),

                                  onPressed: () {
                                    _showAlertDialog(context,"Approve");
                                  },
                                )

                              ),
                              SizedBox(width: 30,),
                              Expanded(
                                child:
                                ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                                  child: Text("Reject",style: TextStyle(color: Colors.black,fontFamily: "muktaregular"),),

                                  onPressed: () {
                                    _showAlertDialog(context,"Reject");
                                  },
                                )

                              )
                            ],
                          ),
                        ),


                      ],
                    ),
                  );
                },

              ),
            )
          ],
        ),
      ),
    );
  }

}

void _showAlertDialog(BuildContext context, String action) {
  showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure you want to $action?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              // Perform the approve or reject action here
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('You selected to $action!')),
              );
            },
          ),
        ],
      );
    },
  );
}

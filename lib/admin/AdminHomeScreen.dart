import 'package:decora/constants/constant_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> homeGrid=[
      "Add \nCategory",
      "Add \nProduct",
      "View \nOrders",
      "Verify \nDesigners",
    ];
    return  Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Welcome Nandhitha,",style: TextStyle(color: textColor,),),
      ),
      body: Column(
        children: [


          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              itemCount: 4,
                shrinkWrap: true,
                physics:NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 150

                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:cstText
                    ),
                    child: Center(child: Text(homeGrid[index],style: TextStyle(fontFamily: "philosopher",fontSize: 20),)),
                  );
                },
            ),
          )
        ],
      ),
    );
  }
}

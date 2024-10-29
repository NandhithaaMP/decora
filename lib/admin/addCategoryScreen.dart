import 'package:decora/constants/constant_color.dart';
import 'package:decora/constants/refractorwidgets.dart';
import 'package:decora/provider/mainProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({super.key});

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
              "ADD CATEGORY",
              style: TextStyle(fontFamily: "tradeWinds", fontSize: 20,color:Color(0xff16403B)),
            ),
            centerTitle: true,
          ),
        ),
      floatingActionButton: Consumer<MainProvider>(
        builder: (context,value,child) {
          return FloatingActionButton(
            onPressed: () {
              // String category = '';
            showDialog(context: context, builder: (context) {
              return
                AlertDialog(
                title: Text("Add Category"),
                  content: TextField(
                    controller: value.categorynameController,

              decoration: InputDecoration(
              hintText: "Enter Category" ),
              ),
              actions: [
                TextButton(onPressed: () {
                  Navigator.of(context).pop();
                }, child: Text("Cancel")
              ),
              ElevatedButton(onPressed: () {
                value.addCategory();
                Navigator.of(context).pop();
              }, child: Text("Save")
              )
              ],
              );
            },

            );
            },
            child: Icon(Icons.add),
            // tooltip: 'Increment',
            backgroundColor: textColor,
          );
        }
      ),

      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: screenGradient
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<MainProvider>(
                    builder: (context,value,child) {
                      value.getCategory();
                      return ListView.builder(
                        itemCount: value.categoryList.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return  GestureDetector(
                            onLongPress: () {
                              showDeleteConfirmationDialog(context, value.categoryList[index].id, "deleteCategory");
                            },
                            child: Container(
                              height: height/12,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: textColor,
                                // border: Border.all()
                              ),margin: EdgeInsets.only(bottom: 5),
                                child: Center(child: Text(value.categoryList[index].categoryName
                                ,style: TextStyle(fontFamily: "philosopher",fontSize: 20),)),
                            ),
                          );
                        },

                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  }

// void _showDeleteConfirmationDialog(BuildContext context, MainProvider provider, String id) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text("Are you sure you want to delete?"),
//         content: Text("This action cannot be undone."),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close the dialog
//             },
//             child: Text("Cancel"),
//           ),
//           Consumer<MainProvider>(
//             builder: (context,value,child) {
//               return ElevatedButton(
//                 onPressed: () {
//                   value.deleteCategory(id, context);
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//                 child: Text("Delete"),
//               );
//             }
//           ),
//         ],
//       );
//     },
//   );
// }
// import 'package:decora/Designer/editDprofile.dart';
// import 'package:decora/admin/productScreen.dart';
// import 'package:decora/constants/call_functions.dart';
// import 'package:decora/constants/refractorwidgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart'; // Import the intl package for DateFormat
// import 'package:provider/provider.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../constants/constant_color.dart';
// import '../models/adminModel.dart';
// import '../provider/mainProvider.dart'; // Adjust import as necessary
//
// class AddProductScreen extends StatefulWidget {
//   String from,oldid;
//   AddProductScreen({super.key,
//   required this.from,required this.oldid
//   });
//
//   @override
//   State<AddProductScreen> createState() => _AddProductScreenState();
// }
//
// class _AddProductScreenState extends State<AddProductScreen> {
//
//   DateTime selectedDate = DateTime.now();
//   final DateFormat _dateFormatter = DateFormat('dd MMMM yyyy');
//   String? selectedCategory;
//
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(40),
//         child: AppBar(
//           backgroundColor: Color(0xff16403B),
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: cstgradient,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20))),
//           ),
//           title: Text(
//             "ADD PRODUCT",
//             style: TextStyle(fontFamily: "tradeWinds", fontSize: 20, color: Color(0xff16403B)),
//           ),
//           centerTitle: true,
//         ),
//       ),
//       body: SizedBox.expand(
//         child: Container(
//           decoration: BoxDecoration(gradient: screenGradient),
//           child: SingleChildScrollView(
//             child: Consumer<MainProvider>(
//               builder: (context,value,child) {
//                 return Column(
//                   children: [
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             TextField(
//                               controller: value.productnameController,
//                               decoration: InputDecoration(
//                                 label: Text("PRODUCT NAME", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                             SizedBox(height: 10),
//
//                             Consumer<MainProvider>(
//                                 builder: (context1,val,child) {
//                                   return Autocomplete<CategoryModel>(
//                                     optionsBuilder: (TextEditingValue textEditingValue) {
//                                       return value.categoryList
//                                           .where((CategoryModel item) => item. categoryName
//                                           .toLowerCase()
//                                           .contains(textEditingValue.text.toLowerCase()))
//                                           .toList();
//                                     },
//                                     displayStringForOption: (CategoryModel option) =>
//                                     option.categoryName,
//                                     fieldViewBuilder: (BuildContext context,
//                                         TextEditingController fieldTextEditingController,
//                                         FocusNode fieldFocusNode,
//                                         VoidCallback onFieldSubmitted) {
//                                       WidgetsBinding.instance.addPostFrameCallback((_) {
//                                         fieldTextEditingController.text = val.categoryNameController.text;
//                                       });
//
//                                       return Container(
//                                         height: 50,
//                                         decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(10),
//                                           gradient: containerGradient
//                                           // ,
//                                         ),
//
//                                         child: SizedBox(
//                                           width: MediaQuery.of(context).size.width / 1.1,
//                                           child: TextFormField(
//                                             // cursorColor: Colors.brown,
//                                             maxLines: 1,
//                                             style: const TextStyle(
//                                                 color: Colors.white, fontWeight: FontWeight.w500),
//                                             decoration: InputDecoration(
//                                               focusedBorder: OutlineInputBorder(
//                                                   borderSide: BorderSide.none,
//                                                   borderRadius: BorderRadius.circular(10)
//                                               ),
//
//                                               hintText: "Select Category",
//                                               hintStyle: const TextStyle(
//
//                                                   color: Colors.white,
//                                                   fontSize: 18,
//                                                   height: 4,
//                                                   fontWeight: FontWeight.normal
//                                               ),
//                                               border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.circular(20),
//                                                 borderSide: BorderSide.none,
//
//                                               ),
//                                             ),
//                                             onChanged: (txt) {},
//                                             controller: fieldTextEditingController,
//                                             focusNode: fieldFocusNode,
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                     onSelected: (CategoryModel selection) {
//                                       value.categoryNameController.text = selection.categoryName;
//                                       value.productSelectedcategoryid = selection.id;
//                                     },
//                                     optionsViewBuilder: (BuildContext context,
//                                         AutocompleteOnSelected<CategoryModel> onSelected,
//                                         Iterable<CategoryModel> options) {
//                                       return Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Material(
//                                           child: Container(
//
//                                             decoration: BoxDecoration(
//                                                 // color:Color(0xff0C8290),
//                                               gradient: maingradient,
//                                                 borderRadius: BorderRadius.circular(15)
//                                             ),
//                                             width: 200,
//                                             height: 200,
//                                             child: ListView.builder(
//                                               padding: const EdgeInsets.all(10.0),
//                                               itemCount: options.length,
//                                               itemBuilder: (BuildContext context, int index) {
//                                                 final CategoryModel option = options.elementAt(index);
//
//                                                 return GestureDetector(
//                                                   onTap: () {
//                                                     onSelected(option);
//                                                   },
//                                                   child: Column(
//                                                     children: [
//                                                       Container(
//
//                                                         decoration: BoxDecoration(
//                                                           // borderRadius: BorderRadius.circular(15)
//                                                           // border: Border(left: BorderSide(color: Colors.white,width: .6,
//                                                           // ))
//                                                         ),
//
//                                                         height: 30,
//                                                         width: 200,
//                                                         child: Column(
//                                                             crossAxisAlignment: CrossAxisAlignment.center,
//                                                             mainAxisAlignment: MainAxisAlignment.center,
//                                                             children: [
//                                                               Center(
//                                                                 child: Text(option.categoryName,
//                                                                     style: const TextStyle(
//                                                                       fontFamily: 'muktaregular',
//                                                                       color: Colors.white,
//                                                                     )
//                                                                 ),
//                                                               ),
//                                                             ]),
//                                                       ),
//                                                       Divider(
//                                                         thickness: 1,
//                                                         color: Colors.black,
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 );
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 }
//                             ),
//                             SizedBox(height: 10),
//                             TextField(
//                             controller: value.priceController,
//                               decoration: InputDecoration(
//                                 label: Text("PRICE", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
//                                 prefixText: " ₹",
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//
//                               ),
//                               keyboardType: TextInputType.number,
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.digitsOnly
//                               ],
//
//                             ),
//                             SizedBox(height: 20),
//                             // SizedBox(height: 10),
//                             Row(
//                               children: [
//                                 TextButton.icon(
//                                   onPressed: () =>_showCalendarPicker(context), icon: Icon(Icons.calendar_today_sharp,color: Colors.white,), label: Text("Choose Delivery date", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
//                                 ),
//                                 Text( ' ${_dateFormatter.format(value.selectedDate)}', style: TextStyle(fontSize: 15,color: Colors.white),),
//                               ],
//                             ),
//
//                             SizedBox(height: 20),
//                             Text("UPLOAD IMAGE", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
//                             Consumer<MainProvider>(
//                               builder: (context,value,child) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: InkWell(
//                                     onTap: () {
//                                       showBottomSheet(context);
//                                     },
//                                     child: Container(
//                                       height: height/4,
//                                       width: width,
//                                       color: Colors.grey,
//                                       child: value.addProductFileImg!=null?Image.file(value.addProductFileImg!,fit: BoxFit.fill,): Center(child: Icon(Icons.upload)),
//                                     ),
//                                   ),
//                                 );
//                               }
//                             ),
//                             TextField(
//                               controller: value.productDescriptionController,
//                               decoration: InputDecoration(
//                                 label: Text("PRODUCT DESCRIPTION", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                             TextField(
//                               controller: value.totalProductController,
//                               decoration: InputDecoration(
//                                 label: Text("TOTAL NO OF PRODUCT", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                             TextField(
//                               controller: value.currentStatusContoller,
//                               decoration: InputDecoration(
//                                 label: Text("CURRENT STATUS", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
//                                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                                 focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 25),
//                     SizedBox(
//                       height: height / 15,
//                       width: width / 3,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           showUploadConfirmationDialog(context, value);
//                         },
//                         child: Text("SAVE", style: TextStyle(color: Colors.white)),
//                         style: ElevatedButton.styleFrom(backgroundColor: green),
//                       ),
//                     ),
//                   ],
//                 );
//               }
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showCalendarPicker(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Select Date'),
//           contentPadding: EdgeInsets.all(16.0),
//           content: SizedBox(
//             width: double.minPositive,
//             height: 400,
//             child: TableCalendar(
//               calendarStyle: CalendarStyle(
//                 selectedDecoration: BoxDecoration(
//                   color: Colors.blue,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               headerStyle: HeaderStyle(
//                 formatButtonVisible: false,
//               ),
//               firstDay: DateTime.utc(2010, 10, 16),
//               lastDay: DateTime.utc(2030, 3, 14),
//               focusedDay: selectedDate,
//               selectedDayPredicate: (day) => isSameDay(day, selectedDate),
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   // selectedDate = selectedDay;
//                   context.read<MainProvider>().getDeliveryDate();
//                   // context.read<MainProvider>().updateSelectedDate(selectedDay);
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
//   void showBottomSheet(BuildContext context) {
//     MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
//     showModalBottomSheet(
//         elevation: 10,
//         backgroundColor: Colors.white,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(10.0),
//               topRight: Radius.circular(10.0),
//             )),
//         context: context,
//         builder: (BuildContext bc) {
//           return Wrap(
//             children: <Widget>[
//               ListTile(
//                   leading:  Icon(
//                     Icons.camera_enhance_sharp,
//                     color: Colors.blue,
//                   ),
//                   title: const Text('Camera',),
//                   onTap: () => {
//                     mainprovider.getImgcamera(), Navigator.pop(context)
//                   }),
//               ListTile(
//                   leading:  Icon(Icons.photo, color: Colors.blue),
//                   title: const Text('Gallery',),
//                   onTap: () => {
//                     mainprovider.getImggallery(),Navigator.pop(context)
//                   }),
//             ],
//           );
//         });
//     // ImageSource
//   }
//   void showUploadConfirmationDialog(
//       BuildContext context, MainProvider value) {
//     showDialog(
//       context: context,
//       builder: (BuildContext dialogContext) {
//         return AlertDialog(
//           title: const Text("Confirm Upload"),
//           content: const Text("Are you sure you want to upload this work?"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(dialogContext).pop(); // Close the dialog
//               },
//               child: const Text("No"),
//             ),
//             TextButton(
//               onPressed: () async {
//                 Navigator.of(dialogContext).pop();
//                 // Close the dialog
//
//                 if(widget.from=="NEW"){
//                   await value.addProduct(widget.from, "");
//                 }
//                 else{
//                   await value.addProduct(widget.from, widget.oldid);
//                 }
//                  // Upload work
//
//                 // Show the snackbar using the main context
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text("Image uploaded successfully!"),
//                     duration: Duration(seconds: 3),
//                   ),
//                 );
//
//                 // Navigate to ProductScreen after upload and snackbar
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(builder: (context) => ProductScreen()),
//                 );
//               },
//               child: const Text("Yes"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }
import 'package:decora/admin/productScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/constant_color.dart';
import '../models/adminModel.dart';
import '../provider/mainProvider.dart';

class AddProductScreen extends StatelessWidget {
  DateTime selectedDate = DateTime.now();  // Initialize selectedDate

  String from,oldid;
  String? selectedCategory;
  final DateFormat _dateFormatter = DateFormat('dd MMMM yyyy');


  AddProductScreen({super.key,
  required this.from,required this.oldid
  });

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
            "ADD PRODUCT",
            style: TextStyle(fontFamily: "tradeWinds", fontSize: 20, color: Color(0xff16403B)),
          ),
          centerTitle: true,
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: SingleChildScrollView(
            child: Consumer<MainProvider>(
              builder: (context,value,child) {
                return Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: value.productnameController,
                              decoration: InputDecoration(
                                label: Text("PRODUCT NAME", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              ),
                            ),
                            SizedBox(height: 10),

                            Consumer<MainProvider>(
                                builder: (context1,val,child) {
                                  return Autocomplete<CategoryModel>(
                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                      return value.categoryList
                                          .where((CategoryModel item) => item. categoryName
                                          .toLowerCase()
                                          .contains(textEditingValue.text.toLowerCase()))
                                          .toList();
                                    },
                                    displayStringForOption: (CategoryModel option) =>
                                    option.categoryName,
                                    fieldViewBuilder: (BuildContext context,
                                        TextEditingController fieldTextEditingController,
                                        FocusNode fieldFocusNode,
                                        VoidCallback onFieldSubmitted) {
                                      WidgetsBinding.instance.addPostFrameCallback((_) {
                                        fieldTextEditingController.text = val.categoryNameController.text;
                                      });

                                      return Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          gradient: containerGradient
                                          // ,
                                        ),

                                        child: SizedBox(
                                          width: MediaQuery.of(context).size.width / 1.1,
                                          child: TextFormField(
                                            // cursorColor: Colors.brown,
                                            maxLines: 1,
                                            style: const TextStyle(
                                                color: Colors.white, fontWeight: FontWeight.w500),
                                            decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),

                                              hintText: "Select Category",
                                              hintStyle: const TextStyle(

                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  height: 4,
                                                  fontWeight: FontWeight.normal
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: BorderSide.none,

                                              ),
                                            ),
                                            onChanged: (txt) {},
                                            controller: fieldTextEditingController,
                                            focusNode: fieldFocusNode,
                                          ),
                                        ),
                                      );
                                    },
                                    onSelected: (CategoryModel selection) {
                                      value.categoryNameController.text = selection.categoryName;
                                      value.productSelectedcategoryid = selection.id;
                                    },
                                    optionsViewBuilder: (BuildContext context,
                                        AutocompleteOnSelected<CategoryModel> onSelected,
                                        Iterable<CategoryModel> options) {
                                      return Align(
                                        alignment: Alignment.topLeft,
                                        child: Material(
                                          child: Container(

                                            decoration: BoxDecoration(
                                                // color:Color(0xff0C8290),
                                              gradient: maingradient,
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            width: 200,
                                            height: 200,
                                            child: ListView.builder(
                                              padding: const EdgeInsets.all(10.0),
                                              itemCount: options.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                final CategoryModel option = options.elementAt(index);

                                                return GestureDetector(
                                                  onTap: () {
                                                    onSelected(option);
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(

                                                        decoration: BoxDecoration(
                                                          // borderRadius: BorderRadius.circular(15)
                                                          // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                                          // ))
                                                        ),

                                                        height: 30,
                                                        width: 200,
                                                        child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Center(
                                                                child: Text(option.categoryName,
                                                                    style: const TextStyle(
                                                                      fontFamily: 'muktaregular',
                                                                      color: Colors.white,
                                                                    )
                                                                ),
                                                              ),
                                                            ]),
                                                      ),
                                                      Divider(
                                                        thickness: 1,
                                                        color: Colors.black,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }
                            ),
                            SizedBox(height: 10),
                            TextField(
                            controller: value.priceController,
                              decoration: InputDecoration(
                                label: Text("PRICE", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                                prefixText: " ₹",
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),

                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],

                            ),
                            SizedBox(height: 20),
                            // SizedBox(height: 10),
                            Row(
                              children: [
                                TextButton.icon(
                                  onPressed: () =>_showCalendarPicker(context), icon: Icon(Icons.calendar_today_sharp,color: Colors.white,), label: Text("Choose Delivery date", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                                ),
                                Text( ' ${_dateFormatter.format(value.selectedDate)}', style: TextStyle(fontSize: 15,color: Colors.white),),
                              ],
                            ),

                            SizedBox(height: 20),
                            Text("UPLOAD IMAGE", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                            Consumer<MainProvider>(
                              builder: (context,value,child) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      showBottomSheet(context);
                                    },
                                    child: Container(
                                      height: height/4,
                                      width: width,
                                      color: Colors.grey,
                                      child: value.addProductFileImg!=null?Image.file(value.addProductFileImg!,fit: BoxFit.fill,): Center(child: Icon(Icons.upload)),
                                    ),
                                  ),
                                );
                              }
                            ),
                            TextField(
                              controller: value.productDescriptionController,
                              decoration: InputDecoration(
                                label: Text("PRODUCT DESCRIPTION", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              ),
                            ),
                            TextField(
                              controller: value.totalProductController,
                              decoration: InputDecoration(
                                label: Text("TOTAL NO OF PRODUCT", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              ),
                            ),
                            TextField(
                              controller: value.currentStatusContoller,
                              decoration: InputDecoration(
                                label: Text("CURRENT STATUS", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      height: height / 15,
                      width: width / 3,
                      child: ElevatedButton(
                        onPressed: () {
                          showUploadConfirmationDialog(context, value);
                        },
                        child: Text("SAVE", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: green),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
  void _showCalendarPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Date'),
          contentPadding: EdgeInsets.all(16.0),
          content: SizedBox(
            width: double.minPositive,
            height: 400,
            child: TableCalendar(
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: context.read<MainProvider>().selectedDate,
              selectedDayPredicate: (day) =>
                  isSameDay(day, context.read<MainProvider>().selectedDate),
              onDaySelected: (selectedDay, focusedDay) {
                context.read<MainProvider>().updateSelectedDate(selectedDay);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }

  void showBottomSheet(BuildContext context) {
    MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.blue,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    mainprovider.getImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.blue),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
  void showUploadConfirmationDialog(
      BuildContext context, MainProvider value) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Confirm Upload"),
          content: const Text("Are you sure you want to upload this Product?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                // Close the dialog

                if(from=="NEW"){
                  await value.addProduct(from, "");
                }
                else{
                  await value.addProduct(from, oldid);
                }
                 // Upload work

                // Show the snackbar using the main context
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Product uploaded successfully!"),
                    duration: Duration(seconds: 3),
                  ),
                );

                // Navigate to ProductScreen after upload and snackbar
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProductScreen()),
                );
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}

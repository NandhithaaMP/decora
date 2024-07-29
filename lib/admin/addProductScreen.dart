import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for DateFormat
import 'package:table_calendar/table_calendar.dart';

import '../constants/constant_color.dart'; // Adjust import as necessary

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  DateTime _selectedDate = DateTime.now();
  final DateFormat _dateFormatter = DateFormat('dd MMMM yyyy');

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
            child: Column(
              children: [
                SizedBox(height: height / 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            label: Text("PRODUCT NAME", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: InputDecoration(
                            label: Text("PRICE", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                          ),
                        ),
                        SizedBox(height: 20),


                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text("DELIVERY DATE", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                            IconButton(onPressed: () =>_showCalendarPicker(context) , icon: Icon(Icons.calendar_today)),
                            // SizedBox(width: 5),
                            Text(
                              'Selected Date: ${_dateFormatter.format(_selectedDate)}',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text("UPLOAD IMAGE", style: TextStyle(fontFamily: "muktaregular", fontSize: 15, color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height/4,
                            width: width,
                            color: Colors.grey,
                            child: Center(child: Icon(Icons.upload)),
                          ),
                        )
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
                      Navigator.pop(context);
                    },
                    child: Text("SAVE", style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(backgroundColor: green),
                  ),
                ),
              ],
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
              focusedDay: _selectedDate,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}

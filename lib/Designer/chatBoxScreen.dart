

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant_color.dart';
import '../provider/mainProvider.dart';

class ChatScreen extends StatelessWidget {
  String userId,name,phone;
  ChatScreen({super.key,required this.userId,required this.name,required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cstgreen,
        appBar: AppBar(
          backgroundColor: Color(0xff445D4C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/PROFILE.jpg"),
                radius: 23,
              ),
              SizedBox(width: 10),
              Consumer<MainProvider>(
                builder: (context2,valu2,child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(valu2.designerName, style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(valu2.designerPhone, style: TextStyle(color: Colors.white, fontSize: 13)),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(gradient: screenGradient),
          child: Column(
            children: [
              Expanded(
                child: Consumer<MainProvider>(
                  builder: (context, provider, child) {
                    if (provider.messages.isEmpty) {
                      return Center(child: Text('No messages available.'));
                    }
                    return ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: provider.messages.length,
                      itemBuilder: (context, index) {
                        final message = provider.messages[index];
                        return buildMessageBubble(message);
                      },
                    );
                  },
                ),
              ),
              buildInputField(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildMessageBubble( message) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: message.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: message.isSentByMe ? Color(0xFFE4C8BB) : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(message.text, style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildInputField(BuildContext context) {
    final chatProvider = Provider.of<MainProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatProvider.messageController,
              decoration: InputDecoration(
                hintText: 'Type here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send, color: Colors.white),
            onPressed: () => chatProvider.sendMessage('senderId', 'receiverId'), // Replace with actual IDs
          ),
        ],
      ),
    );
  }

}


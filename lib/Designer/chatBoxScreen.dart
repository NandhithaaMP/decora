//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../constants/constant_color.dart';
// import '../models/messages.dart';
// import '../provider/mainProvider.dart';
//
// class ChatScreen extends StatelessWidget {
//   String login_Id,receiver_Id;
//   ChatScreen({super.key,required this.login_Id,required this.receiver_Id});
//
//   @override
//   Widget build(BuildContext context) {
//     final chatProvider=Provider.of<MainProvider>(context,listen: false);
//
//     return Scaffold(
//         backgroundColor: cstgreen,
//         appBar: AppBar(
//           backgroundColor: Color(0xff445D4C),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(30),
//               bottomLeft: Radius.circular(30),
//             ),
//           ),
//           elevation: 1,
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: Row(
//             children: [
//               Consumer<MainProvider>(
//                 builder: (context,value2,child2) {
//                   return CircleAvatar(
//                     backgroundImage: NetworkImage("value2.designer_Photo"),
//                     radius: 23,
//                   );
//                 }
//               ),
//               SizedBox(width: 10),
//               Consumer<MainProvider>(
//                 builder: (context2,valu2,child) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(valu2.designerName, style: TextStyle(color: Colors.white, fontSize: 20)),
//                       Text(valu2.designerPhone, style: TextStyle(color: Colors.white, fontSize: 13)),
//                     ],
//                   );
//                 }
//               ),
//             ],
//           ),
//         ),
//       body: SizedBox.expand(
//         child: Container(
//           decoration: BoxDecoration(gradient: screenGradient),
//           child: Column(
//             children: [
//               Expanded(
//                 child: Consumer<MainProvider>(
//                   builder: (context, provider, child) {
//                     // if (provider.messagesList.isEmpty) {
//                     //   return Center(child: Text('No messages available.'));
//                     // }
//                     return ListView.builder(
//                       padding: EdgeInsets.all(16),
//                       reverse: true,
//                       itemCount: provider.userMessagesList.length,
//                       itemBuilder: (context, index) {
//                         final message = provider.userMessagesList[index];
//                         return buildMessageBubble(message,login_Id);
//                       },
//                     );
//                   },
//                 ),
//               ),
//               buildInputField(context),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget buildMessageBubble(Message message,String currentUserId) {
//     bool isSentByMe=message.senderId==currentUserId;
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment: isSentByMe ? MainAxisAlignment.start:MainAxisAlignment.end ,
//         children: [
//           Flexible(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color:isSentByMe ? Color(0xFFE4C8BB) : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(message.content, style: TextStyle(fontSize: 16)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget buildInputField(BuildContext context) {
//     final chatProvider = Provider.of<MainProvider>(context, listen: false);
//
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(color: Colors.transparent),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: chatProvider.messageController,
//               decoration: InputDecoration(
//                 hintText: 'Type here...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[100],
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//           IconButton(
//             icon: Icon(Icons.send, color: Colors.white),
//             onPressed: () {
//               // chatProvider.addTextMessage(messages);
//               chatProvider.addTextMessage(Message.fromJson(messageId, json));
//             },
//                 // chatProvider.sendMessage('senderId', login_Id), // Replace with actual IDs
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//


import 'package:decora/Designer/sample.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constant_color.dart';
import '../models/messages.dart';
import '../provider/chatProvider.dart';
import '../provider/mainProvider.dart';

class ChatScreen extends StatelessWidget {
  final String login_Id, receiver_Id;
  ChatScreen({super.key, required this.login_Id, required this.receiver_Id});

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
            Consumer<MainProvider>(
              builder: (context, value2, child2) {
                return CircleAvatar(
                  backgroundImage: NetworkImage(value2.designerProfilePic ?? ''),
                  radius: 23,
                );
              },
            ),
            SizedBox(width: 10),
            Consumer<MainProvider>(
              builder: (context2, valu2, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valu2.designerName ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      valu2.designerPhone ?? '',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                );
              },
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
                child: Consumer<ChatProvider>(
                  builder: (context, provider, child) {
                    return ListView.builder(
                      padding: EdgeInsets.all(16),
                      // reverse: true,
                      controller: provider.scrollController,
                      itemCount: provider.userMessagesList.length,
                      itemBuilder: (context, index) {
                        final message = provider.userMessagesList[index];
                        return buildMessageBubble(message, login_Id);
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

  Widget buildMessageBubble(MessageModel message, String currentUserId) {
    bool isSentByMe = message.senderId == currentUserId;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isSentByMe ? Color(0xFFE4C8BB) : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(message.content, style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(BuildContext context) {
    final chatPro = Provider.of<ChatProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: chatPro.messageController,
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
            onPressed: () {
              final text = chatPro.messageController.text;
              if (text.isNotEmpty) {
                chatPro.addTextMessage(
                  MessageModel(
                    messageId: '', // Generate or fetch the ID here
                    senderId: login_Id,
                    receiverId: receiver_Id,
                    sentTime: DateTime.now(),
                    content: text,
                    isSeen: false,
                    messageType: 'text',

                     // Adjust as needed
                  ),
                );
                chatPro.messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}

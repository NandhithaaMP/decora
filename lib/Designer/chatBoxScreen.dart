// //
// import 'package:decora/constants/constant_color.dart';
// import 'package:flutter/material.dart';
//
// class Message {
//   final String text;
//   final bool isSentByMe;
//   final String? avatarUrl;
//
//   Message({
//     required this.text,
//     required this.isSentByMe,
//     this.avatarUrl,
//   });
// }
//
// class ChatScreen extends StatefulWidget {
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Message> _messages = [
//     Message(
//       text: "Hi, do you have a special vegetarian meal option?",
//       isSentByMe: true,
//       avatarUrl: "https://example.com/avatar1.jpg",
//     ),
//     Message(
//       text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Consequat nulla id.",
//       isSentByMe: false,
//       avatarUrl: "https://example.com/avatar2.jpg",
//     ),
//     Message(
//       text: "Hi, do you have a special vegetarian meal option?",
//       isSentByMe: true,
//       avatarUrl: "https://example.com/avatar1.jpg",
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cstgreen,
//       // backgroundColor: Color(0xff56665B),
//       appBar: AppBar(
//         backgroundColor: Color(0xff56665B),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(30),
//             bottomLeft: Radius.circular(30),
//           ),
//         ),
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Row(
//           children: [
//             CircleAvatar(
//               backgroundImage: AssetImage("assets/PROFILE.jpg"),
//               radius: 23,
//             ),
//             SizedBox(width: 10), // Space between avatar and text
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Nithina',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: "philosopher",
//                     fontSize: 20,
//                   ),
//                 ),
//                 Text(
//                   '898989898989',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontFamily: "philosopher",
//                     fontSize: 13,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: EdgeInsets.all(16),
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return buildMessageBubble(message);
//               },
//             ),
//           ),
//           buildInputField(),
//         ],
//       ),
//     );
//   }
//
//   Widget buildMessageBubble(Message message) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         mainAxisAlignment:
//         message.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           if (!message.isSentByMe && message.avatarUrl != null)
//             CircleAvatar(
//               radius: 16,
//               backgroundImage: NetworkImage(message.avatarUrl!),
//             ),
//           if (!message.isSentByMe) SizedBox(width: 8),
//           Flexible(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               decoration: BoxDecoration(
//                 color: message.isSentByMe
//                     ? Color(0xFFE4C8BB) // Light purple for sent messages
//                     : Colors.grey[200],
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 message.text,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//           ),
//           if (message.isSentByMe && message.avatarUrl != null)
//             Padding(
//               padding: EdgeInsets.only(left: 8),
//               child: CircleAvatar(
//                 radius: 16,
//                 backgroundImage: NetworkImage(message.avatarUrl!),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildInputField() {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(
//           top: BorderSide(color: Colors.grey[300]!),
//         ),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 hintText: 'Type here...',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: BorderSide.none,
//                 ),
//                 filled: true,
//                 fillColor: Colors.grey[100],
//                 contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//             ),
//           ),
//           SizedBox(width: 8),
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.grey[100],
//             ),
//             child: IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () {
//                 if (_controller.text.isNotEmpty) {
//                   setState(() {
//                     _messages.add(
//                       Message(
//                         text: _controller.text,
//                         isSentByMe: true,
//                         avatarUrl: "https://example.com/avatar1.jpg",
//                       ),
//                     );
//                     _controller.clear();
//                   });
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:decora/constants/constant_color.dart';
import 'package:flutter/material.dart';

class Message {
  final String text;
  final bool isSentByMe;

  Message({
    required this.text,
    required this.isSentByMe,
  });
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Message> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cstgreen,


      appBar: AppBar(
        // backgroundColor: cstgreen,
        backgroundColor:  Color(0xff445D4C),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nithina', style: TextStyle(color: Colors.white, fontSize: 20)),
                Text('898989898989', style: TextStyle(color: Colors.white, fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
              gradient:screenGradient
          ),
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('messages').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasData) {
                      final messages = snapshot.data!.docs.map((doc) {
                        return Message(
                          text: doc['text'],
                          isSentByMe: doc['isSentByMe'],
                        );
                      }).toList();

                      return ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return buildMessageBubble(message);
                        },
                      );
                    }

                    return Center(child: Text('No messages available.'));
                  },
                ),
              ),
              buildInputField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMessageBubble(Message message) {
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

  Widget buildInputField() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.transparent
          // color: Color(0xff56665B)
        // border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type here...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send,color: Colors.white,),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  // In a real-time app, you would add the message to the database here
                  FirebaseFirestore.instance.collection('messages').add({
                    'text': _controller.text,
                    'isSentByMe': true,
                  });
                  _controller.clear();
                });
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

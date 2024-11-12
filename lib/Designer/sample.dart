// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../models/messages.dart';
// import '../provider/mainProvider.dart';
//
// class ChatTextField extends StatefulWidget {
//   const ChatTextField({
//     super.key,
//     required this.receiverId,
//     required this.receiverName,
//     required this.senderID,
//     required this.senderName,
//     required this.from,
//   });
//
//   final String receiverId;
//   final String receiverName;
//   final String senderID;
//   final String senderName;
//   final String from;
//
//   @override
//   State<ChatTextField> createState() => _ChatTextFieldState();
// }
//
// class _ChatTextFieldState extends State<ChatTextField> {
//   final controller = TextEditingController();
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) =>
//       Container(
//         width: double.infinity,
//         height: MediaQuery
//             .of(context)
//             .size
//             .height * 0.11,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1), // Shadow color
//               spreadRadius: 0,
//               blurRadius: 10, // Adjust blur radius to control the effect
//               offset: const Offset(
//                   0, -5), // Move the shadow to the top of the Container
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.yellow,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: TextFormField(
//                     controller: controller,
//                     minLines: 1,
//                     maxLines: null,
//                     keyboardType: TextInputType.multiline,
//                     textInputAction: TextInputAction.newline,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: const BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         borderSide: const BorderSide(
//                           color: Colors.black,
//                         ),
//                       ),
//                       contentPadding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                       hintStyle: const TextStyle(color: Colors.yellowAccent),
//                       hintText: 'Text Message',
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 5),
//             Container(
//               width: 43,
//               height: 43,
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.pinkAccent,
//               ),
//               child: Consumer<MainProvider>(
//                 builder: (context, value4, child) {
//                   return IconButton(
//                     icon: const Icon(
//                       Icons.send,
//                       color: Colors.black,
//                     ),
//                     onPressed: () {
//                       if (controller.text.isNotEmpty) {
//                         String msgId = DateTime
//                             .now()
//                             .millisecondsSinceEpoch
//                             .toString();
//                         final message = Message(
//                           content: controller.text,
//                           sentTime: DateTime.now(),
//                           receiverId: widget.receiverId,
//                           messageType: "TEXT",
//                           isSeen: false,
//                           senderId: widget.senderID,
//                           messageId: msgId,
//                         );
//                         value4.addTextMessage(message);
//                         controller.clear();
//                         value4.notifyListeners();
//                       }
//                     },
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(width: 5),
//           ],
//         ),
//       );
// }


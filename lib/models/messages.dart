import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String messageId;
  final String senderId;
  final String receiverId;
  final DateTime sentTime;
  final String content;
  final bool isSeen;
  final String messageType;


  const Message({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.sentTime,
    required this.content,
    required this.isSeen,
    required this.messageType,

  });
  // Adjust the factory method to include messageId
  factory Message.fromJson(String messageId, Map<String, dynamic> json) =>
      Message(
        messageId: messageId, // Assign the document ID
        // messageId: json['MESSAGE_ID'], // Assign the document ID
        receiverId: json['RECEIVER_ID'],
        senderId: json['SENDER_ID'],
        sentTime: (json['TIMESTAMP'] as Timestamp).toDate(), // Convert Timestamp to DateTime
        content: json['CONTENT'],
        isSeen:json['IS_SEEN'] ,
        messageType:json['MESSAGE_TYPE'],

      );

  Map<String, dynamic> toJson() => {
    // You may or may not want to include messageId when converting back to JSON, depending on your use case
    'RECEIVER_ID': receiverId,
    'SENDER_ID': senderId,
    'TIMESTAMP':DateTime.now(),
    'CONTENT': content,
    'IS_SEEN': false,
    'MESSAGE_TYPE': messageType,

  };

}

class UserChatModel {
  String msgId;
  // final MessageModel lastMessage;
  String userName;
  String userImage;
  String userPhone;
  String sentBy;
  String senderId;
  String lastMessage;
  DateTime timeStamp;

  UserChatModel(
    this.msgId,
    this.userName,
    this.userImage,
    this.userPhone,
    this.sentBy,
    this.senderId,
    this.lastMessage,
    this.timeStamp

  );
}

// class UserChatModel {
//   String userName;
//   String userImage;
//   String userPhone;
//   String sentBy;
//   String senderId;
//   String lastMessage;
//   DateTime timeStamp;
//   bool isOnline;
//   DateTime lastSeen;
//
//   UserChatModel(
//       this.userName,
//       this.userImage,
//       this.userPhone,
//       this.sentBy,
//       this.senderId,
//       this.lastMessage,
//       this.timeStamp,
//       this.isOnline,
//       this.lastSeen
//       );





//
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Message {
//   final String messageId; // Add messageId to your model
//   final String senderId;
//   final String receiverId;
//   final DateTime sentTime;
//   final String content;
//   final bool isSeen;
//   final String messageType;
//
//   const Message({
//     required this.messageId, // Ensure messageId is required
//     required this.senderId,
//     required this.receiverId,
//     required this.sentTime,
//     required this.content,
//     required this.isSeen,
//     required this.messageType,
//   });
//
//   // Adjust the factory method to include messageId
//   factory Message.fromJson(String messageId, Map<String, dynamic> json) =>
//       Message(
//         messageId: json['MESSAGE_ID'], // Assign the document ID
//         receiverId: json['RECEIVER_ID'],
//         senderId: json['SENDER_ID'],
//         sentTime: (json['TIMESTAMP'] as Timestamp).toDate(), // Convert Timestamp to DateTime
//         content: json['CONTENT'],isSeen:json['IS_SEEN'] ,
//         messageType:json['MESSAGE_TYPE'],
//       );
//
//   Map<String, dynamic> toJson() => {
//     // You may or may not want to include messageId when converting back to JSON, depending on your use case
//     'RECEIVER_ID': receiverId,
//     'SENDER_ID': senderId,
//     'TIMESTAMP':DateTime.now(),
//     'CONTENT': content,
//     'IS_SEEN': false,
//     'MESSAGE_TYPE': messageType,
//   };
// }
//
// enum MessageType {
//   text,
//   image;
//
//   String toJson() => name;
//
//   factory MessageType.fromJson(String json) =>
//       values.byName(json);
// }
//
// class ChatModel {
//   String uid;
//   String name;
//   String content;
//   DateTime lastActive;
//   bool isOnline;
//
//   ChatModel(
//       this.uid,
//       this.name,
//       this.content,
//       this.lastActive,
//       this.isOnline
//       );
// }
//
//
// class UserChatModel {
//   String userName;
//   String userImage;
//   String userPhone;
//   String sentBy;
//   String senderId;
//   String lastMessage;
//   DateTime timeStamp;
//   bool isOnline;
//   DateTime lastSeen;
//
//   UserChatModel(
//       this.userName,
//       this.userImage,
//       this.userPhone,
//       this.sentBy,
//       this.senderId,
//       this.lastMessage,
//       this.timeStamp,
//       this.isOnline,
//       this.lastSeen
//       );
// }
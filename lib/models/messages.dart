import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageId;
  final String senderId;
  final String receiverId;
  final DateTime sentTime;
  final String content;
  final bool isSeen;
  final String messageType;
  final String? userName;
  final String? userPhoto;

  const MessageModel({
    required this.messageId,
    required this.senderId,
    required this.receiverId,
    required this.sentTime,
    required this.content,
    required this.isSeen,
    required this.messageType,
   this.userName,
   this.userPhoto
  });
  // Adjust the factory method to include messageId
  factory MessageModel.fromJson(String messageId, Map<String, dynamic> json) =>
      MessageModel(
        messageId: json['MESSAGE_ID'], // Assign the document ID
        receiverId: json['RECEIVER_ID'],
        senderId: json['SENDER_ID'],
        sentTime: (json['TIMESTAMP'] as Timestamp).toDate(), // Convert Timestamp to DateTime
        content: json['CONTENT'],isSeen:json['IS_SEEN'] ,
        messageType:json['MESSAGE_TYPE'],
        userName: json["REGISTER_NAME"]??"",
        userPhoto: json["USERS_IMAGE"]??""
      );

  Map<String, dynamic> toJson() => {
    // You may or may not want to include messageId when converting back to JSON, depending on your use case
    'RECEIVER_ID': receiverId,
    'SENDER_ID': senderId,
    'TIMESTAMP':DateTime.now(),
    'CONTENT': content,
    'IS_SEEN': false,
    'MESSAGE_TYPE': messageType,
    "REGISTER_NAME":userName,
    "USERS_IMAGE":userPhoto
  };

}
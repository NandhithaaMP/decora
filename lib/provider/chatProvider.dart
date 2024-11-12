import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../Designer/sample.dart';
import '../models/messages.dart';

class ChatProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<MessageModel> userMessagesList = [];


  String getChatId(String userId1, String userId2) {
    List<String> userIDs = [userId1, userId2];
    userIDs.sort();
    return userIDs.join("-");
  }

  Future<void> addTextMessage(MessageModel message) async {
    String messageId=DateTime.now().millisecondsSinceEpoch.toString();
    String chatId = getChatId(message.senderId, message.receiverId);

    // Check if the conversation exists; if not, initialize it
    if (userMessagesList.isEmpty) {
      await db.collection("CHATS").doc(chatId).set({
        "CREATED_AT": DateTime.now(),
        "PARTICIPANTS": [message.senderId, message.receiverId],
        "LAST_MESSAGE": {
          "TEXT": message.content,
          "SENT_BY": message.senderId,
          "TIMESTAMP": DateTime.now(),
        }
      }, SetOptions(merge: true));
    } else {
      // Update only the LAST_MESSAGE field in the existing chat document
      await db.collection("CHATS").doc(chatId).set({
        "LAST_MESSAGE": {
          "TEXT": message.content,
          "SENT_BY": message.senderId,
          "TIMESTAMP": DateTime.now(),
        }
      }, SetOptions(merge: true));
    }
    print("xxxxxxxxxxxxxxeee");
    // Add the message to the messages sub-collection with a unique messageId
    await db.collection("CHATS").doc(chatId).collection("MESSAGES").doc(messageId).set(message.toJson());
    // await db.collection("CHATS").doc(chatId).collection("MESSAGES").doc(message.messageId).set(message.toJson());
    notifyListeners();
  }

  // Future<void> fetchUserMessages(String userId, String senderId) async {
  //   String chatId = getChatId(userId, senderId);
  //   userMessagesList.clear();
  //
  //   db.collection("CHATS").doc(chatId).collection("MESSAGES")
  //       .orderBy("TIMESTAMP", descending: false)
  //       .snapshots()
  //       .listen((snapshot) {
  //     if (snapshot.docs.isNotEmpty) {
  //       userMessagesList.clear();
  //
  //       for (var doc in snapshot.docs) {
  //         var data = doc.data();
  //         DateTime sentTime = DateTime.now();
  //         if (data['TIMESTAMP'] != null) {
  //           Timestamp timestamp = data['TIMESTAMP'];
  //           sentTime = timestamp.toDate();
  //         }
  //
  //         userMessagesList.add(Message(
  //           messageId: doc.id,
  //           senderId: data["SENDER_ID"] ?? "",
  //           receiverId: data["RECEIVER_ID"] ?? "",
  //           sentTime: sentTime,
  //           content: data["CONTENT"] ?? "",
  //           isSeen: data["IS_SEEN"] ?? false,
  //           messageType: data["MESSAGE_TYPE"] ?? "",
  //
  //         ));
  //       }
  //
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         scrollController.jumpTo(scrollController.position.maxScrollExtent);
  //       });
  //       notifyListeners();
  //     }
  //   });
  // }
  Future<void> fetchUserMessages(String userId, String senderId) async {
    String chatId = getChatId(userId, senderId);
    userMessagesList.clear();

    db.collection("CHATS").doc(chatId).collection("MESSAGES")
        .orderBy("TIMESTAMP", descending: false)
        .snapshots()
        .listen((snapshot) async {
      if (snapshot.docs.isNotEmpty) {
        userMessagesList.clear();

        for (var doc in snapshot.docs) {
          var data = doc.data();
          DateTime sentTime = DateTime.now();

          if (data['TIMESTAMP'] != null) {
            Timestamp timestamp = data['TIMESTAMP'];
            sentTime = timestamp.toDate();
          }

          // Fetch additional user information if not available in message data
          String username = data["USERNAME"] ?? "";
          String userPhotoUrl = data["USER_PHOTO_URL"] ?? "";

          // If username or userPhotoUrl are not available in message, fetch from user profile
          if (username.isEmpty || userPhotoUrl.isEmpty) {
            var userDoc = await db.collection("USERS").doc(senderId).get();
            if (userDoc.exists) {
              var userData = userDoc.data()!;
              username = userData["USERNAME"] ?? "Unknown User";
              userPhotoUrl = userData["USER_PHOTO_URL"] ?? "";
            }
          }

          userMessagesList.add(MessageModel(
            messageId: doc.id,
            senderId: data["SENDER_ID"] ?? "",
            receiverId: data["RECEIVER_ID"] ?? "",
            sentTime: sentTime,
            content: data["CONTENT"] ?? "",
            isSeen: data["IS_SEEN"] ?? false,
            messageType: data["MESSAGE_TYPE"] ?? "",
            userName: username,
            userPhoto: userPhotoUrl,

          ));
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });
        notifyListeners();
      }
    });
  }


  // void fetchRecentMessagesForDesigner(String designerId){
  //   if(auth.currentUser==null){
  //     print("No current user found-----------");
  //     return;
  //   }
  //   userMessagesList.clear();//clear the previous messages
  //
  //   // String chatId=getChatId(auth.currentUser!.uid, designerId);
  //
  //   db.collection("CHATS").where("PARTICIPANTS",arrayContains: designerId)
  //       .snapshots().listen((value) {
  //         print("njjjjjjj");
  //     if(value.docs.isNotEmpty){
  //       print("mkkkkk");
  //       userMessagesList.clear(); // Clear the list before adding new messages
  //       for(var doc in value.docs){
  //         print("ooo,mmm");
  //         var lastMessageData=doc.data()["LAST_MESSAGE"];
  //         if(lastMessageData!=null){
  //           DateTime sentTime=DateTime.now();
  //           if(lastMessageData["TIMESTAMP"]!=null){
  //             Timestamp timestamp=lastMessageData["TIMESTAMP"];
  //             sentTime=timestamp.toDate();
  //           }
  //
  //           // Create a message instance with the most recent message details
  //           userMessagesList.add(Message(
  //               messageId: doc.id,
  //               senderId: lastMessageData["SENT_BY"]??"",
  //               receiverId: designerId,
  //               sentTime: sentTime,
  //               content: lastMessageData["TEXT"]??"",
  //               isSeen: lastMessageData["IS_SEEN"]??false,
  //               messageType: lastMessageData["MESSAGE_TYPE"]??""
  //           ));
  //         }
  //
  //       }
  //       // WidgetsBinding.instance.addPostFrameCallback((_){
  //       //   scrollController.jumpTo(scrollController.position.maxScrollExtent);// Scroll to the bottom of the messages
  //       // });
  //       notifyListeners();
  //     }
  //   },);
  // }


  void fetchRecentMessagesForDesigner(String designerId) {
    // Check if there's a current user
    if (auth.currentUser == null) {
      print("No current user found-----------");

      return;
    }

    print("Current user ID: ${auth.currentUser!.uid}"); // Log the current user ID

    // Clear previous messages to ensure only the latest ones are shown
    userMessagesList.clear();

    // Listen to changes in the chats collection where the designer is a participant
    db.collection("CHATS")
        .where("PARTICIPANTS", arrayContains: designerId)
        .snapshots()
        .listen((snapshot) {
      print("Fetched chats for designer ID: $designerId");

      if (snapshot.docs.isNotEmpty) {
        print("Chats found: ${snapshot.docs.length}");
        userMessagesList.clear(); // Clear the list before adding new messages

        // Loop through each chat and get the last message
        for (var doc in snapshot.docs) {
          var lastMessageData = doc.data()["LAST_MESSAGE"];
          var userId=lastMessageData["SENT_BY"];

          if (lastMessageData != null) {
            DateTime sentTime = DateTime.now();

            if (lastMessageData["TIMESTAMP"] != null) {
              Timestamp timestamp = lastMessageData["TIMESTAMP"];
              sentTime = timestamp.toDate();
            }

            // Fetch the user details for the sender of the last message
            db.collection("USERS").doc(userId).get().then((userDoc) {
              if(userDoc.exists){
                var userData=userDoc.data();
                MessageModel recentMessage=MessageModel(
                    messageId: doc.id,
                    senderId: userId,
                    receiverId: designerId,
                    sentTime: sentTime,
                    content: lastMessageData["TEXT"]??"",
                    isSeen: lastMessageData["IS_SEEN"]??false,
                    messageType: lastMessageData["MESSAGE_TYPE"]??"",
                    userName: userData?["REGISTER_NAME"]??"user name",
                    userPhoto: userData?["USERS_IMAGE"]??"user photo",

                );
                userMessagesList.add(recentMessage);
                // Print the message details
                print("Last message from ${recentMessage.userName}: ${recentMessage.content} at ${recentMessage.sentTime}");
              }
              else{
                print("User data not found for userId: $userId");
              }
              notifyListeners();
            },);


          }
        }

        notifyListeners();
      } else {
        print("No recent messages found for designer ID: $designerId");
      }
    });
  }



}
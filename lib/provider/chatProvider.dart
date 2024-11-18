import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Designer/sample.dart';
import '../models/messages.dart';

class ChatProvider extends ChangeNotifier {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  List<Message> userMessagesList = [];


  String getChatId(String userId1, String userId2) {
    List<String> userIDs = [userId1, userId2];
    userIDs.sort();
    return userIDs.join("_");
  }

  Future<void> addTextMessage(Message message) async {
    String messageId=DateTime.now().millisecondsSinceEpoch.toString();
    String chatId = getChatId(message.senderId, message.receiverId);

    print("nnnnnnuuuu $chatId  gggggggg"
        "${message.senderId} bbbbbb ${message.receiverId}");

    // Check if the conversation exists; if not, initialize it
    if (userMessagesList.isEmpty) {
      print("njjjjjj");
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
      print("pppppppppppoo");
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

          // userMessagesList.add(MessageModel(
          //   messageId: doc.id,
          //   senderId: data["SENDER_ID"] ?? "",
          //   receiverId: data["RECEIVER_ID"] ?? "",
          //   sentTime: sentTime,
          //   content: data["CONTENT"] ?? "",
          //   isSeen: data["IS_SEEN"] ?? false,
          //   messageType: data["MESSAGE_TYPE"] ?? "",
          //
          //
          // )
          // );
          userMessagesList.add(Message(
            messageId: doc.id,
            senderId: data["SENDER_ID"] ?? "",
            receiverId: data["RECEIVER_ID"] ?? "",
            sentTime: sentTime,
            content: data["CONTENT"] ?? "",
            isSeen: data["IS_SEEN"] ?? false,
            messageType: data["MESSAGE_TYPE"] ?? "",


          )
          );
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
        });
        notifyListeners();
      }
    });
  }



  List<UserChatModel> userMessagesForDList = []; // Stores the user's name and last message
  // Future<void> fetchLastMessagesForDesigner(String designerId) async {
  //   try {
  //     print("kooooooooo");
  //     // Fetch all chat documents where the designer is a participant
  //     QuerySnapshot chatSnapshot = await FirebaseFirestore.instance
  //         .collection("CHATS")
  //         .where("PARTICIPANTS", arrayContains: designerId)
  //         .get();
  //
  //     // Clear the old list
  //     userMessagesForDList.clear();
  //
  //     // Iterate through each chat document
  //     for (var chatDoc in chatSnapshot.docs) {
  //       print("mmml");
  //       String chatId = chatDoc.id;
  //       List participants = chatDoc.get("PARTICIPANTS");
  //
  //       if (participants.contains(designerId) && participants.length == 2) {
  //         print("jjk");
  //         String otherUserId = participants.firstWhere((id) => id != designerId);
  //         String generatedChatId = getChatId(designerId, otherUserId);
  //
  //         if (chatId == generatedChatId) {
  //           print("yuo");
  //           // Fetch the last message in the chat sent by the user
  //           QuerySnapshot messagesSnapshot = await FirebaseFirestore.instance
  //               .collection("CHATS")
  //               .doc(chatId)
  //               .collection("MESSAGES")
  //               .orderBy("TIMESTAMP", descending: true)
  //               .limit(1)
  //               .get();
  //
  //           if (messagesSnapshot.docs.isNotEmpty) {
  //             print("ert");
  //             var lastMessageDoc = messagesSnapshot.docs.first;
  //             var lastMessageData = lastMessageDoc.data() as Map<String, dynamic>;
  //
  //             // Create a MessageModel from the last message
  //             Message lastMessage = Message.fromJson(
  //               lastMessageDoc.id, // Pass the document ID
  //               lastMessageData,   // Pass the message data
  //             );
  //
  //             String senderId = lastMessage.senderId;
  //
  //             // Fetch the user's name from the USERS collection
  //             DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //                 .collection("USERS")
  //                 .doc(senderId)
  //                 .get();
  //
  //             if (userDoc.exists) {
  //               print("loo");
  //               String userName = userDoc.get('REGISTER_NAME') ?? "Unknown";
  //               print("mkoo");
  //
  //               // Check if this user is already in the list
  //               bool userExists = userMessagesForDList.any((userMessage) =>
  //               userMessage.msgId == chatId &&
  //                   userMessage.lastMessage == senderId);
  //
  //               if (!userExists) {
  //                 print("asd");
  //                 // Add the last message and user details to the list
  //                 userMessagesForDList.add(
  //                   // UserMessageModel(
  //                   //   msgId: chatId, // Assign the chatId as the unique identifier
  //                   //   userName: userName,
  //                   //   lastMessage: lastMessage,
  //                   // ),
  //                   UserChatModel(
  //                       chatId,
  //                       userName,
  //                       userImage,
  //                       userPhone,
  //                       sentBy,
  //                       senderId,
  //                       lastMessage,
  //                       timeStamp
  //                   );
  //                 );
  //               }
  //             }
  //
  //           }
  //         }
  //       }
  //
  //     }
  //
  //     // Print the result for debugging
  //     print("Fetched ${userMessagesForDList.length} users with messages.");
  //     for (var userMessage in userMessagesForDList) {
  //       print(
  //           "Chat ID: ${userMessage.msgId}, User: ${userMessage.userName}, Last Message: ${userMessage.lastMessage.content}");
  //     }
  //   } catch (e) {
  //     print("Error fetching last messages: $e");
  //   }
  // }





// --------------------------------ist running code-------------------------------------------
  // List<MessageModel> userMessagesList = [];
  // MessageModel? lastIncomingMessage; // To track the last incoming message
  //
  // Future<void> fetchMsgFromUser(String userId, String designerId) async {
  //   print("mmmmmmmmmmiiiiiiiiiiii");
  //   String chatId = getChatId(userId, designerId);
  //
  //   try {
  //     QuerySnapshot messagesSnapshot = await db
  //         .collection("CHATS")
  //         .doc(chatId)
  //         .collection("MESSAGES")
  //         .where("SENDER_ID", isEqualTo: userId) // Fetch messages sent by the user
  //         .orderBy("TIMESTAMP", descending: true) // Get the latest messages first
  //         .get();
  //
  //     // Clear the old list
  //     userMessagesList.clear();
  //
  //     // Populate the userMessagesList
  //     userMessagesList = messagesSnapshot.docs.map((doc) {
  //       return MessageModel.fromJson(
  //         doc.id, // Pass the document ID
  //         doc.data() as Map<String, dynamic>, // Pass the document data
  //       );
  //     }).toList();
  //
  //     // Set the last incoming message if messages are available
  //     if (userMessagesList.isNotEmpty) {
  //       lastIncomingMessage = userMessagesList.first;
  //     } else {
  //       lastIncomingMessage = null;
  //     }
  //
  //     print("Fetched ${userMessagesList.length} messages. Last incoming message: ${lastIncomingMessage?.content}");
  //   } catch (e) {
  //     print("Error fetching messages: $e");
  //   }
  // }

// ---------------------------end od ist running code-------------------------------------------


// -------------------------------------running------------------------------------------
//   void fetchRecentMessagesForDesigner(String designerId) {
//
//
//     userMessagesList.clear(); // Clear old messages before fetching new ones
//
//     // Listen to changes in the CHATS collection
//     db.collection("CHATS")
//         .where("PARTICIPANTS", arrayContains: designerId)
//         .snapshots()
//         .listen((snapshot) {
//       userMessagesList.clear(); // Refresh the list on every update
//
//       if (snapshot.docs.isNotEmpty) {
//         for (var doc in snapshot.docs) {
//           var lastMessageData = doc.data()["LAST_MESSAGE"];
//           if (lastMessageData != null) {
//             String userId = lastMessageData["SENT_BY"];
//             DateTime sentTime = lastMessageData["TIMESTAMP"] != null
//                 ? (lastMessageData["TIMESTAMP"] as Timestamp).toDate()
//                 : DateTime.now();
//
//             // Fetch sender user details
//             db.collection("USERS").doc(userId).get().then((userDoc) {
//               if (userDoc.exists) {
//                 var userData = userDoc.data();
//                 MessageModel recentMessage = MessageModel(
//                   messageId: doc.id,
//                   senderId: userId,
//                   receiverId: designerId,
//                   sentTime: sentTime,
//                   content: lastMessageData["TEXT"] ?? "",
//                   isSeen: lastMessageData["IS_SEEN"] ?? false,
//                   messageType: lastMessageData["MESSAGE_TYPE"] ?? "",
//                   // userName: userData?["REGISTER_NAME"] ?? "Unknown",
//                   // userPhoto: userData?["USERS_IMAGE"] ?? "default.png",
//                 );
//
//                 userMessagesList.add(recentMessage);
//                 notifyListeners(); // Notify listeners after adding each message
//               } else {
//                 print("User data not found for userId: $userId");
//               }
//             });
//           }
//         }
//       } else {
//         print("No recent messages found for designer ID: $designerId");
//       }
//     });
//   }
// -----------------------------------------end of running----------------------------------------


// void fetchRecentMessagesForDesigner(String designerId) {
  //   // Check if there's a current user
  //   if (auth.currentUser == null) {
  //     print("No current user found-----------");
  //
  //     return;
  //   }
  //
  //   print("Current user ID: ${auth.currentUser!.uid}"); // Log the current user ID
  //
  //   // Clear previous messages to ensure only the latest ones are shown
  //   userMessagesList.clear();
  //
  //   // Listen to changes in the chats collection where the designer is a participant
  //   db.collection("CHATS")
  //       .where("PARTICIPANTS", arrayContains: designerId)
  //       .snapshots()
  //       .listen((snapshot) {
  //     print("Fetched chats for designer ID: $designerId");
  //
  //     if (snapshot.docs.isNotEmpty) {
  //       print("Chats found: ${snapshot.docs.length}");
  //       userMessagesList.clear(); // Clear the list before adding new messages
  //
  //       // Loop through each chat and get the last message
  //       for (var doc in snapshot.docs) {
  //         var lastMessageData = doc.data()["LAST_MESSAGE"];
  //         var userId=lastMessageData["SENT_BY"];
  //
  //         if (lastMessageData != null) {
  //           DateTime sentTime = DateTime.now();
  //
  //           if (lastMessageData["TIMESTAMP"] != null) {
  //             Timestamp timestamp = lastMessageData["TIMESTAMP"];
  //             sentTime = timestamp.toDate();
  //           }
  //
  //           // Fetch the user details for the sender of the last message
  //           db.collection("USERS").doc(userId).get().then((userDoc) {
  //             if(userDoc.exists){
  //               var userData=userDoc.data();
  //               MessageModel recentMessage=MessageModel(
  //                   messageId: doc.id,
  //                   senderId: userId,
  //                   receiverId: designerId,
  //                   sentTime: sentTime,
  //                   content: lastMessageData["TEXT"]??"",
  //                   isSeen: lastMessageData["IS_SEEN"]??false,
  //                   messageType: lastMessageData["MESSAGE_TYPE"]??"",
  //                   userName: userData?["REGISTER_NAME"]??"user name",
  //                   userPhoto: userData?["USERS_IMAGE"]??"user photo",
  //
  //               );
  //               userMessagesList.add(recentMessage);
  //               // Print the message details
  //               print("Last message from ${recentMessage.userName}: ${recentMessage.content} at ${recentMessage.sentTime}");
  //             }
  //             else{
  //               print("User data not found for userId: $userId");
  //             }
  //             notifyListeners();
  //           },);
  //
  //
  //         }
  //       }
  //
  //       notifyListeners();
  //     } else {
  //       print("No recent messages found for designer ID: $designerId");
  //     }
  //   });
  // }

  // String? currentUserType;
  //
  // //user details
  // String? userProfilePic;
  // String? userName;
  // String? userPhone;
  //
  // //Designer details
  //
  // String? designerProfilePic;
  // String? designerName;
  // String? designerPhone;
  //
  // void updateCurrentUSer({required String userType,String? profilePic,String? name,String? phone}){
  //   print("poiuuuuuu");
  //   currentUserType=userType;
  //   if(userType=="USER"){
  //     userProfilePic=profilePic;
  //     userName=name;
  //     userPhone=phone;
  //   }
  //   else if(userType=="DESIGNER"){
  //     designerProfilePic=profilePic;
  //     designerName=name;
  //     designerPhone=phone;
  //   }
  //   notifyListeners();
  // }


}
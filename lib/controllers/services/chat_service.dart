import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:longevity_intime_biotech_task_test/controllers/utils/utils.dart';
import 'package:longevity_intime_biotech_task_test/models/messages.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Utils utils = Utils();

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverId, message) async {
    // Send Messages
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;

    Messages newMessage = Messages(
      message: message,
      receiverId: receiverId,
      senderEmail: currentUserEmail,
      senderId: currentUserId,
      timestamp: Timestamp.now(),
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatsId = ids.join('_');

    await _firestore
        .collection('chats')
        .doc(chatsId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> receiveMessage(String receiverId, otherReceiverId) {
    // Receive Messages
    List<String> ids = [receiverId, otherReceiverId];
    ids.sort();
    String chatsId = ids.join('_');

    return _firestore
        .collection('chats')
        .doc(chatsId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  void sendMessageLoad(
      String receiverId, TextEditingController _controller) async {
    if (_controller.text.isNotEmpty) {
      await sendMessage(receiverId, _controller.text)
          .then((_) => _controller.clear());
    }
    // utils.scrollDown();
  }
}

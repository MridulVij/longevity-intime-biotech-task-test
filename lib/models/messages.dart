// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Messages {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String? receiverEmail;
  final String message;
  final Timestamp timestamp;
  Messages({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    this.receiverEmail,
    required this.message,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'receiverEmail': receiverEmail,
      'message': message,
      'timestamp': timestamp,
    };
  }

  // factory Message.fromMap(Map<String, dynamic> map) {
  //   return Message(
  //     senderId: map['senderId'] as String,
  //     senderEmail: map['senderEmail'] as String,
  //     receiverId: map['receiverId'] as String,
  //     receiverEmail: map['receiverEmail'] as String,
  //     message: map['message'] as String,
  //     timestamp: Timestamp.fromMap(map['timestamp'] as Map<String, dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Message.fromJson(String source) =>
  //     Message.fromMap(json.decode(source) as Map<String, dynamic>);
}

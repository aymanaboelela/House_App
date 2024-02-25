import 'package:cloud_firestore/cloud_firestore.dart';

class ChatCardModel {
  final String userToken;
  final String message;
  final String time;

  ChatCardModel({
    required this.message,
    required this.time,
    required this.userToken,
  });
  factory ChatCardModel.fromJson(dynamic jsonData) {
    return ChatCardModel(
      userToken: jsonData['userToken'],
      message: jsonData['message'],
      time: jsonData['time'],
    );
  }
}

class MessageModel {
  final String senderTocen;
  final String senderId;
  final String receiverId;
  final String message;
  final String timeTamp;

  MessageModel(
      {required this.senderTocen,
      required this.senderId,
      required this.receiverId,
      required this.message,
      required this.timeTamp});

  factory MessageModel.fromJson(dynamic jsonData) {
    return MessageModel(
        senderTocen: jsonData['senderTocen'],
        senderId: jsonData['senderId'],
        receiverId: jsonData['receiverId'],
        message: jsonData['message'],
        timeTamp: jsonData['timeTamp']);
  }
  Map<String, dynamic> toJson() {
    return {
      'senderTocen': senderTocen,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'timeTamp': timeTamp,
    };
  }
}

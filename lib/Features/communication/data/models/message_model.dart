class MessageModel {
  final String adminEmail;
  final String userToken;
  final String message;
  final String timeTamp;
  final bool isAdmin;

  MessageModel(
      {required this.isAdmin,
      required this.adminEmail,
      required this.userToken,
      required this.message,
      required this.timeTamp});

  factory MessageModel.fromJson(dynamic jsonData) {
    return MessageModel(
        adminEmail: jsonData['adminEmail'] ?? "",
        isAdmin: jsonData['isAdmin'] ?? "",
        userToken: jsonData['userToken'] ?? "",
        message: jsonData['message'] ?? "",
        timeTamp: jsonData['timeTamp'] ?? "");
  }
  Map<String, dynamic> toJson() {
    return {
      'adminEmail': adminEmail,
      'isAdmin': isAdmin,
      'userToken': userToken,
      'message': message,
      'timeTamp': timeTamp,
    };
  }
}

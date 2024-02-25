class ChatCardModel {
  final String userToken;

  ChatCardModel({
    required this.userToken,
  });
  factory ChatCardModel.fromJson(dynamic jsonData) {
    return ChatCardModel(
      userToken: jsonData['userToken'],
    );
  }
}

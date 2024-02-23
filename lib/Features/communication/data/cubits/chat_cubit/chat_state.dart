import 'package:house_app_one/Features/communication/data/models/message_model.dart';

abstract class ChatMessageState {}

class ChatMessageInitial extends ChatMessageState {}

class ChatMessageLoading extends ChatMessageState {}

class ChatSenderMessageSuccess extends ChatMessageState {}

class ChatReciverMessageSuccess extends ChatMessageState {
  final List<MessageModel> data;

  ChatReciverMessageSuccess({required this.data});
}

class ChatMessageFailure extends ChatMessageState {
  final String message;

  ChatMessageFailure({required this.message});
}

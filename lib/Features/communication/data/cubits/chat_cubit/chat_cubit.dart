import 'dart:developer';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_app_one/Features/admin/chats_from_admin/data/models/chat_card_model.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_state.dart';
import 'package:house_app_one/Features/communication/data/models/message_model.dart';

class ChatMessageCubit extends Cubit<ChatMessageState> {
  ChatMessageCubit() : super(ChatMessageInitial());
  Future<void> senderdMessage({
    required String userToken,
    required String message,
    required bool isAdmin,
  }) async {
    emit(ChatMessageLoading());
    try {
      MessageModel messageModel = MessageModel(
        isAdmin: isAdmin,
        adminEmail: "ayman@gmail.com",
        userToken: userToken,
        message: message,
        timeTamp: DateTime.now().toString(),
      );

      String chatRoomId = userToken;
      await FirebaseFirestore.instance
          .collection('chat_room')
          .doc(chatRoomId)
          .collection('messages')
          .add(messageModel.toJson());
      emit(ChatSenderMessageSuccess());
    } on FirebaseException catch (err) {
      emit(ChatMessageFailure(message: err.toString()));
      log(err.toString());
    }
  }

  void recivedMessage({required String usertoken}) {
    emit(ChatMessageLoading());
    try {
      FirebaseFirestore.instance
          .collection('chat_room')
          .doc(usertoken)
          .collection('messages')
          .orderBy(
            'timeTamp',
            descending: true,
          )
          .snapshots()
          .listen((event) {
        List<MessageModel> messageModel = [];
        for (var doc in event.docs) {
          messageModel.add(MessageModel.fromJson(doc.data()));
        }
        emit(ChatReciverMessageSuccess(data: messageModel));
      });

      print("/////////////////");
      print(usertoken);
      print("/////////////////");
    } on FirebaseException catch (err) {
      emit(ChatMessageFailure(message: err.toString()));
      log(err.toString());
    }
  }

  Future<void> addMessageinChateCard(String messageText, String token) async {
    await FirebaseFirestore.instance.collection('usertoken').doc(token).set(
        {"message": messageText, "time": DateTime.now().toString()},
        SetOptions(merge: true));
  }
}

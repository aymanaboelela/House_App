import 'dart:developer';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        adminEmail: FirebaseAuth.instance.currentUser!.email!,
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

  void recivedMessage({required String userToken}) {
    emit(ChatMessageLoading());
    try {
      String chatRoomId = userToken;
      FirebaseFirestore.instance
          .collection('chat_room')
          .doc(chatRoomId)
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
    } on FirebaseException catch (err) {
      emit(ChatMessageFailure(message: err.toString()));
      log(err.toString());
    }
  }
}

import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:house_app_one/Features/communication/data/cubits/chat_cubit/chat_state.dart';
import 'package:house_app_one/Features/communication/data/models/message_model.dart';

class ChatMessageCubit extends Cubit<ChatMessageState> {
  ChatMessageCubit() : super(ChatMessageInitial());

  Future<void> senderdMessage({
    required String receiverId,
    required String message,
  }) async {
    emit(ChatMessageLoading());
    try {
      MessageModel messageModel = MessageModel(
          senderTocen: "user1",
          senderId: FirebaseAuth.instance.currentUser!.uid,
          receiverId: receiverId,
          message: message,
          timeTamp: DateTime.now().toString());
      List<String> ids = [FirebaseAuth.instance.currentUser!.uid, receiverId];
      ids.sort();
      String chatRoomId = ids.join("_");
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

  void recivedMessage({required String receiverId}) {
    emit(ChatMessageLoading());
    try {
      List<String> ids = [FirebaseAuth.instance.currentUser!.uid, receiverId];
      ids.sort();
      String chatRoomId = ids.join("_");
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

  // final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  // Future<String> getDeviceToken() async {
  //   String? token = await firebaseMessaging.getToken();
  //   print("توكن الجهاز: $token");
  //   return token.toString();
  // }
}

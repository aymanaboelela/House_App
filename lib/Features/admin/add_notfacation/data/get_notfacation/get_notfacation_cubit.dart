import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:house_app_one/Features/Splach/view/widgets/splash_view_body.dart';
part 'get_notfacation_state.dart';

class GetNotfacationCubit extends Cubit<GetNotfacationState> {
  GetNotfacationCubit() : super(GetnotfacationInitial());

  Future<void> getTokenWithUser() async {
    userToken = await FirebaseMessaging.instance.getToken();
    print("//////////////////////////////////////////////");
    debugPrint(userToken);
    print("////////////////////////////////////////////");
  }

  Future<void> getTokenWithAdmin() async {
    adminToken = await FirebaseMessaging.instance.getToken();
    print("//////////////////////////////////////////////");
    debugPrint(userToken);
    print("////////////////////////////////////////////");
  }

  void getNotfacation() {
    FirebaseMessaging.onMessage.listen(
      (event) {
        print("seccess in notfacation");
      },
    );
    Future<void> firebaseMessagingBackgroundHandler(
        RemoteMessage message) async {
      await Firebase.initializeApp();
      print("Handling a background message: ${message.messageId}");
    }
  }

}

String? adminToken;

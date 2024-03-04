import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:house_app_one/Features/Splach/view/widgets/splash_view_body.dart';
import 'package:meta/meta.dart';
part 'get_notfacation_state.dart';

class GetNotfacationCubit extends Cubit<GetNotfacationState> {
  GetNotfacationCubit() : super(GetnotfacationInitial());

  Future<void> getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    print("//////////////////////////////////////////////");
    debugPrint(token);
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

  // Future<String> getToken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   print("//////////////////////////////////////////////");
  //   print(token);
  //   print("////////////////////////////////////////////");
  //   return token!;
  // }
}

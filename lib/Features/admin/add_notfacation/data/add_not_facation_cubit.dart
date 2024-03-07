import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'add_not_facation_state.dart';

class AddNotFacationCubit extends Cubit<AddNotFacationState> {
  AddNotFacationCubit() : super(AddNotFacationInitial());
  Future<void> sendNotification(
      String title, String description, String token) async {
    emit(IsLodingAddAddNotFacation());
    try {
      var headersList = {
        'Accept': '*/*',
        'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAp7VSv0Y:APA91bGRTgm5BThTU83YuW4APlqj1WZHNgSz2qu1Sr567FkXiOOzLuBB6MCz99MykZx0mFJYK1CUTp2Ze0Om7YOVQHX7XYSP6suNqDOSbmaKbzd2bCGKDqD_046YykyAoKBi4hpAY55A'
      };
      var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

      var body = {
        "to": token,
        "notification": {
          "title": title,
          "body": description,
          "mutable_content": true,
          "sound": "Tri-tone"
        },
        "data": {
          "url": "<url of media image>",
          "dl": "<deeplink action on tap of notification>"
        }
      };
      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();
      if (res.statusCode >= 200 && res.statusCode < 300) {
        print(resBody);
      } else {
        print('Error: ${res.reasonPhrase}');
      }
      emit(IsSucssesAddNotFacation());
    } catch (e) {
      emit(IsFeilerAddNotFacation(error: e.toString()));
    }
  }

  Future<void> addTokenInFirebaseWithUser(String token) async {
    await FirebaseFirestore.instance.collection('usertoken').doc(token).set({
      'userToken': token,
      'message': "",
      'time': "",
    }, SetOptions(merge: true));
  }
  Future<void> addTokenInFirebaseWithAdmin(String token) async {
    await FirebaseFirestore.instance.collection('Admintoken').doc(token).set({
      'userToken': token,
    }, SetOptions(merge: true));
  }
}

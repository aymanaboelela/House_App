import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();

    _firebaseMessaging.getToken().then((String? token) {
      print("FirebaseMessaging token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      // تنفيذ الشيفرة عند استلام الإشعار أثناء فتح التطبيق
    });

    // Use getInitialMessage for onLaunch and onResume
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print("onLaunch or onResume: $message");
        // تنفيذ الشيفرة عند فتح التطبيق من إشعار أو عند فتح التطبيق من الخلفية
      }
    });

    // This is for onResume when the app is already open
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onResume: $message");
      // تنفيذ الشيفرة عند فتح التطبيق من إشعار أثناء تشغيل التطبيق
    });
  }

  // إرسال رمز جهاز الجوال لتسجيل الجهاز على Firebase Cloud Messaging
  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }
}

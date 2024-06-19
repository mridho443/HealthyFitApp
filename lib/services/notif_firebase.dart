import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('title: ${message.notification?.title}');
  print('body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class NotifFirebase {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCM = await _firebaseMessaging.getToken();
    print("Token: $fCM");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}

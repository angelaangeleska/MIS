import 'package:firebase_messaging/firebase_messaging.dart';

import '../main.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging
        .requestPermission();
  }

  Future<void> init() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print("FCM Token: $fcmToken");

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      final data = message.data;
      final screen = data['notification'];

      if (screen == '/meal') {
        navigatorKey.currentState?.pushNamed('/meal');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("Message: ${message.notification?.title}");
    });
  }
}
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:siparislio/services/local_notification.dart';

class FCMServices {
  Future<void> initNotification() async {
    await requestPermission();
    await getFcmToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        NotificationService().instantNotification(
            title: message.notification!.title.toString(),
            body: message.notification!.body.toString());
      }
    });
  }

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(provisional: true);
  }

  Future<String?> getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    if (fcmToken != null) {
      inspect(fcmToken);
      print(fcmToken);
      return fcmToken;
    }
    return null;
  }
}

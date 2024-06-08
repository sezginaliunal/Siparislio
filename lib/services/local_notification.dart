import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/ic_notification');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  notificationDetails() {
    // RawResourceAndroidNotificationSound customSound =
    //     const RawResourceAndroidNotificationSound('notification');
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            colorized: true,
            'OHALDE Kanalı',
            'OHALDE kanal açıklaması',
            // sound: customSound,
            importance: Importance.max,
            color: Color(0xFF146F2E),
            ledColor: Colors.red,
            enableVibration: true,
            priority: Priority.high,
            playSound: true),
        iOS: DarwinNotificationDetails());
  }

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required DateTime scheduledNotificationDateTime,
  }) async {
    Random random = Random();
    int notificationId = random.nextInt(100000);

    try {
      await notificationsPlugin.zonedSchedule(
        notificationId,
        title,
        body,
        tz.TZDateTime.from(
          scheduledNotificationDateTime,
          tz.local,
        ),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: {
          "scheduledDateTime": scheduledNotificationDateTime.toString(),
        }.toString(),
      );
    } catch (e) {
      print('Bildirim gönderilemedi: $e');
    }
  }

  Future<void> cancelNotification(int id) async {
    await notificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await notificationsPlugin.cancelAll();
    if (kDebugMode) {
      print('Bildirimler iptal edildi...');
    }
  }

  Future<void> printPendingNotifications() async {
    final List<PendingNotificationRequest> pendingNotifications =
        await notificationsPlugin.pendingNotificationRequests();
    for (final notification in pendingNotifications) {
      print('ID: ${notification.id}');
      print('Scheduled Time: ${notification.payload}');
      print('------------');
    }
  }

  Future<void> instantNotification({
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'OHALDE Kanalı',
      'OHALDE kanal açıklaması',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await notificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}

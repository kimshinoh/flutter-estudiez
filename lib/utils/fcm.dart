import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fruity/data/network/apis/user/user_api.dart';
import 'package:fruity/data/network/dio_client.dart';
import 'package:fruity/dto/user/user_request.dart';

class FCMService {
  static Future<void> init() async {
    late AndroidNotificationChannel channel;

    late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description:
            'This channel is used for important notifications.', // description,
        importance: Importance.max,
      );

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final RemoteNotification? notification = message.notification;
      final AndroidNotification? androidNotification = notification?.android;

      if (notification != null && androidNotification != null) {
        final BigTextStyleInformation bigTextStyleInformation =
            BigTextStyleInformation(
                notification.body ?? ""); //multi-line show style
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                importance: channel.importance,
                priority: Priority.high,
                ongoing: true,
                icon: 'app_icon',
                styleInformation: BigTextStyleInformation(
                  notification.body ?? "",
                ),
              ),
            ));
      }
    });
  }

  static Future<void> updateToken() async {
    UserAPI userAPI = UserAPI(DioClient(Dio()));

    final String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      await userAPI.updateFCMToken(UpdateFCMTokenRequest(token: token));
    }
  }
}

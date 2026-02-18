import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sehty/core/services/local_notification_service.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> init() async {
    await _requestPermission();
    _onMessage(); // Foreground
    _onMessageOpenedApp(); // Background / Terminated (when clicked)

    // Check if app was opened from a terminated state via notification
    final RemoteMessage? initialMessage = await _firebaseMessaging
        .getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
  }

  Future<void> _requestPermission() async {
    final NotificationSettings settings = await _firebaseMessaging
        .requestPermission();

    log('User granted permission: ${settings.authorizationStatus}');
  }

  Future<String?> getToken() async {
    try {
      final String? token = await _firebaseMessaging.getToken();
      log("FCM Token: $token");
      return token;
    } catch (e) {
      log("Error getting FCM token: $e");
      return null;
    }
  }

  Stream<String> get onTokenRefresh {
    return _firebaseMessaging.onTokenRefresh.map((event) {
      log("FCM Token Refreshed: $event");
      return event;
    });
  }

  void _onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');

        // Show local notification
        LocalNotificationService.showNotification(
          id: message.hashCode,
          title: message.notification!.title ?? 'No Title',
          body: message.notification!.body ?? 'No Body',
          payload: message.data.map(
            (key, value) => MapEntry(key, value.toString()),
          ),
        );
      }
    });
  }

  void _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    log('Handling message open: ${message.messageId}');
    // Ideally user generic clean architecture navigation logic here.
    // For now we might depend on LocalNotificationService or a global navigator.
    // The LocalNotificationService listeners might handle the actual tap logic too if using AwesomeNotifications fully.
    // But since this is Firebase's own listener, we can also extract data here to navigate.

    if (message.data['route'] != null) {
      // Navigation logic will go here
    }
  }
}

import 'package:ecomerce_24/app/routes/app_pages.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final box = GetStorage();

  Future<void> initialize() async {
    // Request permission
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Configure local notifications
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings ioSettings =
        DarwinInitializationSettings();
    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: ioSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
    await subscribeToTopic("all");

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle notification tap when app is in background but open
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);

    // Get FCM token
    String? token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");
    // TODO: Send this token to your Laravel backend
    await box.write('fcm_token', token);
  }

  void _handleForegroundMessage(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        payload: message.data['route'],
      );
      final title = message.data['title'];
      final body = message.data['body'];
      final imageUrl = message.data['image'];
      final price = message.data['price'];
      final name = message.data['name'];
      Get.toNamed(
        Routes.PRODUCT_NOTIFICATION,
        arguments: {
          'title': title,
          'description': body,
          'image': imageUrl,
          'price': price,
          'name': name,
        },
      );
      print("Route name ${message.data['route']}");
    }
  }

  void _onNotificationTapped(NotificationResponse details) {
    if (details.payload != null) {
      // Navigate based on the payload
      // final title = message.data["title"];
      // final body = message.data["body"];
      // final image = message.data["image_url"];
      // Get.toNamed(
      //   Routes.PRODUCT_NOTIFICATION,
      //   arguments: {"title": title, "body": body, "image": image},
      // );
      print("Navigation to: ${details.payload}");
      // You can use Navigator here to navigate to specific screen
    }
  }

  void _handleNotificationTap(RemoteMessage message) {
    if (message.data['route'] != null) {
      // Navigate based on the route

      print("Navigation to: ${message.data['route']}");
      // You can use Navigator here to navigate to specific screen
    }
  }

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    print('Subscribed to topic: $topic');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    print('Unsubscribed from topic: $topic');
  }
}

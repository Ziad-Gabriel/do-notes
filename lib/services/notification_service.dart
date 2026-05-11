import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _initialized = false;
  
  bool get isInitialized => _initialized;
  
  // Initialize the notification service
  Future<void> initNotifaction() async {
    if (_initialized) return;

    //android initialization
    const initSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    //ios initialization
    const initSettingsIos = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    //initialization settings for both platforms
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingsIos,
    );

    // Initialize the plugin
    await notificationPlugin.initialize(settings: initSettings);
    _initialized = true;
  }

  // Notification Details
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'default_channel',
        'Default Channel',
        channelDescription: 'General notifications',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
      ),
      iOS: DarwinNotificationDetails(),);}
  // Show a notification
  Future<void> showNotification({
    int id = 0,
    required String title,
    required String body,
  }) async{
    await notificationPlugin.show(id: id, title: title, body: body, payload: '', notificationDetails: notificationDetails());
  }
}
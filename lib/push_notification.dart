// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:timezone/timezone.dart' as tz;
// // import 'package:timezone/data/latest.dart' as t;
// // class LocalNotificationService {
// //   LocalNotificationService();
// //
// //   final _localNotificationService = FlutterLocalNotificationsPlugin();
// //
// //   Future<void> intialize() async{
// //     try {
// //       t.initializeTimeZones();
// //     const AndroidInitializationSettings androidInitializationSettings =
// //         AndroidInitializationSettings('@drawable/ic_stat_account_box');
// //
// //
// //     const DarwinInitializationSettings darwinInitializationSettings = DarwinInitializationSettings();
// //     final InitializationSettings settings = InitializationSettings(
// //     android: androidInitializationSettings,
// //       iOS: darwinInitializationSettings
// //     );
// //
// //     await _localNotificationService.initialize(settings,onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
// //   } catch (e) {
// //     print('Error initializing notifications: $e');
// //     }
// //
// //   }
// //
// //
// //   Future<NotificationDetails> _notificationDetails () async {
// //     const AndroidNotificationDetails androidNotificationDetails =
// //     AndroidNotificationDetails(
// //       'your_channel_id',
// //       'your_channel_name',
// //
// //     channelDescription: 'description',
// //     importance: Importance.max,
// //       priority: Priority.max,
// //       playSound: true,);
// //     const DarwinNotificationDetails isNotificationDetails = DarwinNotificationDetails();
// //
// //     return const NotificationDetails(
// //       android: androidNotificationDetails,
// //       iOS: isNotificationDetails
// //     );
// //   }
// //   Future<void> scheduleHourlyNotifications() async {
// //     await _localNotificationService.zonedSchedule(
// //       0,
// //       'Hourly Notification',
// //       'This is a test notification.',
// //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
// //       const NotificationDetails(
// //         android: AndroidNotificationDetails(
// //           'hourly_channel_id',
// //           'Hourly Notifications',
// //           channelDescription: 'Scheduled hourly notifications.',
// //         ),
// //       ),
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation:
// //       UILocalNotificationDateInterpretation.absoluteTime,
// //       matchDateTimeComponents: DateTimeComponents.time,
// //       payload: 'hourly_notification',
// //     );
// //   }
// //
// //   Future<void> showNotification({
// //     required int id,
// //     required String title,
// //     required String body
// // }) async {
// //     final details = await _notificationDetails();
// //
// //     await _localNotificationService.show(id, title, body, details);
// //   }
// //   Future<void> showScheduleNotification({
// //     required int id,
// //     required String title,
// //     required String body,
// //     required int seconds,
// //   }) async {
// //     try {
// //
// //       final details = await _notificationDetails();
// //
// //     await _localNotificationService.zonedSchedule(
// //         id,
// //         title,
// //         body,
// //         tz.TZDateTime.from(
// //             DateTime.now().add(Duration(seconds: seconds)), tz.local),
// //         details,
// //       androidAllowWhileIdle: true,
// //       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
// //     );
// //   }catch(e){
// //       print('Error scheduling notification: $e');
// //     }
// //   }
// //
// //   void onDidReceiveNotificationResponse(NotificationResponse details) {
// //     print('details $details');
// //   }
// // }
// //
// import 'dart:async';
//
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class notification {
//   final FlutterLocalNotificationsPlugin _localNotificationService =
//   FlutterLocalNotificationsPlugin();
//
//   Future<void> initialize() async {
//     final AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//     final InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//     await _localNotificationService.initialize(initializationSettings);
//   }
//
//   Future<void> showNotificationEvery1hour() async {
//     const String title = 'Notification Title';
//     const String body = 'Notification Body';
//     final NotificationDetails details = await _notificationDetails();
//
//     Timer.periodic(const Duration(seconds:5 ), (timer) async {
//       await _localNotificationService.show(
//         0, // Unique notification id
//         title,
//         body,
//         details,
//       );
//     });
//   }
//
//   Future<NotificationDetails> _notificationDetails() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your_channel_id', // channel id
//       'your_channel_name', // channel name
//       channelDescription: 'your_channel_description', // channel description
//       importance: Importance.max,
//       priority: Priority.high,
//       actions: [
//         AndroidNotificationAction('action_1', 'Action 1',
//             showsUserInterface: true),
//         AndroidNotificationAction('action_2', 'Action 2',
//             showsUserInterface: true),
//       ],
//     );
//     final NotificationDetails platformChannelSpecifics =
//     const NotificationDetails(android: androidPlatformChannelSpecifics);
//     return platformChannelSpecifics;
//   }
//   Future<void> callback(String action) async {
//     if (action == 'action_1') {
//       // Handle Action 1
//       print('Action 1 pressed');
//     } else if (action == 'action_2') {
//       // Handle Action 2
//       print('Action 2 pressed');
//     }
//   }
//
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await AndroidAlarmManager.initialize();
// //   await NotificationHelper.initialize();
// //   scheduleBackgroundTask();
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Background Notifications',
// //       home: HomePage(),
// //     );
// //   }
// // }
// //
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Background Notifications'),
// //       ),
// //       body: Center(
// //         child: Text('Your App Content'),
// //       ),
// //     );
// //   }
// // }
// //
// // class NotificationHelper {
// //   static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
// //   FlutterLocalNotificationsPlugin();
// //
// //   static Future<void> initialize() async {
// //     const AndroidInitializationSettings initializationSettingsAndroid =
// //     AndroidInitializationSettings('@mipmap/ic_launcher');
// //     final InitializationSettings initializationSettings =
// //     InitializationSettings(android: initializationSettingsAndroid);
// //     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
// //   }
// //
// //   static Future<void> sendNotification() async {
// //     const AndroidNotificationDetails androidPlatformChannelSpecifics =
// //     AndroidNotificationDetails(
// //       'your_channel_id', // Change this to your channel ID
// //       'your_channel_name', // Change this to your channel name
// //       channelDescription:
// //       'your_channel_description', // Change this to your channel description
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       actions: [
// //         AndroidNotificationAction('action_1', 'Action 1',
// //             showsUserInterface: true),
// //         AndroidNotificationAction('action_2', 'Action 2',
// //             showsUserInterface: true),
// //       ],
// //     );
// //     const NotificationDetails platformChannelSpecifics =
// //     NotificationDetails(android: androidPlatformChannelSpecifics);
// //     await _flutterLocalNotificationsPlugin.show(
// //       0, // Notification ID
// //       'Notification Title',
// //       'Notification Body',
// //       platformChannelSpecifics,
// //       payload: 'payload', // Add payload to differentiate between notifications
// //     );
// //   }
// // }
// //
// // void scheduleBackgroundTask() {
// //   AndroidAlarmManager.periodic(const Duration(seconds: 10), 0, (alarmId) {
// //     NotificationHelper.sendNotification();
// //   });
// //   Future<void> callback(String action) async {
// //     if (action == 'action_1') {
// //       // Handle Action 1
// //       print('Action 1 pressed');
// //     } else if (action == 'action_2') {
// //       // Handle Action 2
// //       print('Action 2 pressed');
// //     }
// //   }
// // }
// //
// import 'dart:io';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'dart:async';
//
// import 'package:daily_pedometer/daily_pedometer.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
//
//
// import 'dart:async';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:daily_pedometer/daily_pedometer.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
//
// class StepCounterScreen extends StatefulWidget {
//   const StepCounterScreen({Key? key}) : super(key: key);
//
//   @override
//   _StepCounterScreenState createState() => _StepCounterScreenState();
// }
//
// class _StepCounterScreenState extends State<StepCounterScreen> {
//   int _stepCount = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _requestActivityRecognitionPermission();
//     _initPedometer();
//   }
//   Future<void> _requestActivityRecognitionPermission() async {
//     PermissionStatus status = await Permission.activityRecognition.request();
//     if (status != PermissionStatus.granted) {
//       // Handle permission denied
//     }
//   }
//   Future<void> _initPedometer() async {
//     DailyPedometer pedometer = await DailyPedometer.create();
//     setState(() {
//       _stepCount = pedometer.steps;
//     });
//
//     pedometer.stepCountStream.listen((event) {
//       setState(() {
//         _stepCount = event;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Step Counter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Step Count: $_stepCount',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await AndroidAlarmManager.initialize();
//   await NotificationHelper.initialize();
//   scheduleBackgroundTask();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Background Notifications',
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Background Notifications'),
//       ),
//       body: Center(
//         child: Text('Your App Content'),
//       ),
//     );
//   }
// }
//
// class NotificationHelper {
//   static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//
//   static Future<void> initialize() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//     final InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   static Future<void> sendNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your_channel_id', // Change this to your channel ID
//       'your_channel_name', // Change this to your channel name
//       channelDescription:
//       'your_channel_description', // Change this to your channel description
//       importance: Importance.max,
//       priority: Priority.high,
//       actions: [
//         AndroidNotificationAction('action_1', 'Action 1',
//             showsUserInterface: true),
//         AndroidNotificationAction('action_2', 'Action 2',
//             showsUserInterface: true),
//       ],
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//     await _flutterLocalNotificationsPlugin.show(
//       0, // Notification ID
//       'Notification Title',
//       'Notification Body',
//       platformChannelSpecifics,
//       payload: 'payload', // Add payload to differentiate between notifications
//     );
//   }
// }
//
// void scheduleBackgroundTask() {
//   AndroidAlarmManager.periodic(const Duration(seconds: 10), 0, (alarmId) {
//     NotificationHelper.sendNotification();
//   });
//   Future<void> callback(String action) async {
//     if (action == 'action_1') {
//       // Handle Action 1
//       print('Action 1 pressed');
//     } else if (action == 'action_2') {
//       // Handle Action 2
//       print('Action 2 pressed');
//     }
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class StepCounterScreen extends StatefulWidget {
  @override
  _StepCounterScreenState createState() => _StepCounterScreenState();
}

class _StepCounterScreenState extends State<StepCounterScreen> {
  int _stepCount = 0;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _fetchStepData();
  }

  Future<void> _requestPermissions() async {
    final PermissionStatus permissionStatus = await Permission.activityRecognition.request();
    if (permissionStatus != PermissionStatus.granted) {
      // Handle permission denied
    }
  }

  Future<void> _fetchStepData() async {
    HealthFactory health = HealthFactory();
    try {
      List<HealthDataType> types = [HealthDataType.STEPS];
      DateTime now = DateTime.now();
      DateTime start = DateTime(now.year, now.month, now.day, 0, 0, 0);
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(start, now, types);

      int stepCount = 0;
      for (HealthDataPoint point in healthData) {
        stepCount += point.value as int;
      }

      setState(() {
        _stepCount = stepCount;
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Counter'),
      ),
      body: Center(
        child: Text(
          'Steps for Today: $_stepCount',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

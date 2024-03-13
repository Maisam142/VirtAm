// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
//
// class DrinkCounter extends ChangeNotifier {
//   int _drinkCount = 0;
//
//   int get drinkCount => _drinkCount;
//
//   void incrementDrinkCount() {
//     _drinkCount++;
//     notifyListeners();
//   }
// }
//
// class Notifications extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   Notifications();
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DrinkCounter(),
//       child: HomeScreen(flutterLocalNotificationsPlugin),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   const HomeScreen(this.flutterLocalNotificationsPlugin, );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Drink Water Reminder'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await showNotification(context);
//           },
//           child: const Text('Show Drink Water Reminder'),
//         ),
//       ),
//     );
//   }
//
//   import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// class NotificationHelper {
//   Future<void> showNotification(BuildContext context) async {
//     await AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 20,
//         channelKey: 'basic_channel',
//         title: 'Hourly Drink Water Reminder',
//         body: 'Remember to drink water every hour!',
//         displayOnBackground: true,
//       ),
//       schedule: NotificationInterval(
//         interval: 2 * 60, // Every 5 minutes
//         timeZone: 'UTC',
//         preciseAlarm: true,
//         repeats: true,
//       ),
//       actionButtons: [
//         NotificationActionButton(
//           key: 'drink_now',
//           label: 'Drink Now',
//         ),
//         NotificationActionButton(
//           key: 'dismiss',
//           label: 'Dismiss',
//         ),
//       ],
//     );
//   }
// }
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code for handling notification creation goes here
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code for handling notification display goes here
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code for handling notification dismissal goes here
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == 'drink_now') {
      print('Drink counter incremented');

      incrementDrinkCounter();

    }
  }

  static void incrementDrinkCounter() {
    DrinkCounter().incrementDrinkCount();
  }
}

class NotificationHelper {
  static void initialize() {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
        ),
      ],
    );

  }
  static Future<void> showNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 20,
        channelKey: 'basic_channel',
        title: 'Hourly Drink Water Reminder',
        body: 'Remember to drink water every hour!',
        displayOnBackground: true,
      ),
      schedule: NotificationInterval(
        interval: 2 * 60, // Every 5 minutes
        timeZone: 'UTC',
        preciseAlarm: true,
        repeats: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'drink_now',
          label: 'Drink Now',
        ),
        NotificationActionButton(
          key: 'dismiss',
          label: 'Dismiss',
        ),
      ],
    );
  }

}

class DrinkCounter extends ChangeNotifier {
  int _drinkCount = 0;

  int get drinkCount => _drinkCount;

  void incrementDrinkCount() {
    _drinkCount++;
    notifyListeners();
  }
}
import 'dart:async';
import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../component/back_component.dart';
import '../../../generated/l10n.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Timer waterTimer;
  late Timer fastTimer;

  List<Map<String, String>> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
    waterTimer = Timer.periodic(const Duration(hours: 1), (timer) {
      addWaterNotification();
    });
    fastTimer = Timer.periodic(const Duration(minutes: 3), (timer) {
      addFastNotification();
    });
  }

  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNotifications = prefs.getStringList('notifications');
    if (savedNotifications != null) {
      setState(() {
        notifications = savedNotifications
            .map((jsonString) =>
                Map<String, String>.from(jsonDecode(jsonString)))
            .toList();
      });
    }
  }

  Future<void> _saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonNotifications = notifications.map((notification) {
      return jsonEncode(notification);
    }).toList();
    await prefs.setStringList('notifications', jsonNotifications);
  }

  void addWaterNotification() {
    setState(() {
      final waterNotification = {
        'title': 'Drink Water',
        'body': 'Reminder to drink water',
        'time': DateTime.now().toString().substring(11, 16),
      };
      notifications.add(waterNotification);
      _saveNotifications();
    });
  }

  void addFastNotification() {
    setState(() {
      final fastNotification = {
        'title': 'Start Fasting',
        'body': 'Reminder to start Fasting',
        'time': DateTime.now().toString().substring(11, 16),
      };
      notifications.add(fastNotification);
      _saveNotifications();
    });
  }

  @override
  void dispose() {
    super.dispose();
    waterTimer.cancel();
    fastTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            BackComponent(
              text: 'Notifications',
              onPressed: (){
                Beamer.of(context).beamBack();
              },
            ),

            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  final reversedIndex = notifications.length - index - 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.asset(
                        'images/notificationLogo.png',
                        width: 50,
                        height: 50,
                      ),
                      title: Text(notifications[reversedIndex]['title']!),
                      subtitle: Text(notifications[reversedIndex]['body']!),
                      trailing: Text(notifications[reversedIndex]['time']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction)async {

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
        interval: 10 * 60,
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

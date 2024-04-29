import 'dart:async';
import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../component/back_component.dart';
import '../../../generated/l10n.dart';
import '../register_screen/register_screen_view_model.dart';

class NotificationScreen extends StatelessWidget {
  List<Map<String, String>> notifications = [];

   NotificationScreen({super.key,required this.notifications});

  @override
  Widget build(BuildContext context) {
    return NotificationScreenContent(notifications: notifications,);
  }
}

class NotificationScreenContent extends StatefulWidget {
  List<Map<String, String>> notifications = [];

   NotificationScreenContent({super.key,required this.notifications});

  @override
  _NotificationScreenContentState createState() => _NotificationScreenContentState();
}

class _NotificationScreenContentState extends State<NotificationScreenContent> {

  @override
  void initState() {
    super.initState();
    _loadNotifications();

  }
  List<Map<String, String>> notifications = [];

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
                Navigator.pop(context);
                //Beamer.of(context).beamToNamed('/homeNavigationBar');
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
  static int counter = 0;
  static int waterCounter = 0;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static RegisterViewModel? registerViewModel;
  static DateTime dateTime = DateTime.now();



  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Implement notification creation logic if needed
  }

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Implement notification display logic if needed
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Implement action dismissal logic if needed
  }


  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == 'drink_now') {
      increaseCounter();
    }
  }
  Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('waterCounter',counter);
  }
  Future<void> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    waterCounter = prefs.getInt('waterCounter')!;
  }


  static void increaseCounter() {
    counter++;
    print("Counter increased: $counter");
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
          defaultColor: const Color(0xFF9D50DD),
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
        interval: 2 * 60,
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

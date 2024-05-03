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

   NotificationScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return NotificationScreenContent();
  }
}

class NotificationScreenContent extends StatefulWidget {

   NotificationScreenContent({super.key,});

  @override
  _NotificationScreenContentState createState() => _NotificationScreenContentState();
}

class _NotificationScreenContentState extends State<NotificationScreenContent> {

  List<Map<String, String>> ?notifications;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNotifications = prefs.getStringList('notifications');
    if (savedNotifications != null) {
      setState(() {
        notifications = savedNotifications
            .map((jsonString) => Map<String, String>.from(jsonDecode(jsonString)))
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
                itemCount: notifications!.length,
                itemBuilder: (BuildContext context, int index) {
                  final reversedIndex = notifications!.length - index - 1;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Image.asset(
                        'images/notificationLogo.png',
                        width: 50,
                        height: 50,
                      ),
                      title: Text(notifications![reversedIndex]['title']!),
                      subtitle: Text(notifications![reversedIndex]['body']!),
                      trailing: Text(notifications![reversedIndex]['time']!),
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
  static int savedDay = 0;
  static int ?savedDayWater;
  static int currentDay = DateTime.now().day;
  static int waterCounter = 0;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  static RegisterViewModel? registerViewModel;
  static DateTime dateTime = DateTime.now();
  static RegisterViewModel?vm;
  static List<Map<String, String>> notifications = [];

  static Future<void> addWaterNotification() async {
    final waterNotification = {
      'title': 'Drink Water',
      'body': 'Reminder to drink water',
      'time': DateTime.now().toString().substring(11, 16),
    };
    notifications.add(waterNotification);
    await _saveNotifications();
  }

  static Future<void> _saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonNotifications = notifications
        .map((notification) => jsonEncode(notification))
        .toList();
    await prefs.setStringList('notifications', jsonNotifications);
  }

  // static Future<void> loadNotifications() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedNotifications = prefs.getStringList('notifications');
  //   if (savedNotifications != null) {
  //     notifications = savedNotifications
  //         .map((jsonString) => Map<String, String>.from(jsonDecode(jsonString)))
  //         .toList();
  //   }
  // }



  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    //await addWaterNotification();

  }
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    await addWaterNotification();
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
      saveCounter();
      getCounter();

    }
  }


  static Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    if (savedDay !=  currentDay) {
      savedDay = currentDay;
      //savedDayWater = currentDay;
      // print('$currentDay -------------------------------------------------------------------------------------------------');
      // print('$savedDay -------------------------------------------------------------------------------------------------');
      counter = 100;
       prefs.setInt('waterCounter', counter);
       prefs.setInt('savedDayWater', savedDay);
       //prefs.setInt('savedWater', savedDayWater!);
      // print('$currentDay -----------------------#########################--------------------------------------------------------------------------');
      // print('$savedDay -----------------------#########################-----------------------------------------------');
      // print('$savedDayWater -----------------------#########################------------------------------------------------------');
    }else{
      //print('++++++++++++++++================================================');

      counter= counter+100;
      await prefs.setInt('waterCounter', counter);


    }

  }

  static Future<int> getCounter() async {
    final prefs = await SharedPreferences.getInstance();
    counter = prefs.getInt('waterCounter') ?? 0;
    savedDay = prefs.getInt('savedDayWater') ?? 0;
    //savedDayWater = prefs.getInt('savedWater') ;


    print("Counter retrieved: $counter");
    print("savedDay retrieved: $savedDay");
    //print("savedDayWater retrieved: $savedDayWater");

    // print('$currentDay ***************************************************************');
    // print('$savedDay ***************************************************************');
    // print('$savedDayWater ***************************************************************');

    return counter;
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
        interval: 1 * 60,
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

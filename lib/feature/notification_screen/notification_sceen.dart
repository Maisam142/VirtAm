// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:virtam/component/back_component.dart';
// import '../../component/text_component.dart';
// import '../../generated/l10n.dart';
//
//
// class NotificationScreen extends StatelessWidget {
//   NotificationScreen({super.key});
//   final List<Map<String, String>> notifications = [
//     {
//       'title': 'Drink Water',
//       'body': 'Reminder to drink water',
//       'time': '10:00 AM',
//     },
//     {
//       'title': 'Start Fasting',
//       'body': 'Reminder to start Fasting',
//       'time': '10:00 AM',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     return  WillPopScope(
//         onWillPop: () async {
//       Beamer.of(context).beamToNamed('/homeNavigationBar');
//       return false;
//     },
//     child: SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: <Widget>[
//             BackComponent(
//               onPressed: (){
//                 Beamer.of(context).beamBack();
//               },
//               text: S.of(context).notification,
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: TextComponent(text: S.of(context).today)),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   width: double.infinity,
//                   height: screenSize.height * 0.1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       mainAxisAlignment : MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Image(image: AssetImage('images/notificationLogo.png',),width: 50,height: 50,),
//                             ),
//                             Column(
//                               children: [
//                                 TextLabelComponent(text: notifications[0]['title'].toString()),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 5.0),
//                                   child: TextComponent(text: notifications[0]['body'].toString(), textStyle: Theme.of(context).textTheme.bodySmall,),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         TextComponent(text: notifications[0]['time'].toString()),
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: TextComponent(text: S.of(context).yesterday)),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   width: double.infinity,
//                   height: screenSize.height * 0.1,
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child:  Row(
//                       mainAxisAlignment : MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Image(image: AssetImage('images/notificationLogo.png',),width: 50,height: 50,),
//                             ),
//                             Column(
//                               children: [
//                                 TextLabelComponent(text: notifications[1]['title'].toString()),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 5.0),
//                                   child: TextComponent(text: notifications[1]['body'].toString(), textStyle: Theme.of(context).textTheme.bodySmall,),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         TextComponent(text: notifications[1]['time'].toString()),
//
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/generated/l10n.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Timer _watertimer;
  late Timer _fasttimer;

  List<Map<String, String>> notifications = [];

  @override
  void initState() {
    super.initState();
    _loadNotifications();
    _scheduleNotifications();

    _watertimer = Timer.periodic(Duration(minutes: 1), (timer) {
      addWaterNotification();
    });
    _fasttimer = Timer.periodic(Duration(minutes: 3), (timer) {
      addFastNotification();
    });
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
      _scheduleNotifications();
    }
  }

  // Save notifications to SharedPreferences
  Future<void> _saveNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonNotifications = notifications.map((notification) {
      return jsonEncode(notification);
    }).toList();
    await prefs.setStringList('notifications', jsonNotifications);
  }

  void _scheduleNotifications() {
    notifications.forEach((notification) {
      final now = DateTime.now();
      final notificationTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(notification['time']!.split(':')[0]),
        int.parse(notification['time']!.split(':')[1]),
      );

      if (notificationTime.isBefore(now)) {
        notificationTime.add(Duration(days: 1));
      }

      final timeUntilNotification = notificationTime.difference(now);

      Timer(timeUntilNotification, () {
        _showNotification(notification);
      });
    });
  }

  void _showNotification(Map<String, String> notification) {
    print('Notification: ${notification['title']}');
  }

  @override
  void dispose() {
    super.dispose();
    _watertimer.cancel();
    _fasttimer.cancel();
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
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/homeNavigationBar');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: <Widget>[
              BackComponent(
                onPressed: () {
                  Beamer.of(context).beamBack();
                },
                text: S.of(context).notification,
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
      ),
    );
  }
}

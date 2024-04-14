// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class NotificationViewModel extends ChangeNotifier {
//   late Timer waterTimer;
//   late Timer fastTimer;
//
//   List<Map<String, String>> notifications = [];
//
//   NotificationModel() {
//     _loadNotifications();
//     _scheduleNotifications();
//     waterTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
//       addWaterNotification();
//     });
//     fastTimer = Timer.periodic(const Duration(minutes: 3), (timer) {
//       addFastNotification();
//     });
//   }
//
//   Future<void> _loadNotifications() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedNotifications = prefs.getStringList('notifications');
//     if (savedNotifications != null) {
//       notifications = savedNotifications
//           .map((jsonString) => Map<String, String>.from(jsonDecode(jsonString)))
//           .toList();
//       _scheduleNotifications();
//     }
//   }
//
//   Future<void> _saveNotifications() async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<String> jsonNotifications = notifications.map((notification) {
//       return jsonEncode(notification);
//     }).toList();
//     await prefs.setStringList('notifications', jsonNotifications);
//   }
//
//   void _scheduleNotifications() {
//     notifications.forEach((notification) {
//       final now = DateTime.now();
//       final notificationTime = DateTime(
//         now.year,
//         now.month,
//         now.day,
//         int.parse(notification['time']!.split(':')[0]),
//         int.parse(notification['time']!.split(':')[1]),
//       );
//
//       if (notificationTime.isBefore(now)) {
//         notificationTime.add(Duration(days: 1));
//       }
//
//       final timeUntilNotification = notificationTime.difference(now);
//
//       Timer(timeUntilNotification, () {
//         _showNotification(notification);
//       });
//     });
//   }
//
//   void _showNotification(Map<String, String> notification) {
//     print('Notification: ${notification['title']}');
//   }
//
//   void addWaterNotification() {
//     final waterNotification = {
//       'title': 'Drink Water',
//       'body': 'Reminder to drink water',
//       'time': DateTime.now().toString().substring(11, 16),
//     };
//     notifications.add(waterNotification);
//     _saveNotifications();
//     notifyListeners();
//   }
//
//   void addFastNotification() {
//     final fastNotification = {
//       'title': 'Start Fasting',
//       'body': 'Reminder to start Fasting',
//       'time': DateTime.now().toString().substring(11, 16),
//     };
//     notifications.add(fastNotification);
//     _saveNotifications();
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     waterTimer.cancel();
//     fastTimer.cancel();
//   }
// }
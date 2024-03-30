// //
// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:pedometer/pedometer.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:virtam/component/text_component.dart';
// //
// //
// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});
// //
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   late String _timeString;
// //   int initSteps = 0;
// //   late DateTime _currentDate;
// //   StreamSubscription<StepCount>? _subscription;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     requestPermission();
// //     _listenToSteps();
// //     _timeString = _formatDateTime(DateTime.now());
// //     _currentDate = DateTime.now();
// //     _checkDateChange();
// //     Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
// //     Timer.periodic(const Duration(hours: 1), (Timer t) => _checkDateChange());
// //   }
// //
// //   void _checkDateChange() {
// //     final now = DateTime.now();
// //     if (_currentDate.day != now.day) {
// //       setState(() {
// //         initSteps = 0;
// //         _currentDate = now;
// //       });
// //     }
// //   }
// //
// //   Future<void> requestPermission() async {
// //     final PermissionStatus status = await Permission.activityRecognition.request();
// //     if (status == PermissionStatus.granted) {
// //       // Permission granted, proceed with using pedometer
// //     } else {
// //       // Permission not granted, handle accordingly
// //     }
// //   }
// //
// //   String _formatDateTime(DateTime dateTime) {
// //     return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
// //   }
// //
// //   void _getTime() {
// //     final DateTime now = DateTime.now();
// //     final String formattedDateTime = _formatDateTime(now);
// //     setState(() {
// //       _timeString = formattedDateTime;
// //     });
// //   }
// //
// //   void _listenToSteps() {
// //     _subscription = Pedometer.stepCountStream.listen(
// //       _onStepCount,
// //       onError: _onError,
// //       onDone: _onDone,
// //       cancelOnError: true,
// //     );
// //   }
// //
// //   void _onStepCount(StepCount event) {
// //     setState(() {
// //       initSteps = event.steps % 100000;
// //     });
// //   }
// //
// //   void _onDone() {}
// //
// //   void _onError(error) {
// //     print("An error occurred while fetching step count: $error");
// //   }
// //
// //   @override
// //   void dispose() {
// //     _subscription?.cancel();
// //     super.dispose();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Center(
// //             child: Text(
// //               'Home Page'
// //             ),
// //           ),
// //         ),
// //         //backgroundColor: Colors.black,
// //         body: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               const SizedBox(height: 50,),
// //               // LinearProgressIndicator(
// //               //   value: progressValue, // progress
// //               //   backgroundColor: Colors.grey, // Color of the track
// //               //   valueColor: const AlwaysStoppedAnimation<Color>(
// //               //       Colors.green), // Color of the progress bar
// //               // ),
// //               Column(
// //                 children: [
// //                   const TextComponent(
// //                       text: 'Steps For Today ',
// //                   textStyle: TextStyle(fontSize: 25),),
// //                   Center(
// //                     child: Text(
// //                       '$initSteps',
// //                       style:  TextStyle(
// //                         color: Theme.of(context).primaryColor,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 100.0,
// //                       ),
// //                     ),
// //                   ),
// //                   const Text('---------------------------------------------------------------------------------------------'),
// //                 ],
// //               ),
// //               Column(
// //                 children: [
// //                   const TextComponent(
// //                       text: 'Drinking water  ',
// //                   textStyle: TextStyle(fontSize: 25),),
// //                   Center(
// //                     child: Text(
// //                       'counter ',
// //                       style:  TextStyle(
// //                         color: Theme.of(context).primaryColor,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 50.0,
// //                       ),
// //                     ),
// //                   ),
// //                   const Text('---------------------------------------------------------------------------------------------'),
// //                 ],
// //               ),
// //               Column(
// //                 children: [
// //                   Row(
// //                      mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //
// //                       const TextComponent(
// //                           text: 'Fasting ',
// //                       textStyle: TextStyle(fontSize: 25),),
// //                       //SizedBox(width: 70,),
// //                       Align(
// //                         alignment: Alignment.topRight,
// //                         child:  IconButton(onPressed: (){},
// //                             icon: Icon(Icons.edit)),
// //                       ),
// //                     ],
// //                   ),
// //                   Center(
// //                     child: Text(
// //                       'counter ',
// //                       style:  TextStyle(
// //                         color: Theme.of(context).primaryColor,
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 50.0,
// //                       ),
// //                     ),
// //                   ),
// //                   const Text('---------------------------------------------------------------------------------------------'),
// //                 ],
// //               ),
// //
// //             ],
// //           ),
// //         ),
// //       floatingActionButton: FloatingActionButton(
// //
// //         onPressed: (){},
// //         child: const Icon(
// //           Icons.help
// //         ),
// //       )
// //
// //         ),
// //     );
// //   }
// // }
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late String _timeString;
//   int initSteps = 0;
//   int initKcals = 0;
//   double initMiles = 0.0;
//   int initMinutes = 0;
//   double progressValue = 0.0;
//
//   StreamSubscription<StepCount>? _subscription;
//
//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//     _listenToSteps();
//     _timeString = _formatDateTime(DateTime.now());
//     Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
//   }
//
//   Future<void> requestPermission() async {
//     final PermissionStatus status = await Permission.activityRecognition.request();
//     if (status == PermissionStatus.granted) {
//       // Permission granted, proceed with using pedometer
//     } else {
//       // Permission not granted, handle accordingly
//     }
//   }
//
//   String _formatDateTime(DateTime dateTime) {
//     return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//   }
//
//   void _getTime() {
//     final DateTime now = DateTime.now();
//     final String formattedDateTime = _formatDateTime(now);
//     setState(() {
//       _timeString = formattedDateTime;
//     });
//   }
//
//   void _listenToSteps() {
//     _subscription = Pedometer.stepCountStream.listen(
//       _onStepCount,
//       onError: _onError,
//       onDone: _onDone,
//       cancelOnError: true,
//     );
//   }
//
//   void _onStepCount(StepCount event) {
//     setState(() {
//       initSteps = event.steps % 10000;
//       progressValue = event.steps / 10000;
//       print("Step Count: ${event.steps}");
//     });
//   }
//
//   void _onDone() {} // Handle when stream is done if needed
//
//   void _onError(error) {
//     print("An error occurred while fetching step count: $error");
//   }
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.fromLTRB(25.0, 65, 25.0, 0.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text('iCounter',
//                       style: TextStyle(
//                           color: Colors.green,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold)),
//                   Text(_timeString,
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold)),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25.0),
//             LinearProgressIndicator(
//               value: progressValue, // progress
//               backgroundColor: Colors.grey, // Color of the track
//               valueColor: const AlwaysStoppedAnimation<Color>(
//                   Colors.green), // Color of the progress bar
//             ),
//             const SizedBox(height: 30.0),
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.keyboard_arrow_left,
//                   color: Colors.grey,
//                   size: 60.0,
//                 ),
//                 SizedBox(width: 30.0),
//                 Text(
//                   'Today',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 35.0,
//                   ),
//                 ),
//                 SizedBox(width: 30.0),
//                 Icon(
//                   Icons.keyboard_arrow_right,
//                   color: Colors.grey,
//                   size: 60.0,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 48),
//             Center(
//               child: Text(
//                 '$initSteps',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 100.0,
//                 ),
//               ),
//             ),
//             const Text(
//               'steps today',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 20.0,
//               ),
//             ),
//             const SizedBox(height: 30.0),
//             Text(
//               '$initSteps/10.000s',
//               style: const TextStyle(
//                 color: Colors.green,
//                 fontSize: 25.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 40.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Text(
//                       '$initKcals',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25.0,
//                       ),
//                     ),
//                     const SizedBox(height: 5.0),
//                     const Text(
//                       'KCAL',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 50.0),
//                 Column(
//                   children: [
//                     Text(
//                       '$initMiles',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25.0,
//                       ),
//                     ),
//                     const SizedBox(height: 5.0),
//                     const Text(
//                       'MILES',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 50.0),
//                 Column(
//                   children: [
//                     Text(
//                       '$initMinutes',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 25.0,
//                       ),
//                     ),
//                     const SizedBox(height: 5.0),
//                     const Text(
//                       'Minutes',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40.0),
//             const SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.circle_outlined,
//                         color: Colors.white,
//                         size: 50.0,
//                       ),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'MON',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.circle_outlined,
//                         color: Colors.white,
//                         size: 50.0,
//                       ),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'TUE',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.circle_outlined,
//                         color: Colors.white,
//                         size: 50.0,
//                       ),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'WED',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.circle_outlined,
//                         color: Colors.white,
//                         size: 50.0,
//                       ),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'THU',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.circle_outlined,
//                         color: Colors.white,
//                         size: 50.0,
//                       ),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'FRI',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.circle_outlined,
//                         color: Colors.white,
//                         size: 50.0,
//                       ),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'SAT',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 8.0),
//                   Column(
//                     children: [
//                       Icon(
//                         Icons.circle_outlined,
//                         color: Colors.white,
//                         size: 50.0,
//                       ),
//                       SizedBox(width: 8.0),
//                       Text(
//                         'SUN',
//                         style: TextStyle(
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// //
// // class NotificationPage extends StatelessWidget {
// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// //   FlutterLocalNotificationsPlugin();
// //
// //   Future<void> _showNotification() async {
// //     const AndroidNotificationDetails androidPlatformChannelSpecifics =
// //     AndroidNotificationDetails(
// //       'alarm_channel',
// //       'Alarm Channel',
// //       channelDescription: 'Channel for alarm notifications',
// //       importance: Importance.max,
// //       priority: Priority.high,
// //       styleInformation: BigTextStyleInformation(''),
// //     );
// //     const NotificationDetails platformChannelSpecifics =
// //     NotificationDetails(android: androidPlatformChannelSpecifics);
// //     await flutterLocalNotificationsPlugin.show(
// //       0,
// //       'Alarm!',
// //       'Wake up! It\'s time to start your day.',
// //       platformChannelSpecifics,
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Alarm Notification'),
// //       ),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: _showNotification,
// //           child: Text('Set Alarm'),
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen/home_screen_view_model.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int countdownSeconds = 180;
  late CountdownTimer countdownTimer;
  bool isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    initTimerOperation();
  }

  void initTimerOperation() {
    countdownTimer = CountdownTimer(
      seconds: countdownSeconds,
      onTick: (seconds) {
        setState(() {
          isTimerRunning = true;
          countdownSeconds = seconds;
        });
      },
      onFinished: () {
        setState(() {
          isTimerRunning = false;
          countdownSeconds = 0;
        });
      },
    );

    SystemChannels.lifecycle.setMessageHandler((msg) {
      if (msg == AppLifecycleState.paused.toString()) {
        if (isTimerRunning) {
          countdownTimer.pause(countdownSeconds);
        }
      }

      if (msg == AppLifecycleState.resumed.toString()) {
        if (isTimerRunning) {
          countdownTimer.resume();
        }
      }
      return Future(() => null);
    });

    isTimerRunning = true;
    countdownTimer.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          formatDuration(Duration(seconds: countdownSeconds)),
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    countdownTimer.stop();
    super.dispose();
  }
}

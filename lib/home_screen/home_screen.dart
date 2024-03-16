import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtam/component/logo_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/notifications.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<HomeScreen> {
//   int dailyStepCount = 0;
//   int? lastSavedStepCount;
//
//   StreamSubscription<StepCount>? _subscription;
//
//   @override
//   void initState() {
//     super.initState();
//     requestPermission();
//     startListeningToSteps();
//     getLastSavedStepCount();
//   }
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
//
//   Future<void> requestPermission() async {
//     final PermissionStatus status = await Permission.activityRecognition.request();
//     if (status != PermissionStatus.granted) {
//       // Handle permission not granted
//     }
//   }
//
//   void startListeningToSteps() {
//     _subscription = Pedometer.stepCountStream.listen(
//           (StepCount event) {
//         setState(() {
//           dailyStepCount = (event.steps - (lastSavedStepCount ?? event.steps));
//           DateTime timeStamp = event.timeStamp;
//
//         });
//         saveDailyStepCount(event.steps);
//       },
//       onError: (error) {
//         print("An error occurred while fetching step count: $error");
//       },
//       cancelOnError: true,
//     );
//   }
//
//
//   Future<void> getLastSavedStepCount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       lastSavedStepCount = prefs.getInt('lastSavedStepCount');
//     });
//   }
//
//   Future<void> saveDailyStepCount(int stepCount) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('lastSavedStepCount', stepCount);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Step Counter'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 48),
//             Column(
//               children: [
//                 const Text(
//                   'Steps today',
//                   style: TextStyle(fontSize: 25),
//                 ),
//                 Center(
//                   child: Text(
//                     '$dailyStepCount',
//                     style: TextStyle(
//                       fontSize: 80,
//                       color: Theme.of(context).primaryColor,
//                     ),
//                   ),
//                 ),
//                 const Divider(),
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: (){},
                        icon: ImageIcon(AssetImage('images/more.png'),),),
                    SizedBox(width: screenSize.width * 0.27 ,),
                    Center(child: LogoComponent()),
                    SizedBox(width: screenSize.width * 0.27
                      ,),
                    IconButton(
                        onPressed: (){},
                        icon: ImageIcon(AssetImage('images/notification.png'),),),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on_rounded, size: 15,),
                    TextComponent(text:'Location Name',textStyle: TextStyle(fontSize: 15),),
                    Icon(Icons.expand_more_sharp, size: 15,),
                  ],
                ),
              ],
            ),
          ),
        ),);
  }
}



import 'dart:async';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/circular_component.dart';
import 'package:virtam/component/home_component.dart';
import 'package:virtam/component/logo_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/home_screen/home_screen_view_model.dart';
import 'package:virtam/notifications.dart';

import '../component/viewall_component.dart';
import '../generated/l10n.dart';
import '../helper/calories_class.dart';
import '../register_screen/register_screen_view_model.dart';
import '../step1-10_screens/user_data_step9_screen/user_data_step9_view_model.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int getSteps = 0;
  int distance =0;
  late StepCalculator calculator = StepCalculator();
  final HealthFactory health = HealthFactory();
  late StreamSubscription<StepCount> _subscription;
  final List<ChartData> chartData = [
    ChartData(80, 1),
    ChartData(76, 2),
    ChartData(68, 3),
    ChartData(60, 4),
    ChartData(55, 5)
  ];
  HomeViewModel?vm;

  @override
  void initState() {
    super.initState();
    calculator = StepCalculator();
    requestPermission();
    vm?.startTimer();
    //NotificationHelper.showNotification();
    //DrinkCounter();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  Future<void> requestPermission() async {
    final PermissionStatus status =
        await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      // Handle permission not granted
      return;
    }

    //await fetchStepData();




    _subscription = Pedometer.stepCountStream.listen((StepCount event) {
      setState(() {
        getSteps = event.steps;
      });
    });
  }


  // Future<void> fetchStepData() async {
  //   var permissions = [
  //     HealthDataAccess.READ,
  //   ];
  //
  //   bool requested = await health
  //       .requestAuthorization([HealthDataType.STEPS,], permissions: permissions);
  //   if (!requested) {
  //     // Handle authorization not granted
  //     print("Authorization not granted - error in authorization");
  //     return;
  //   }
  //
  //   final now = DateTime.now();
  //   final midnight = DateTime(now.year, now.month, now.day);
  //
  //   try {
  //     int? steps = await health.getTotalStepsInInterval(midnight, now);
  //     setState(() {
  //       getSteps = steps ?? 0;
  //     });
  //   } catch (error) {
  //     print("Error fetching step count: $error");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final UserDataStep9ViewModel userDataModel =
    Provider.of<UserDataStep9ViewModel>(context);

    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    final HomeViewModel homeViewModel =
    Provider.of<HomeViewModel>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final hour = strDigits(homeViewModel.myDuration.inHours.remainder(60));
    final minutes = strDigits(homeViewModel.myDuration.inMinutes.remainder(60));
    final seconds = strDigits(homeViewModel.myDuration.inSeconds.remainder(60));


    double calories = calculator.calculateCalories(
      isMetric: true,
      isRunning: false,
      bodyWeight: 70.0,
      stepLength: 70.0,
      stepCount: getSteps,
    );
    return WillPopScope(
        onWillPop: () async {
          Beamer.of(context).beamToNamed('/homeNavigationBar');
          return false;
    },
    child: SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Beamer.of(context).beamToNamed('/settingMenuScreen');
                  },
                  icon: const ImageIcon(
                    AssetImage('images/more.png'),
                  ),
                ),

                const Center(child: LogoComponent()),

                IconButton(
                  onPressed: () {
                    Beamer.of(context).beamToNamed('/notificationScreen');
                  },
                  icon: const ImageIcon(
                    AssetImage('images/notification.png'),
                  ),
                ),
              ],
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  size: 15,
                ),
                TextComponent(
                  text: S.of(context).locationName,
                  textStyle: const TextStyle(fontSize: 15),
                ),
                const Icon(
                  Icons.expand_more_sharp,
                  size: 15,
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            SizedBox(
              height: 200,
              width: 400,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: CircularComponent(
                  text1: DateFormat(' MMM d, y').format(DateTime.now(),),
                  text2: '$getSteps',
                  text3: S.of(context).stepGoal,
                )
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: HomeComponent(
                    valueText: '$calories',
                    text: S.of(context).calories,
                    icon: Icons.local_fire_department_outlined,
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.01,
                ),
                Expanded(
                  child: HomeComponent(
                    valueText: S.of(context).date,
                    text: S.of(context).time,
                    icon: Icons.access_time_outlined,
                  ),
                ),
                SizedBox(
                  width: screenSize.width * 0.01,
                ),
                Expanded(
                  child: HomeComponent(
                    valueText: '$distance',
                    text: S.of(context).distance,
                    icon: Icons.location_on,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Stack(
                      children: [
                        const Image(image: AssetImage('images/fasting.png'),fit: BoxFit.contain,),
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                onPressed: () {
                                  Beamer.of(context).beamToNamed('/fastScreen');
                                  },
                                  icon: const Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                              size: 20,
                            ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    S.of(context).duringFast,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              homeViewModel.notFinished
                                  ? '$hour:$minutes:$seconds'
                                  : 'Time Is Over ... !!  ',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextComponent(text: S.of(context).weightHistory),
                            IconButton(onPressed: (){
                              Beamer.of(context).beamToNamed('/weightHistoryScreen');
                            },
                                icon: const Icon(Icons.navigate_next))
                          ],
                        ),
                        SfCartesianChart(
                            margin: EdgeInsets.zero,
                            series: <CartesianSeries>[
                              SplineSeries<ChartData, int>(
                                color: Theme.of(context).primaryColor,
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                const Image(
                  image: AssetImage('images/water.png'),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const TextLabelBigComponent(text: '1,290 ml'),
                      TextComponent(text: S.of(context).remainingMl),
                      SizedBox(
                        height: screenSize.height * 0.04,
                      ),
                      SizedBox(
                          width: 100,
                          height: 25,
                          child: ButtonComponentContinue(
                            text: S.of(context).add,
                            onPress: (){
                              Beamer.of(context).beamToNamed('/drinkWaterScreen');
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextComponent(text: S.of(context).exercise ),
                    ViewAllComponent(
                      onPressed: (){
                        Beamer.of(context).beamToNamed('/exercisesScreen');

                      },
                    ),
                  ],
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Image(image: AssetImage('images/sport1.png')),
                      ),
                      Expanded(
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextComponent(
                                  text: 'Day 2-Fitness',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextComponent(
                                  text: 'Lorem ipsum dolor sit amet',
                                  textStyle:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 30,
                                    width: 110,
                                    child: ButtonComponentContinue(
                                      text: S.of(context).play,
                                      textStyle: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Image(image: AssetImage('images/sport2.png')),
                      ),
                      Expanded(
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextComponent(
                                  text: 'Day 2-Fitness',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextComponent(
                                  text: 'Lorem ipsum dolor sit amet',
                                  textStyle:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 30,
                                    width: 110,
                                    child: ButtonComponentContinue(
                                      text: S.of(context).play,
                                      textStyle: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}

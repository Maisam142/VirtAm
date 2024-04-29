import 'dart:async';
import 'dart:convert';
import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

import 'package:background_fetch/background_fetch.dart';
import '../../../component/viewall_component.dart';
import '../../../generated/l10n.dart';
import '../../../helper/calories_class.dart';
import '../../../helper/fasting.dart';
import '../../../helper/weight_class.dart';
import '../notification_screen/notification_sceen.dart';
import '../register_screen/register_screen_view_model.dart';
import 'home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    Future<void> getCounterData() async {
      int retrievedCounter = await NotificationController.getCounter();
    }
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
    stream: FirebaseFirestore.instance
        .collection('User')
        .doc(registerViewModel.emailController.text.toLowerCase())
        .snapshots(),
    builder: (_, snapshot) {
      if (snapshot.hasError) return Text('Error = ${snapshot.error}');
      if (snapshot.hasData && snapshot.data!.exists) {
        final data = snapshot.data?.data();
        final startFastTimeShow = data!['startFastTime'];
        final endFastTimeShow = data['endFastTime'];
        final weightData = data['weight'];
        final waterTarget = data['waterTarget'];
        final waterCounter = data['waterCounter ${dateTime.day}:${dateTime.month}:${dateTime.year} '] ?? 1000;

      //--------------------------------------------------------------------
        final startFastTime = parseTimeString(data['startFastTime']);
        final endFastTime = parseTimeString(data['endFastTime']);

        final startHour = startFastTime.hour;
        final endHour = endFastTime.hour;

        // print(startHour);
        // print(startFastTime);
        // print(startFastTimeShow);
        // print(endHour);
        // print(endFastTime);
        // print(endFastTimeShow);

        int hourDifference;
        if (endHour > startHour) {
          hourDifference = endHour - startHour;
        } else if (endHour < startHour) {
          hourDifference = 24 - startHour + endHour;
        } else {
          hourDifference = 0;
        }

        print('Hour Difference: $hourDifference');


        return HomeScreenContent(startHour:startHour,endHour:endHour,hourDifference:hourDifference, weight: weightData,waterTarget:waterTarget,waterCounter:waterCounter);
      }
      return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
    },
    ),

    );
  }
}

class HomeScreenContent extends StatefulWidget {
  final int startHour;
  final int endHour;
  final int waterCounter;
  final int hourDifference;
  final String waterTarget;
  final double weight;
  const HomeScreenContent({
    super.key, required this.startHour, required this.endHour, required this.hourDifference, required this.weight, required this.waterTarget, required this.waterCounter,
  });

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> implements HomeViewModelListeners{

  late int remainingHours;
  late Duration myDuration;
  late Timer? countdownTimer;
  bool notFinished = true;
  int? endTimeHour;
  int getSteps = 0;
  int distance =0;
  int dailyStepCount = 0;
  int? lastSavedStepCount;
  int currentDay = DateTime.now().day;
  int? savedDay ;
  int waterCounter = 0;

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
  late Timer waterTimer;
  late Timer fastTimer;

  List<Map<String, String>> notifications = [];
  @override
  void initState() {
    super.initState();
    print(notFinished);
    calculateTimer();
    startListeningToSteps();
    getLastSavedStepCount();
    calculator = StepCalculator();
    requestPermission();
    startTimer();
    getCounterData();
    NotificationHelper.showNotification().then((value) {
      addWaterNotification();
    });

    // waterTimer = Timer.periodic(const Duration(hours: 1), (timer) {
    //   addWaterNotification();
    // });
    // fastTimer = Timer.periodic(const Duration(minutes: 2), (timer) {
    //   addFastNotification();
    // });
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
    _subscription.cancel();
    super.dispose();
  }


  void calculateTimer() {
    int currentHour = DateTime.now().hour;
    int currentMinute = DateTime.now().minute;
    int currentSecond = DateTime.now().second;



    int remainingHours = currentHour> widget.endHour ?   currentHour-widget.endHour : widget.endHour-currentHour;
    int remainingMinutes = 59 - currentMinute;
    int remainingSeconds = 60 - currentSecond;
    myDuration = Duration(hours: remainingHours-1, minutes: remainingMinutes, seconds: remainingSeconds);
  }



  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds <= 0) {
      countdownTimer!.cancel();
      notFinished = false;
      setState(() {});
    } else {
      myDuration = Duration(seconds: seconds);
      notFinished = true;
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> getCounterData() async {
    int retrievedCounter = await NotificationController.getCounter();
    setState(() {
      waterCounter = retrievedCounter;
    });
  }
  void startTimer() {
    if (DateTime.now().hour >= widget.startHour || DateTime.now().hour < widget.endHour) {
      DateTime startDateTime = DateTime.now().add(const Duration(seconds: 1));
      Duration initialDelay = startDateTime.difference(DateTime.now());

      countdownTimer = Timer(initialDelay, () {
        countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
      });
    } else {
      notFinished = false;
      setState(() {});
    }
  }

  Future<void> requestPermission() async {
    final PermissionStatus status =
    await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      return startListeningToSteps();
    }

  }

  void startListeningToSteps() {
    _subscription = Pedometer.stepCountStream.listen(
          (StepCount event) {
        setState(() {
          dailyStepCount = (event.steps - (lastSavedStepCount ?? event.steps));
        });
          saveDailyStepCount(event.steps);
          print('${event.steps} -------------------------------***********************************************');
          print('${dailyStepCount} -------------------------------@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
          print('${lastSavedStepCount} -------------------------------###########################################');
      },
      onError: (error) {
        print("An error occurred while fetching step count: $error");
      },
      cancelOnError: true,
    );
  }


  Future<void> getLastSavedStepCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lastSavedStepCount = prefs.getInt('lastSavedStepCount');
      savedDay = prefs.getInt('savedDay');
      print("$savedDay -------------=================================------");
      print("$currentDay -------------=================================------");
    });
  }


  Future<void> saveDailyStepCount(int stepCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (savedDay !=  currentDay  || lastSavedStepCount == null) {
      savedDay = DateTime.now().day;
      prefs.setInt('savedDay', savedDay!);
      print('*************************************************');
      await prefs.setInt('lastSavedStepCount', stepCount);
    }
  }





  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final water = int.parse(widget.waterTarget);

    //final int waterRemaining = water - 0 ;
    final HomeViewModel homeViewModel =
    Provider.of<HomeViewModel>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final hour = strDigits(myDuration.inHours.remainder(60));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    String counterText = waterCounter.toString();


    double calories = calculator.calculateCalories(
      isMetric: true,
      isRunning: false,
      bodyWeight: widget.weight,
      stepLength: 170.0,
      stepCount: dailyStepCount,
    );
    var cal = calories.toString();
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(notifications: notifications,),
                          ),
                        );
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
                        text2: '$dailyStepCount',
                        text3: S.of(context).stepGoal,
                      )
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: HomeComponent(
                        valueText: cal.substring(0,6),
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
                            const Image(image: AssetImage('images/fasting.png'),fit: BoxFit.fill,
                              height: 140,),
                            Column(
                              children: [
                                //SizedBox(height:20 ,),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
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
                                ),
                                Text(
                                  notFinished? '$hour:$minutes:$seconds':
                                  '--:--:--',
                                  style:  TextStyle(
                                      color: notFinished ? Colors.white:
                                      Colors.green,
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
                                  ),
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
                            height: 20,
                          ),
                          TextLabelBigComponent(text: '$waterCounter ${S.of(context).ml}' ),
                          TextComponent(text: '${S.of(context).remainingml} $water ${S.of(context).ml} '),
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
                            ),),
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
                ),
              ]),
            ),
          ),
        ));
  }
}

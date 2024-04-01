import 'dart:async';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:logger_util/logger_util.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_screen_reading_writing_model.dart';

class HomeViewModel extends ChangeNotifier {

  //
  // HomeViewModel(){
  //   startTimer();
  // }

  // UserDataStep9ViewModel?vm;

  late String timeString;
  int initSteps = 0;
  double progressValue = 0.0;
  late DateTime _currentDate;

  StreamSubscription<StepCount>? subscription;
  HomeReadingWritingModel? readingWritingModel;
  HomeViewModelListeners? _homeViewModelListeners;
  int _stepCount = 0;
  double mDistance = 0.0;
  bool mIsMetric = true;
  int get stepCount => _stepCount;

  Timer? countdownTimer;
  Duration myDuration = const Duration(hours: 14);
  bool notFinished = true;
  int? startTimeHour;
  int? startTimeMinute;
  //final int? startTime= vm?.selectedDate.hour;
  void init(HomeViewModelListeners homeViewModelListeners) {
    _homeViewModelListeners = homeViewModelListeners;
    readingWritingModel = HomeReadingWritingModel();
    _init();
  }

  void _init() {
    //_requestPermission();
    //_listenToSteps();
    //timeString = _formatDateTime(DateTime.now());
    //_currentDate = DateTime.now();
    //Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    //Timer.periodic(const Duration(hours: 1), (Timer t) => _checkDateChange());
  }


  //
  // void setCountDown() {
  //   const reduceSecondsBy = 1;
  //   final seconds = myDuration.inSeconds - reduceSecondsBy;
  //   if (seconds <= 0) {
  //     countdownTimer!.cancel();
  //     notFinished = false;
  //   } else {
  //     myDuration = Duration(seconds: seconds);
  //     notFinished = true;
  //   }
  //   notifyListeners();
  // }
  //
  // void startTimer() {
  //   DateTime now = DateTime.now();
  //   DateTime startDateTime = DateTime(now.year, now.month, now.day, 11, 53 , 00);
  //   if (now.isAfter(startDateTime)) {
  //     startDateTime = startDateTime.add(const Duration(days: 1));
  //   }
  //   Duration initialDelay = startDateTime.difference(now);
  //
  //   countdownTimer = Timer(initialDelay, () {
  //     countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  //   });
  // }
  //

  // void updateStepCount(int count) {
  //   _stepCount = count;
  //   notifyListeners();
  // }



  // Future<void> _requestPermission() async {
  //   final PermissionStatus status = await Permission.activityRecognition.request();
  //   if (status != PermissionStatus.granted) {
  //     print('Permission not granted for accessing step count data');
  //   }
  // }
  //
  // String _formatDateTime(DateTime dateTime) {
  //   return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  // }

  // void _getTime() {
  //   final DateTime now = DateTime.now();
  //   final String formattedDateTime = _formatDateTime(now);
  //   timeString = formattedDateTime;
  //   notifyListeners();
  // }
  //
  // // void _listenToSteps() {
  //   subscription = Pedometer.stepCountStream.listen(
  //     _onStepCount,
  //     onError: _onError,
  //     onDone: _onDone,
  //     cancelOnError: true,
  //   );
  // }

  // void _onStepCount(StepCount event) {
  //   initSteps = event.steps % 100000;
  //   progressValue = initSteps / 10000;
  //   print("Step Count: ${initSteps}");
  //   notifyListeners();
  // }

  // void _checkDateChange() {
  //   final now = DateTime.now();
  //   if (_currentDate.day != now.day) {
  //     initSteps = 0; // Reset the step count
  //     _currentDate = now; // Update the current date
  //     notifyListeners();
  //   }
  // }

  // void _onDone() {}
  //
  // void _onError(error) {
  //   print("An error occurred while fetching step count: $error");
  //   notifyListeners();
  // }
  //
  // @override
  // void dispose() {
  //   subscription?.cancel();
  //   super.dispose();
  // }
  static const double METRIC_RUNNING_FACTOR = 1.02784823;
  static const double METRIC_WALKING_FACTOR = 0.708;

  static const double IMPERIAL_RUNNING_FACTOR = 0.750319;
  static const double IMPERIAL_WALKING_FACTOR = 0.555;

  double calculateCalories({
  required bool isMetric,
  required bool isRunning,
  required double bodyWeight,
  required double stepLength,
  required int stepCount,
  }) {
  double calories = 0.0;
  if (isMetric) {
  calories += (bodyWeight * (isRunning ? METRIC_RUNNING_FACTOR : METRIC_WALKING_FACTOR)) *
  stepLength / 100000.0;
  } else {
  calories += (bodyWeight * (isRunning ? IMPERIAL_RUNNING_FACTOR : IMPERIAL_WALKING_FACTOR)) *
  stepLength / 63360.0;
  }
  return calories;
  }



  void onStep(double mStepLength) {
  if (mIsMetric) {
  mDistance += mStepLength / 100000.0;
  } else {
  mDistance += mStepLength / 63360.0;
  }
  notifyListeners();
  }

}

class HomeViewModelListeners {}

class TimerDifferenceHandler {
  static late DateTime endingTime;

  static final TimerDifferenceHandler _instance = TimerDifferenceHandler();

  static TimerDifferenceHandler get instance => _instance;

  int get remainingSeconds {
    final DateTime dateTimeNow = DateTime.now();
    Duration remainingTime = endingTime.difference(dateTimeNow);
    // Return in seconds
    return remainingTime.inSeconds;
  }

  void setEndingTime(int durationToEnd) {
    final DateTime dateTimeNow = DateTime.now();
    endingTime = dateTimeNow.add(
      Duration(
        seconds: durationToEnd,
      ),
    );
  }
}
class CountdownTimer {
  int _countdownSeconds;
  late Timer _timer;
  final Function(int)? _onTick;
  final Function()? _onFinished;
  final timerHandler = TimerDifferenceHandler.instance;
  bool onPausedCalled = false;

  CountdownTimer({
    required int seconds,
    Function(int)? onTick,
    Function()? onFinished,
  })  : _countdownSeconds = seconds,
        _onTick = onTick,
        _onFinished = onFinished;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countdownSeconds--;
      if (_onTick != null) {
        _onTick(_countdownSeconds);
      }

      if (_countdownSeconds <= 0) {
        stop();
        if (_onFinished != null) {
          _onFinished();
        }
      }
    });
  }


  void pause(int endTime) {
    onPausedCalled = true;
    stop();
    timerHandler.setEndingTime(endTime);
  }

  void resume() {
    if(!onPausedCalled){
      return;
    }
    if (timerHandler.remainingSeconds > 0) {
      _countdownSeconds = timerHandler.remainingSeconds;
      start();
    } else {
      stop();
      _onTick!(_countdownSeconds); //callback
    }
    onPausedCalled = false;
  }

  void stop() {
    _timer.cancel();
    _countdownSeconds = 0;
  }
}

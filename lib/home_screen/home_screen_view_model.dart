import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_screen_reading_writing_model.dart';

class HomeViewModel extends ChangeNotifier {
  late String timeString;
  int initSteps = 0;
  double progressValue = 0.0;
  late DateTime _currentDate;

  StreamSubscription<StepCount>? subscription;
  HomeReadingWritingModel? readingWritingModel;
  HomeViewModelListeners? _homeViewModelListeners;
  int _stepCount = 0;

  int get stepCount => _stepCount;

  void updateStepCount(int count) {
    _stepCount = count;
    notifyListeners();
  }

  void init(HomeViewModelListeners homeViewModelListeners) {
    _homeViewModelListeners = homeViewModelListeners;
    readingWritingModel = HomeReadingWritingModel();
    _init();
  }

  void _init() {
    _requestPermission();
    _listenToSteps();
    timeString = _formatDateTime(DateTime.now());
    _currentDate = DateTime.now();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(const Duration(hours: 1), (Timer t) => _checkDateChange());
  }

  Future<void> _requestPermission() async {
    final PermissionStatus status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      // Permission not granted, handle accordingly
      print('Permission not granted for accessing step count data');
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    timeString = formattedDateTime;
    notifyListeners();
  }

  void _listenToSteps() {
    subscription = Pedometer.stepCountStream.listen(
      _onStepCount,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );
  }

  void _onStepCount(StepCount event) {
    initSteps = event.steps % 100000;
    progressValue = initSteps / 10000;
    print("Step Count: ${initSteps}");
    notifyListeners();
  }

  void _checkDateChange() {
    final now = DateTime.now();
    if (_currentDate.day != now.day) {
      initSteps = 0; // Reset the step count
      _currentDate = now; // Update the current date
      notifyListeners();
    }
  }

  void _onDone() {}

  void _onError(error) {
    print("An error occurred while fetching step count: $error");
    notifyListeners();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }
}

class HomeViewModelListeners {}

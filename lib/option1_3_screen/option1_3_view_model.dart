import 'package:flutter/material.dart';

class Option13ViewModel extends ChangeNotifier {
  TextEditingController dateController = TextEditingController();
  TextEditingController bedTimeController = TextEditingController();
  TextEditingController wakeUpTimeController = TextEditingController();
  Map<String, int?> choiceValues = {};


  int? allergyValue;
  int? thyroidCheckValue;
  int? thyroidProblemValue;
  int? ironCheckValue;
  int? ironDefectValue;
  int? vitaminDCheckValue;
  int? vitaminDDeficiencyValue;
  int? vitaminB12CheckValue;
  int? vitaminB12DeficiencyValue;
  int? employeeValue;
  int? workNatureValue;
  int? weight;
  TimeOfDay? wakeUpTime;
  TimeOfDay? bedtime;

  void setWakeUpTime(TimeOfDay time) {
    wakeUpTime = time;
    notifyListeners();
  }

  void setBedtime(TimeOfDay time) {
    bedtime = time;
    notifyListeners();
  }

  void setChoiceValue(String choiceKey, int index) {
    choiceValues[choiceKey] = index;
    notifyListeners();
  }
}


import 'package:flutter/cupertino.dart';

class FastTimeEditViewModel extends ChangeNotifier{
  DateTime _selectedStartFast = DateTime.now();

  DateTime get selectedStartFast => _selectedStartFast;
  DateTime _selectedEndFast = DateTime.now();

  DateTime get selectedEndFast => _selectedEndFast;

  set selectedEndFast(DateTime newDate) {
    _selectedEndFast = newDate;
    notifyListeners();
  }
  set selectedStartFast(DateTime newDate) {
    _selectedStartFast = newDate;
    notifyListeners();
  }

}

class FastTimeEditViewModelListener{

}
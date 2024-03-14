import 'package:flutter/cupertino.dart';

class UserDataStep10ViewModel extends ChangeNotifier{
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  set selectedDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

}

class UserDataViewModelStep10Listener{

}
import 'package:flutter/cupertino.dart';

class UserDataStep7ViewModel extends ChangeNotifier{

  int _selectedOption1 = 0;
  int get selectedOption1 => _selectedOption1;
  String _selectedPurpose1 = '';
  String get selectedPurpose1 => _selectedPurpose1;


  void updateSelectedPurpose1(String purpose) {
    _selectedPurpose1 = purpose;
    notifyListeners();
  }

  void updateSelectedOption1(int value) {
    _selectedOption1 = value;
    notifyListeners();
  }


}

class UserDataViewModelStep7Listener{

}
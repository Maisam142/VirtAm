import 'package:flutter/cupertino.dart';

class UserDataStep3ViewModel extends ChangeNotifier{

  int _selectedOption1 = 0;
  int get selectedOption1 => _selectedOption1;
  String _selectedPurpose1 = '';
  String get selectedPurpose1 => _selectedPurpose1;
  int _selectedOption2 = 0;
  int get selectedOption2 => _selectedOption2;
  String _selectedPurpose2 = '';
  String get selectedPurpose2 => _selectedPurpose2;

  void updateSelectedPurpose1(String purpose) {
    _selectedPurpose1 = purpose;
    notifyListeners();
  }

  void updateSelectedOption1(int value) {
    _selectedOption1 = value;
    notifyListeners();
  }

  void updateSelectedPurpose2(String purpose) {
    _selectedPurpose2 = purpose;
    notifyListeners();
  }

  void updateSelectedOption2(int value) {
    _selectedOption2 = value;
    notifyListeners();
  }
}

class UserDataViewModelStep3Listener{

}
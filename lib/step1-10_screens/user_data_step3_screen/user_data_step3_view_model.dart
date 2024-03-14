import 'package:flutter/cupertino.dart';

class UserDataStep3ViewModel extends ChangeNotifier{
  int _selectedOption = 0;
  int get selectedOption => _selectedOption;
  String _selectedPurpose = '';
  String get selectedPurpose => _selectedPurpose;

  void updateSelectedPurpose(String purpose) {
    _selectedPurpose = purpose;
    notifyListeners();
  }

  void updateSelectedOption(int value) {
    _selectedOption = value;
    notifyListeners();
  }
}

class UserDataViewModelStep3Listener{

}
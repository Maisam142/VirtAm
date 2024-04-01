import 'package:flutter/cupertino.dart';

class UserDataStep8ViewModel extends ChangeNotifier{
  TextEditingController officeController = TextEditingController();
  TextEditingController fieldController = TextEditingController();
  int _selectedOption1 = 1;
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

class UserDataViewModelStep8Listener{

}
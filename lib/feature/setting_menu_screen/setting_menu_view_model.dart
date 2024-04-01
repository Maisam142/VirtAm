import 'package:flutter/cupertino.dart';

class SettingMenuViewModel extends ChangeNotifier {
  int _selectedOption = 0;
  int get selectedOption => _selectedOption;
  String _selectedPurpose = '';
  String get selectedPurpose => _selectedPurpose;
  Map<String, int?> choiceValues = {};
  int? allergyValue;


  void updateSelectedPurpose(String purpose) {
    _selectedPurpose = purpose;
    notifyListeners();
  }

  void updateSelectedOption(int value) {
    _selectedOption = value;
    notifyListeners();
  }
  void setChoiceValue(String choiceKey, int index) {
    choiceValues[choiceKey] = index;
    notifyListeners();
  }
}
class SettingMenuViewModelListener{

}
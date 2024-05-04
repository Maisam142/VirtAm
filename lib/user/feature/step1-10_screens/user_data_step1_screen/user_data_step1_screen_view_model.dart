import 'package:flutter/material.dart';

class UserDataStep1ViewModel extends ChangeNotifier {
  int _selectedValueAge = 18;
  int get selectedValueAge => _selectedValueAge;

  double _selectedValueWeight = 50.0;
  double get selectedValueWeight => _selectedValueWeight;

  double _selectedValueHeight = 150.0;
  double get selectedValueHeight => _selectedValueHeight;

  void setSelectedValueAge(int value) {
    _selectedValueAge = value;
    notifyListeners();
  }

  void setSelectedValueWeight(double value) {
    _selectedValueWeight = value;
    notifyListeners();
  }

  void setSelectedValueHeight(double value) {
    _selectedValueHeight = value;
    notifyListeners();
  }
}

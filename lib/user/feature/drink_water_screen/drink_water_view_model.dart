import 'package:flutter/cupertino.dart';

class DrinkWaterViewModel extends ChangeNotifier{
  final TextEditingController targetController = TextEditingController();
  String _selectedValueTarget = '0';
  String get selectedValueTarget => _selectedValueTarget;

  void setSelectedValueTarget(String value) {
    _selectedValueTarget = value;
    notifyListeners();
  }
}
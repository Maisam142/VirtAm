import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ForgetViewModel extends ChangeNotifier {

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  String? name;
  bool? isChecked = false;
  bool? isEmpty = false;

  bool isPasswordValid = true;
  bool isValidRewritePass = true;

  bool isObscure = true;

  bool _isValidPhoneNumber = true;
  bool get isValidPhoneNumber => _isValidPhoneNumber;

  List<bool> validationStatus = [false, false, false, false,false];
  bool _showPasswordRequirements = false;
  int _selectedOption = 0;
  int get selectedOption => _selectedOption;
  bool _isTermsChecked = false;
  bool get isTermsChecked => _isTermsChecked;
  String _selectedPurpose = '';

  String get selectedPurpose => _selectedPurpose;

  void updateSelectedPurpose(String purpose) {
    _selectedPurpose = purpose;
    notifyListeners();
  }


  void updateTermsChecked(bool value) {
    _isTermsChecked = value;
    notifyListeners();
  }


  void updateSelectedOption(int value) {
    _selectedOption = value;
    notifyListeners();
  }



  void setShowPasswordRequirements(bool value) {
    _showPasswordRequirements = value;
    notifyListeners();
  }

  bool get showPasswordRequirements => _showPasswordRequirements;

  void validatePassword(String password) {
    validationStatus[0] = c(r'[a-zA-Z]');
    validationStatus[1] = c(r'[A-Z]');
    validationStatus[2] = c(r'[0-9]');
    validationStatus[3] = c1(password);
    validationStatus[4] = c(r'[\$&*~]');

    notifyListeners();
  }

  visibilityPass (){
    isObscure = !isObscure;
    notifyListeners();
  }



  bool c(String b) {notifyListeners();
  String p1 = b;
  RegExp r = RegExp(p1);

  if (r.hasMatch(passwordController.text) == true) {
    notifyListeners();
    return true;
  } else {
    notifyListeners();
    return false;
  }
  }
  bool c1(String b) {
    if (b.length >= 8) {
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

  void isEmptyField(){
    isEmpty = true;
    notifyListeners();
  }



}
class ForgetViewModelListener{

}

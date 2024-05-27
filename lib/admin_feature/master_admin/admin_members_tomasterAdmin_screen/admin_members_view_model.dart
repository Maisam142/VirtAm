import 'package:flutter/cupertino.dart';

class AdminMembersToMasterViewModel extends ChangeNotifier{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController  = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();



  bool isEmailValid = true;
  bool isNameValid = true;
  bool isObscure = true;
  bool isObscureRewrite = true;
  bool isValidRewritePass = true;
  bool isPasswordValid = true;
  String _selectedCountry = 'JO';
  String get selectedCountry => _selectedCountry;
  bool isPhoneNumberValid = true;
  String? phoneNumber;
  bool _isValidPhoneNumber = true;
  bool get isValidPhoneNumber => _isValidPhoneNumber;


  bool validateFields() {
    isNameValid = nameController.text.isNotEmpty;
    isEmailValid = emailController.text.isNotEmpty;
    isPasswordValid = passwordController.text.isNotEmpty;
    isValidRewritePass = passwordController.text == rePasswordController.text;
    notifyListeners();
    return isNameValid && isEmailValid && isPasswordValid && isValidRewritePass && isPhoneNumberValid;
  }


  visibilityPass (){
    isObscure = !isObscure;
    notifyListeners();
  }
  visibilityRewritePass (){
    isObscureRewrite = !isObscureRewrite;
    notifyListeners();
  }


  void updateSelectedCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void updatePhoneNumberValidity(bool isValid) {
    _isValidPhoneNumber = isValid;
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  void updateCountry(String value) {
    _selectedCountry = value;
    notifyListeners();
  }


}
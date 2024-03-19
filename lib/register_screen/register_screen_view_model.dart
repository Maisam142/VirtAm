import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel extends ChangeNotifier{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController  = TextEditingController();
  final TextEditingController countryController  = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  String? name;
  String? email;
  String? phoneNumber;
  String? country;
  bool? isChecked = false;
  bool? isEmpty = false;
  bool isCheckedOption1 = false;
  bool isCheckedOption2 = false;
  bool isCheckedOption3 = false;
  bool isNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isValidRewritePass = true;
  String _selectedCountry = 'JO';
  String get selectedCountry => _selectedCountry;
  bool isObscure = true;
  bool isObscureRewrite = true;

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
    validationStatus[4] = c(r'[\$&*~@#]');

    notifyListeners();
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

  void validateFields() {
    isEmailValid = emailController.text.isNotEmpty &&
        emailController.text.contains("@");
    isPasswordValid = passwordController.text.isNotEmpty &&
        RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
        ).hasMatch(passwordController.text);
    isNameValid = nameController.text.isNotEmpty;
    isValidRewritePass =
        passwordController.text == rePasswordController.text;

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

  bool get isFormValid =>
      isNameValid &&
          isEmailValid &&
          isPasswordValid &&
          isValidRewritePass &&
          isValidPhoneNumber;
  void isEmptyField(){
    isEmpty = true;
    notifyListeners();
  }
  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    email = value;
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


  void updateChecked(int option, bool value) {
    switch (option) {
      case 1:
        isCheckedOption1 = value;
        break;
      case 2:
        isCheckedOption2 = value;
        break;
      case 3:
        isCheckedOption3 = value;
        break;
    }
    notifyListeners();
  }
  // void addUserDataToFirestore(RegisterViewModel registerViewModel) async {
  //   CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  //   String userName = registerViewModel.name ?? 'Unknown';
  //   DocumentReference userDocRef = usersCollection.doc(userName);
  //   // CollectionReference userDataCollection = userDocRef.collection('userData');
  //
  //   await usersCollection.add({
  //     'name': registerViewModel.name,
  //     'email': registerViewModel.email,
  //   });
  //
  //   print('UserData added to Firestore subcollection under document ID: $userName');
  // }
}
class RegisterViewModelListener{

}
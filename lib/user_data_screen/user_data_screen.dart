import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/checkBox_component.dart';
import 'package:virtam/user_data_screen/user_data_view_model.dart';
import '../component/button_component.dart';
import '../component/form_component.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final UserDataViewModel userDataModel =
        Provider.of<UserDataViewModel>(context);
    final auth = FirebaseAuth.instance;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Center(
            child: Text(
              'USER INFO',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: const Color(0xffBE543D),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'User Info',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FormComponent(
                  controller: userDataModel.nameController,
                  hintText: 'name',
                  errorText: userDataModel.isNameValid
                      ? null
                      : 'Please enter your Name ',
                ),
                FormComponent(
                  onChanged: (val){
                    print('mm');
                  },
                  controller: userDataModel.emailController,
                  hintText: 'email',
                  textInputType: TextInputType.emailAddress,
                  errorText: userDataModel.isEmailValid
                      ? null
                      : 'Please enter a valid email ',
                ),
                Consumer<UserDataViewModel>(
                  builder: (context, userDataModel, _) => Column(
                    children: [
                      if (userDataModel.showPasswordRequirements)
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 170,
                            width: 350,
                            child: Column(
                              children: [
                                const Text('password should contain :'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'one letter at least',
                                        style: TextStyle(
                                          color:
                                          userDataModel.validationStatus[0] == false
                                              ? Colors.red
                                              : Colors.green,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Image.asset(
                                        userDataModel.validationStatus[0] == false
                                            ? 'images/close.png'
                                            : 'images/check.png',
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'one Capital letter at least',
                                        style: TextStyle(
                                            color: userDataModel
                                                .validationStatus[1]
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                      Expanded(child: Container()),
                                      Image.asset(
                                        userDataModel.validationStatus[1]
                                            ? 'images/check.png'
                                            : 'images/close.png',
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'one number at least',
                                        style: TextStyle(
                                            color: userDataModel
                                                .validationStatus[2]
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                      Expanded(child: Container()),
                                      Image.asset(
                                        userDataModel.validationStatus[2]
                                            ? 'images/check.png'
                                            : 'images/close.png',
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'at least 8 letters',
                                        style: TextStyle(
                                            color: userDataModel
                                                .validationStatus[3]
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                      Expanded(child: Container()),
                                      Image.asset(
                                        userDataModel.validationStatus[3]
                                            ? 'images/check.png'
                                            : 'images/close.png',
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 5, right: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        'at least one special character',
                                        style: TextStyle(
                                            color: userDataModel
                                                .validationStatus[4]
                                                ? Colors.green
                                                : Colors.red),
                                      ),
                                      Expanded(child: Container()),
                                      Image.asset(
                                        userDataModel.validationStatus[3]
                                            ? 'images/check.png'
                                            : 'images/close.png',
                                        height: 10,
                                        width: 10,
                                        fit: BoxFit.fill,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      FormComponent(
                        prefixIcon: const Icon(Icons.password),
                        controller: userDataModel.passwordController,
                        hintText: 'Password',
                        obscureText: userDataModel.isObscure,
                        suffixIcon: IconButton(onPressed: (){
                          userDataModel.visibilityPass();
                        },
                            icon: Icon( userDataModel.isObscure ? Icons.visibility_off : Icons.visibility,
                            )
                        ),
                        onTap: () {
                          userDataModel.setShowPasswordRequirements(true);
                        },
                        onChanged: (password) {
                          userDataModel.validatePassword(password);
                      },
                        errorText: userDataModel.isPasswordValid
                            ? null
                            : "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long",
                      ),
                    ],
                  ),
                ),
                FormComponent(
                  textInputType: TextInputType.number,
                  prefixIcon: const Icon(Icons.password),
                  controller: userDataModel.rePasswordController,
                  hintText: 'Re-write Password',
                  obscureText: userDataModel.isObscure,
                  suffixIcon: IconButton(onPressed: (){
                    userDataModel.visibilityPass();
                  },
                      icon: Icon( userDataModel.isObscure ? Icons.visibility_off : Icons.visibility,
                      )
                  ),
                  errorText:
                      userDataModel.isValidRewritePass ? null : " Not Match",
                ),
                // FormComponent(
                //   controller: userDataModel.phoneNumberController,
                //   hintText: 'phone Number',
                //   textInputType: TextInputType.number,
                //   errorText: userDataModel.isValidPhoneNumber
                //       ? 'Please enter your phone number'
                //       : null,
                // ),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber phoneNumber) {
                    final isValid = phoneNumber.phoneNumber!.length >= 12;
                    userDataModel.updatePhoneNumberValidity(isValid);
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DIALOG,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  // Enable auto-validation
                  selectorTextStyle: TextStyle(color: Colors.black),
                  textStyle: TextStyle(color: Colors.black),
                  initialValue:
                      PhoneNumber(isoCode: userDataModel.selectedCountry),
                  textFieldController: TextEditingController(),
                  inputBorder: OutlineInputBorder(),
                  hintText: 'Enter phone number',
                  errorMessage: userDataModel.isValidPhoneNumber
                      ? null
                      : 'Phone number must have at least 8 digits',
                ),
                FormComponent(
                  controller: userDataModel.countryController,
                  hintText: 'country',
                  errorText: userDataModel.countryController.text.isEmpty
                      ? 'Please enter your country'
                      : null,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Why Create account ? '),
                CheckBoxComponent(
                  text: 'Follow my personal data.',
                  value: userDataModel.isCheckedOption1,
                  onChanged: (bool? value) {
                    if (value != null) {
                      userDataModel.updateChecked(1, value);
                    }
                  },
                ),
                CheckBoxComponent(
                  text: 'Follow up with my nutrition counselor.',
                  value: userDataModel.isCheckedOption2,
                  onChanged: (bool? value) {
                    if (value != null) {
                      userDataModel.updateChecked(2, value);
                    }
                  },
                ),
                CheckBoxComponent(
                  text: 'Find a nutrition counselor in my area',
                  value: userDataModel.isCheckedOption3,
                  onChanged: (bool? value) {
                    if (value != null) {
                      userDataModel.updateChecked(3, value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: ButtonComponent(
          customColor: const Color(0xffBE543D),
          width: 150,
          text: 'Next',
          onPress: () async {
            CollectionReference collRef =
            FirebaseFirestore.instance.collection('User');
            await collRef.doc(userDataModel.nameController.text).set({
              'name': userDataModel.nameController.text,
              'email': userDataModel.emailController.text,
              'number': userDataModel.phoneNumberController.text,
              'country': userDataModel.countryController.text,
              'option1': userDataModel.isCheckedOption1,
              'option2': userDataModel.isCheckedOption2,
              'option3': userDataModel.isCheckedOption3,
            });

            try {
              UserCredential userCredential =
              await auth.createUserWithEmailAndPassword(
                  email: userDataModel.emailController.text,
                  password: userDataModel.passwordController.text);
              User? user = userCredential.user;
              print('New user created: ${user?.uid}');

              if (userDataModel.isFormValid) {
                if (userDataModel.isCheckedOption1 ||
                    userDataModel.isCheckedOption3) {
                  Beamer.of(context).beamToNamed('/option13');
                } else if (userDataModel.isCheckedOption2) {
                  Beamer.of(context).beamToNamed('/option2');
                } else {
                  // Handle other cases
                }
              }
            } catch (e) {
              print('Error creating user: $e');
            }
          },
        ),
      ),
    );
  }
}

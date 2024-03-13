import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/checkBox_component.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user_data_screen/user_data_view_model.dart';
import '../component/button_component.dart';
import '../component/form_component.dart';
import '../component/popup_component.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final UserDataViewModel userDataModel =
        Provider.of<UserDataViewModel>(context);
    final auth = FirebaseAuth.instance;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DesignComponent(
                text: 'Create your VirtAm id',
                smallText:
                    'You will get 90 days free trial on creating new account.\n Make sure you use correct information',
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    FormComponent(
                      controller: userDataModel.nameController,
                      hintText: 'Full Name',
                      errorText: userDataModel.isNameValid
                          ? null
                          : 'Please enter your Full Name ',
                    ),
                    FormComponent(
                      onChanged: (val) {
                      },
                      controller: userDataModel.emailController,
                      hintText: 'Email Address',
                      textInputType: TextInputType.emailAddress,
                      errorText: userDataModel.isEmailValid
                          ? null
                          : 'Please enter a valid email ',
                    ),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber phoneNumber) {
                        final isValid = phoneNumber.phoneNumber!.length >= 12;
                        userDataModel.updatePhoneNumberValidity(isValid);
                        if (phoneNumber != null) {
                          userDataModel.updatePhoneNumber(phoneNumber.phoneNumber!);

                          userDataModel.updateCountry(phoneNumber.isoCode!);
                        }
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      textStyle: TextStyle(color: Colors.black),
                      initialValue:
                          PhoneNumber(isoCode: userDataModel.selectedCountry),
                      textFieldController: TextEditingController(),
                      hintText: 'Phone Number',
                      errorMessage: userDataModel.isValidPhoneNumber
                          ? null
                          : 'Phone number must have at least 8 digits',
                    ),
                    SizedBox(height: screenSize.height * 0.01,),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 40,
                          color: Colors.grey.shade200,
                          child: Row(
                            children: [
                              Text(
                                userDataModel.selectedOption == 0 ? '  The purpose of creating the account    ' :
                               ' ${userDataModel.selectedPurpose}',
                                style:  Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(width: 15,),
                              IconButton(
                                onPressed: () {
                                  Beamer.of(context).beamToNamed('/popUp');
                                  // showModalBottomSheet(
                                  //   context: context,
                                  //   builder: (context) {
                                  //     return ListView(
                                  //       shrinkWrap: true,
                                  //       children: [
                                  //         ListTile(
                                  //           title: Text('Follow my personal data.'),
                                  //           onTap: () {
                                  //             userDataModel.updateSelectedOption(1);
                                  //             Navigator.pop(context); // Close the modal bottom sheet
                                  //           },
                                  //         ),
                                  //         ListTile(
                                  //           title: Text('Follow up with my nutrition counselor.'),
                                  //           onTap: () {
                                  //             userDataModel.updateSelectedOption(2);
                                  //             Navigator.pop(context); // Close the modal bottom sheet
                                  //           },
                                  //         ),
                                  //         ListTile(
                                  //           title: Text('Find a nutrition counselor in my area'),
                                  //           onTap: () {
                                  //             userDataModel.updateSelectedOption(3);
                                  //             Navigator.pop(context); // Close the modal bottom sheet
                                  //           },
                                  //         ),
                                  //       ],
                                  //     );
                                  //   },
                                  //);
                                },
                                icon: Icon(Icons.expand_more),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                              color: userDataModel
                                                              .validationStatus[
                                                          0] ==
                                                      false
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          Image.asset(
                                            userDataModel.validationStatus[0] ==
                                                    false
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
                            //prefixIcon: const Icon(Icons.password),
                            controller: userDataModel.passwordController,
                            hintText: 'Password',
                            obscureText: userDataModel.isObscure,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  userDataModel.visibilityPass();
                                },
                                icon: Icon(
                                  userDataModel.isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                )),
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
                      //prefixIcon: const Icon(Icons.password),
                      controller: userDataModel.rePasswordController,
                      hintText: 'Re-write Password',
                      obscureText: userDataModel.isObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            userDataModel.visibilityPass();
                          },
                          icon: Icon(
                            userDataModel.isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          )),
                      errorText: userDataModel.isValidRewritePass
                          ? null
                          : " Not Match",
                    ),
                    // FormComponent(
                    //   controller: userDataModel.countryController,
                    //   hintText: 'country',
                    //   errorText: userDataModel.countryController.text.isEmpty
                    //       ? 'Please enter your country'
                    //       : null,
                    // ),
                    CheckBoxComponent(
                      text: 'I agree to the Terms and Privacy Policy',
                      value: userDataModel.isTermsChecked,
                      onChanged: (value) {
                        userDataModel.updateTermsChecked(value!);
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Consumer<UserDataViewModel>(
                      builder: (context, userDataModel, _) => ButtonComponent(
                        text: 'Create Account',
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        customColor: userDataModel.isTermsChecked ? Colors.black : Colors.grey,
                        onPress: userDataModel.isTermsChecked
                            ? () async {
                                CollectionReference collRef = FirebaseFirestore
                                    .instance
                                    .collection('User');
                                await collRef
                                    .doc(userDataModel.nameController.text)
                                    .set({
                                  'name': userDataModel.nameController.text,
                                  'email': userDataModel.emailController.text,
                                  'number':
                                      userDataModel.phoneNumberController.text,
                                  'country':
                                      userDataModel.countryController.text,
                                  'selectedOption': userDataModel.selectedPurpose,
                                });

                                try {
                                  UserCredential userCredential =
                                      await auth.createUserWithEmailAndPassword(
                                          email: userDataModel
                                              .emailController.text,
                                          password: userDataModel
                                              .passwordController.text);
                                  User? user = userCredential.user;
                                  print('New user created: ${user?.uid}');

                                  if (userDataModel.isFormValid) {
                                    if (userDataModel.isCheckedOption1 ||
                                        userDataModel.isCheckedOption3) {
                                      Beamer.of(context)
                                          .beamToNamed('/option13');
                                    } else if (userDataModel.isCheckedOption2) {
                                      Beamer.of(context)
                                          .beamToNamed('/option2');
                                    } else {
                                      // Handle other cases
                                    }
                                  }
                                } catch (e) {
                                  print('Error creating user: $e');
                                }
                              }
                            : null,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    TextComponent(text: 'By agreeing to the above terms, you are consenting that\n your personal information will be collected, stored, and\n processed ')
                    // ButtonComponent(
                    //   customColor: Colors.black,
                    //   text: 'Next',
                    //   textStyle: Theme.of(context).textTheme.titleSmall,
                    //   onPress: () async {
                    //     CollectionReference collRef =
                    //     FirebaseFirestore.instance.collection('User');
                    //     await collRef.doc(userDataModel.nameController.text).set({
                    //       'name': userDataModel.nameController.text,
                    //       'email': userDataModel.emailController.text,
                    //       'number': userDataModel.phoneNumberController.text,
                    //       'country': userDataModel.countryController.text,
                    //       'option1': userDataModel.isCheckedOption1,
                    //       'option2': userDataModel.isCheckedOption2,
                    //       'option3': userDataModel.isCheckedOption3,
                    //     });
                    //
                    //     try {
                    //       UserCredential userCredential =
                    //       await auth.createUserWithEmailAndPassword(
                    //           email: userDataModel.emailController.text,
                    //           password: userDataModel.passwordController.text);
                    //       User? user = userCredential.user;
                    //       print('New user created: ${user?.uid}');
                    //
                    //       if (userDataModel.isFormValid) {
                    //         if (userDataModel.isCheckedOption1 ||
                    //             userDataModel.isCheckedOption3) {
                    //           Beamer.of(context).beamToNamed('/option13');
                    //         } else if (userDataModel.isCheckedOption2) {
                    //           Beamer.of(context).beamToNamed('/option2');
                    //         } else {
                    //           // Handle other cases
                    //         }
                    //       }
                    //     } catch (e) {
                    //       print('Error creating user: $e');
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

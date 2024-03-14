import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/checkBox_component.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/register_screen/register_screen_view_model.dart';
import 'package:virtam/user_data_screen/user_data_view_model.dart';
import '../component/button_component.dart';
import '../component/form_component.dart';
import '../component/popup_component.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final RegisterViewModel registerViewModel =
        Provider.of<RegisterViewModel>(context);
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
                      controller: registerViewModel.nameController,
                      hintText: 'Full Name',
                      errorText: registerViewModel.isNameValid
                          ? null
                          : 'Please enter your Full Name ',
                    ),
                    FormComponent(
                      onChanged: (val) {
                      },
                      controller: registerViewModel.emailController,
                      hintText: 'Email Address',
                      textInputType: TextInputType.emailAddress,
                      errorText: registerViewModel.isEmailValid
                          ? null
                          : 'Please enter a valid email ',
                    ),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber phoneNumber) {
                        final isValid = phoneNumber.phoneNumber!.length >= 12;
                        registerViewModel.updatePhoneNumberValidity(isValid);
                        if (phoneNumber != null) {
                          registerViewModel.updatePhoneNumber(phoneNumber.phoneNumber!);

                          registerViewModel.updateCountry(phoneNumber.isoCode!);
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
                          PhoneNumber(isoCode: registerViewModel.selectedCountry),
                      textFieldController: TextEditingController(),
                      hintText: 'Phone Number',
                      errorMessage: registerViewModel.isValidPhoneNumber
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
                                registerViewModel.selectedOption == 0 ? '  The purpose of creating the account    ' :
                               ' ${registerViewModel.selectedPurpose}',
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


                    Consumer<RegisterViewModel>(
                      builder: (context, registerViewModel, _) => Column(
                        children: [
                          if (registerViewModel.showPasswordRequirements)
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
                                              color: registerViewModel
                                                              .validationStatus[
                                                          0] ==
                                                      false
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          Image.asset(
                                            registerViewModel.validationStatus[0] ==
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
                                                color: registerViewModel
                                                        .validationStatus[1]
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                          Expanded(child: Container()),
                                          Image.asset(
                                            registerViewModel.validationStatus[1]
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
                                                color: registerViewModel
                                                        .validationStatus[2]
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                          Expanded(child: Container()),
                                          Image.asset(
                                            registerViewModel.validationStatus[2]
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
                                                color: registerViewModel
                                                        .validationStatus[3]
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                          Expanded(child: Container()),
                                          Image.asset(
                                            registerViewModel.validationStatus[3]
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
                                                color: registerViewModel
                                                        .validationStatus[4]
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                          Expanded(child: Container()),
                                          Image.asset(
                                            registerViewModel.validationStatus[3]
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
                            controller: registerViewModel.passwordController,
                            hintText: 'Password',
                            obscureText: registerViewModel.isObscure,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  registerViewModel.visibilityPass();
                                },
                                icon: Icon(
                                  registerViewModel.isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                )),
                            onTap: () {
                              registerViewModel.setShowPasswordRequirements(true);
                            },
                            onChanged: (password) {
                              registerViewModel.validatePassword(password);
                            },
                            errorText: registerViewModel.isPasswordValid
                                ? null
                                : "Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long",
                          ),
                        ],
                      ),
                    ),
                    FormComponent(
                      textInputType: TextInputType.number,
                      //prefixIcon: const Icon(Icons.password),
                      controller: registerViewModel.rePasswordController,
                      hintText: 'Re-write Password',
                      obscureText: registerViewModel.isObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            registerViewModel.visibilityPass();
                          },
                          icon: Icon(
                            registerViewModel.isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          )),
                      errorText: registerViewModel.isValidRewritePass
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
                      value: registerViewModel.isTermsChecked,
                      onChanged: (value) {
                        registerViewModel.updateTermsChecked(value!);
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Consumer<RegisterViewModel>(
                      builder: (context, registerViewModel, _) => ButtonComponentContinue(
                        text: 'Create Account',
                        customColor: registerViewModel.isTermsChecked ? Colors.black : Colors.grey,
                        onPress: registerViewModel.isTermsChecked
                            ? () async {
                                CollectionReference collRef = FirebaseFirestore
                                    .instance
                                    .collection('User');
                                await collRef
                                    .doc(registerViewModel.nameController.text)
                                    .set({
                                  'name': registerViewModel.nameController.text,
                                  'email': registerViewModel.emailController.text,
                                  'number':
                                  registerViewModel.phoneNumberController.text,
                                  'country':
                                  registerViewModel.countryController.text,
                                  'selectedPurpose': registerViewModel.selectedPurpose,
                                });

                                try {
                                  UserCredential userCredential =
                                      await auth.createUserWithEmailAndPassword(
                                          email: registerViewModel
                                              .emailController.text,
                                          password: registerViewModel
                                              .passwordController.text);
                                  User? user = userCredential.user;
                                  print('New user created: ${user?.uid}');

                                  if (registerViewModel.isFormValid) {
                                    if (registerViewModel.selectedOption == 1 ||
                                        registerViewModel.selectedOption == 3 ) {
                                      Beamer.of(context)
                                          .beamToNamed('/userDataStep1');
                                    } else if (registerViewModel.isCheckedOption2) {
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

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

    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/welcomeScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const DesignComponent(
                  text: 'Create your VirtAm id',
                  smallText:
                      'You will get 90 days free trial on creating new account.\n Make sure you use correct information',
                  textStyle: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
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
                      SizedBox(height: screenSize.height * 0.02,),
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
                      SizedBox(height: screenSize.height * 0.02,),
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
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        textStyle: const TextStyle(color: Colors.black),
                        initialValue:
                            PhoneNumber(isoCode: registerViewModel.selectedCountry),
                        textFieldController: TextEditingController(),
                        hintText: 'Phone Number',
                        errorMessage: registerViewModel.isValidPhoneNumber
                            ? null
                            : 'Phone number must have at least 8 digits',
                      ),
                      SizedBox(height: screenSize.height * 0.02,),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            color: Colors.grey.shade200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  registerViewModel.selectedOption == 0 ? '  The purpose of creating the account    ' :
                                 ' ${registerViewModel.selectedPurpose}',
                                  style:  const TextStyle(color: Colors.black,fontSize: 14,),
                                ),
                                const SizedBox(width: 15,),
                                IconButton(
                                  onPressed: () {
                                    Beamer.of(context).beamToNamed('/purposeScreen');
                                  },
                                  icon: const Icon(Icons.expand_more),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screenSize.height * 0.02,),

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
                                  width: 205,
                                  child: Column(
                                    children: [
                                      const Text('password should contain :',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5, right: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'one letter at least',
                                              style: TextStyle(
                                                fontSize: 12,
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
                                                  fontSize: 12,
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
                                                  fontSize: 12,
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
                                                  fontSize: 12,
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
                                                  fontSize: 12,
                                                  color: registerViewModel
                                                          .validationStatus[4]
                                                      ? Colors.green
                                                      : Colors.red),
                                            ),
                                            Expanded(child: Container()),
                                            Image.asset(
                                              registerViewModel.validationStatus[4]
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
                      SizedBox(height: screenSize.height * 0.02),
                      FormComponent(
                        textInputType: TextInputType.text,
                        //prefixIcon: const Icon(Icons.password),
                        controller: registerViewModel.rePasswordController,
                        hintText: 'Re-write Password',
                        obscureText: registerViewModel.isObscureRewrite,
                        suffixIcon: IconButton(
                            onPressed: () {
                              registerViewModel.visibilityRewritePass();
                            },
                            icon: Icon(
                              registerViewModel.isObscureRewrite
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            )),
                        errorText: registerViewModel.isValidRewritePass
                            ? null
                            : " Not Match",
                      ),
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
                            registerViewModel.validateFields();

                            if (registerViewModel.isFormValid) {
                              CollectionReference collRef = FirebaseFirestore
                                  .instance
                                  .collection('User');
                              await collRef
                                  .doc(registerViewModel.emailController.text)
                                  .set({
                                'name': registerViewModel.nameController.text,
                                'email': registerViewModel.emailController.text,
                                'password' : registerViewModel.passwordController.text,
                                'number': registerViewModel.phoneNumber,
                                'selectedPurpose': registerViewModel.selectedPurpose,
                              });

                              try {
                                UserCredential userCredential =
                                await auth.createUserWithEmailAndPassword(
                                    email: registerViewModel.emailController.text,
                                    password: registerViewModel.passwordController.text);
                                User? user = userCredential.user;
                                print('New user created: ${user?.uid}');

                                if (registerViewModel.selectedOption == 1 ||
                                    registerViewModel.selectedOption == 3) {
                                  Beamer.of(context).beamToNamed(
                                      '/userDataStep1');
                                } else if (registerViewModel.selectedOption ==
                                    2) {
                                  Beamer.of(context).beamToNamed('/option2');
                                } else {
                                }
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'email-already-in-use') {
                                  showDialog(
                                    context: context,
                                    builder: (context) => PopupWidget(
                                      titleText: 'Email Already Exists',
                                      contentText:
                                      'The email address you provided is already registered. Please use a different email address.',
                                      body: [],
                                    ),
                                  );
                                } else {
                                  print('Firebase Auth Error: $e');
                                }
                              } catch (e) {
                                print('Error creating user: $e');
                              }
                            }
                          }
                              : null,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      TextComponent(
                          text: 'By agreeing to the above terms, you are consenting that your personal information will be collected, stored, and processed ',
                        textStyle: Theme.of(context).textTheme.displaySmall,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


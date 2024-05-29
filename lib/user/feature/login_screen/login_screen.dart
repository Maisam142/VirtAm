import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/navigation_bar_screen/navigation_bar_screen.dart';

import '../../../component/back_component.dart';
import '../../../component/popup_component.dart';
import '../../../generated/l10n.dart';

import '../forget_screen/forget_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../register_screen/register_screen_view_model.dart';
import 'login_screen_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/welcomeScreen');
        return false;
      },
      child: ChangeNotifierProvider(
        create: (_) => LoginViewModel(),
        child: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final viewModel = Provider.of<RegisterViewModel>(context);
    final auth = FirebaseAuth.instance;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DesignComponent(
                text: S.of(context).signWith,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    FormComponent(
                      hintText: S.of(context).email,
                      controller: viewModel.emailController,
                      errorText: viewModel.isEmailValid
                          ? null
                          : S.of(context).enterValidEmail,
                    ),
                    FormComponent(
                      hintText: S.of(context).password,
                      controller: viewModel.passwordController,
                      obscureText: viewModel.isObscure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.visibilityPass();
                        },
                        icon: Icon(
                          viewModel.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      errorText: viewModel.isPasswordValid
                          ? null
                          : S.of(context).enterValidPass,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () async {
                          Beamer.of(context).beamToNamed('/forgetScreen');
                        },
                        child: Text(
                          S.of(context).forgetPass,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    Column(
                      children: [
                        ButtonComponentContinue(
                          text: S.of(context).signIn,
                          onPress: () async {
                            viewModel.validateFieldsLogin();

                            if (viewModel.isFormValidLogin) {
                              try {
                                final userCredential = await auth.signInWithEmailAndPassword(
                                  email: viewModel.emailController.text,
                                  password: viewModel.passwordController.text,
                                );

                                DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('User').doc(viewModel.emailController.text).get();
                                DocumentSnapshot adminDoc = await FirebaseFirestore.instance.collection('admin').doc(viewModel.emailController.text).get();
                                DocumentSnapshot masterAdminDoc = await FirebaseFirestore.instance.collection('masterAdmin').doc(viewModel.emailController.text).get();

                                if (adminDoc.exists) {
                                  final prefs = await SharedPreferences.getInstance();
                                  prefs.setBool('isLoggedIn', true);
                                  prefs.setString('email', viewModel.emailController.text);
                                  Beamer.of(context).beamToNamed('/homeAdminScreen');
                                } else if (userDoc.exists) {
                                  final prefs = await SharedPreferences.getInstance();
                                  prefs.setBool('isLoggedIn', true);
                                  prefs.setString('email', viewModel.emailController.text);
                                  Beamer.of(context).beamToNamed('/homeNavigationBar');
                                } else if (masterAdminDoc.exists) {
                                  final prefs = await SharedPreferences.getInstance();
                                  prefs.setBool('isLoggedIn', true);
                                  prefs.setString('email', viewModel.emailController.text);
                                  Beamer.of(context).beamToNamed('/homeMasterAdminScreen');
                                } else {
                                  // User not found in any collection
                                  showDialog(
                                    context: context,
                                    builder: (context) => PopupWidget(
                                      titleText: S.of(context).wrongEmailPass,
                                      contentText: S.of(context).rewriteCorrect,
                                      body: [],
                                    ),
                                  );
                                }
                              } catch (e) {
                                print('Error logging in: $e');
                                // Handle login error
                                showDialog(
                                  context: context,
                                  builder: (context) => PopupWidget(
                                    titleText: 'Login Error',
                                    contentText: 'An error occurred during login. Please try again later.',
                                    body: [],
                                  ),
                                );
                              }
                            }
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        TextComponent(
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          text: S.of(context).signedAlready,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        TextComponent(
                          text: S.of(context).or,
                          textStyle: Theme.of(context).textTheme.titleMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0, left: 25.0),
                          child: ButtonComponent(
                            text: S.of(context).createAccount,
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            customColor: Colors.white60,
                            onPress: () {
                              Beamer.of(context).beamToNamed('/registerScreen');
                            },
                          ),
                        ),
                      ],
                    ),
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

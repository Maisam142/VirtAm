import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../component/popup_component.dart';
import '../../generated/l10n.dart';
import '../register_screen/register_screen_view_model.dart';
import 'login_screen_view_model.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
  const LoginForm({super.key});

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
              DesignComponent(text: S.of(context).signWith,
              textStyle: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
              //SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    FormComponent(
                      // prefixIcon: const Icon(Icons.person, size: 20),
                      hintText: S.of(context).email,
                      controller: viewModel.emailController,
                      errorText: viewModel.isEmailValid
                          ? null
                          : S.of(context).enterValidEmail,
                    ),

                    FormComponent(
                      // prefixIcon: const Icon(Icons.password, size: 20),
                      hintText: S.of(context).password,
                      controller: viewModel.passwordController,
                      obscureText: viewModel.isObscure,
                      suffixIcon: IconButton(onPressed: (){
                        viewModel.visibilityPass();
                      },
                          icon: Icon( viewModel.isObscure ? Icons.visibility_off : Icons.visibility,
                          )
                      ),
                      errorText: viewModel.isPasswordValid
                          ? null
                          : S.of(context).enterValidPass,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
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
                                final user = userCredential.user;
                                //print('User signed in: ${user?.uid}');

                                Beamer.of(context).beamToNamed('/homeNavigationBar');
                              } catch (e) {
                                print('Error logging in: $e');
                                showDialog(
                                  context: context,
                                  builder: (context) => PopupWidget(
                                    titleText: S.of(context).wrongEmailPass,
                                    contentText: S.of(context).rewriteCorrect,
                                        body: [],
                                  ),
                                );                              }
                            }
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        TextComponent(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          text: S.of(context).signedAlready,),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        TextComponent(text: S.of(context).or, textStyle: Theme.of(context).textTheme.titleMedium,),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0,left: 25.0),
                          child: ButtonComponent(
                            text: S.of(context).createAccount,
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            customColor: Colors.white60,
                            onPress: (){
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

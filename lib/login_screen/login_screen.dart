import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/login_screen/login_screen_view_model.dart';

import '../component/logo_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final viewModel = Provider.of<LoginViewModel>(context);
    final auth = FirebaseAuth.instance;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DesignComponent(text: 'Sign in with your VirtAm ID',),
              //SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    FormComponent(
                      // prefixIcon: const Icon(Icons.person, size: 20),
                      hintText: 'Email ',
                      controller: viewModel.emailController,
                      errorText: viewModel.isEmailValid
                          ? null
                          : 'Please enter a valid email ',
                    ),

                    FormComponent(
                      // prefixIcon: const Icon(Icons.password, size: 20),
                      hintText: 'Password',
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
                          : "Wrong Password",
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot the password?',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    Column(
                      children: [
                        ButtonComponent(
                          text: 'Sign In',
                          customColor: Colors.black,
                          onPress: () async {
                            viewModel.validateFields();
                            if (viewModel.isFormValid) {
                              try {
                                final userCredential = await auth.signInWithEmailAndPassword(
                                  email: viewModel.emailController.text,
                                  password: viewModel.passwordController.text,
                                );
                                final user = userCredential.user;
                                print('User signed in: ${user?.uid}');

                                Beamer.of(context).beamToNamed('/homeScreen');
                              } catch (e) {
                                print('Error logging in: $e');
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed')));
                              }
                            }
                          },
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        TextComponent(text: 'Your VirtAm account is now VirtAm ID. If you’ve signed\n into the app before, use the same credentials here.\n otherwise',),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        TextComponent(text: 'OR', textStyle: Theme.of(context).textTheme.titleMedium,),
                        Padding(
                          padding: const EdgeInsets.only(right: 25.0,left: 25.0),
                          child: ButtonComponent(
                            text: 'Create Account',
                            textStyle: Theme.of(context).textTheme.titleMedium,
                            customColor: Colors.white60,
                            onPress: (){},
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

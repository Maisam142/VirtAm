import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';

import '../component/design_component.dart';
import '../component/form_component.dart';
import '../user_data_screen/user_data_view_model.dart';

class ForgetPassword extends StatelessWidget {

  const ForgetPassword({super.key});

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
                text: 'New Password',
                smallText:
                'You can reset your password now. Make sure you\n remember it now or you can reset again & again',
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
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
                    Column(
                      children: [
                        FormComponent(
                          textInputType: TextInputType.number,
                          //prefixIcon: const Icon(Icons.password),
                          controller: userDataModel.rePasswordController,
                          hintText: 'Confirm Password',
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
                      ],
                    ), 
                    SizedBox(height: screenSize.height * 0.03,),
                    ButtonComponent(
                        text: 'Sign In',
                      textStyle: Theme.of(context).textTheme.titleSmall,
                    customColor: Colors.black,),
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

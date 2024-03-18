import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/register_screen/register_screen_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step4_screen/user_data_step4_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step5_screen/user_data_step5_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step6_screen/user_data_step6_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step7_screen/user_data_step7_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step8_screen/user_data_step8_view_model.dart';

import '../../component/button_component.dart';
import '../../component/form_component.dart';
import '../../component/option_top_component.dart';

class UserDataScreenStep8 extends StatelessWidget {
  const UserDataScreenStep8({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final UserDataStep8ViewModel userDataModel =
    Provider.of<UserDataStep8ViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/userDataStep7');
        return false;
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Theme.of(context).focusColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              OptionTopComponent(
                text: 'Step 8/10',
                onPressed: () {
                  Beamer.of(context).beamBack();
                },
              ),
              SizedBox(
                width: double.infinity,
                height: screenSize.height * 0.56,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextComponent(text: 'Are you an employee/worker?',
                                textStyle: Theme.of(context).textTheme.labelMedium,),),
                          ),

                          Container(
                            width: double.infinity,
                            height: screenSize.height * 0.4 ,
                            child: Image(image: AssetImage('images/worker.png') ,),
                          ),
                          RadioListTile(
                            title:const Align(
                                alignment: Alignment.centerLeft,
                                child: TextComponent(text:'Yes')),
                            value: 1,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption1(value);
                                userDataModel.updateSelectedPurpose1('yes');

                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption1,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: screenSize.height * 0.01,),
                    // Container(
                    //   color: Colors.white,
                    //   height: screenSize.height * 0.07,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(bottom: 10.0),
                    //     child: RadioListTile(
                    //       title: const Align(
                    //           alignment: Alignment.centerLeft,
                    //           child: TextComponent(text:'No')),
                    //       value: 2,
                    //       onChanged: (int? value) {
                    //         if (value != null) {
                    //           userDataModel.updateSelectedOption1(value);
                    //           userDataModel.updateSelectedPurpose1('No');
                    //
                    //         }
                    //       },
                    //       activeColor: Theme.of(context).primaryColor,
                    //       groupValue: userDataModel.selectedOption1,
                    //       controlAffinity: ListTileControlAffinity.trailing,
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: screenSize.height * 0.22,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: TextComponent(text: 'Nature of work?',
                                textStyle: Theme.of(context).textTheme.labelMedium,),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0,right: 9.0),
                            child: Column(
                              children: [
                                FormComponent(
                                  hintText: 'Office',
                                  controller: userDataModel.officeController,
                                ),
                                SizedBox(height: screenSize.height * 0.003,),
                                FormComponent(
                                  hintText: 'Field',
                                  controller: userDataModel.fieldController,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    // Container(
                    //   color: Colors.white,
                    //   height: screenSize.height * 0.07,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(bottom: 10.0),
                    //     child: RadioListTile(
                    //       title: const Align(
                    //           alignment: Alignment.centerLeft,
                    //           child: TextComponent(text:'No')),
                    //       value: 2,
                    //       onChanged: (int? value) {
                    //         if (value != null) {
                    //           userDataModel.updateSelectedOption1(value);
                    //           userDataModel.updateSelectedPurpose1('No');
                    //
                    //         }
                    //       },
                    //       activeColor: Theme.of(context).primaryColor,
                    //       groupValue: userDataModel.selectedOption1,
                    //       controlAffinity: ListTileControlAffinity.trailing,
                    //     ),
                    //   ),
                    // ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ButtonComponentContinue(
                    text: 'Continue',
                    onPress: () async {
                      Map<String, dynamic> additionalData = {
                        'Office': userDataModel.officeController.text,
                        'Field': userDataModel.fieldController.text,
                      };
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(registerViewModel.emailController.text)
                          .update(additionalData);
                      Beamer.of(context).beamToNamed('/userDataStep9');
                    }),
              ),

            ],
          ),
        ),
      )),
    );
  }
}

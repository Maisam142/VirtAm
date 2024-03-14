import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/register_screen/register_screen_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step3_screen/user_data_step3_view_model.dart';

import '../../component/button_component.dart';
import '../../component/option_top_component.dart';

class UserDataScreenStep3 extends StatelessWidget {
  const UserDataScreenStep3({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final UserDataStep3ViewModel userDataModel =
    Provider.of<UserDataStep3ViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OptionTopComponent(
              text: 'Step 3/10',
            ),
            Container(
              width: double.infinity,
              height: screenSize.height * 0.8,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: screenSize.height * 0.16,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: TextComponent(text: 'When was the last time you had\n'
                                ' your thyroid checked?',
                              textStyle: Theme.of(context).textTheme.bodyMedium,),),
                        ),
                        RadioListTile(
                          title:Align(
                              alignment: Alignment.centerLeft,
                              child: TextComponent(text:'Less than 90 days')),
                          value: 1,
                          onChanged: (int? value) {
                            if (value != null) {
                              userDataModel.updateSelectedOption(value);
                              userDataModel.updateSelectedPurpose('Less than 90 days');

                            }
                          },
                          activeColor: Theme.of(context).primaryColor,
                          groupValue: userDataModel.selectedOption,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01,),
                  Container(
                    color: Colors.white,
                    height: screenSize.height * 0.07,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: RadioListTile(
                        title: Align(
                            alignment: Alignment.centerLeft,
                            child: TextComponent(text:'last 3 months')),
                        value: 2,
                        onChanged: (int? value) {
                          if (value != null) {
                            userDataModel.updateSelectedOption(value);
                            userDataModel.updateSelectedPurpose('last 3 months');

                          }
                        },
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: userDataModel.selectedOption,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01,),
                  Container(
                    color: Colors.white,
                    height: screenSize.height * 0.07,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: RadioListTile(
                        title:const Align(
                            alignment: Alignment.centerLeft,
                            child: TextComponent(text:'last 6 months')),
                        value: 3,
                        onChanged: (int? value) {
                          if (value != null) {
                            userDataModel.updateSelectedOption(value);
                            userDataModel.updateSelectedPurpose('last 6 months');

                          }
                        },
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: userDataModel.selectedOption,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.01,),
                  Container(
                    color: Colors.white,
                    height: screenSize.height * 0.08,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: RadioListTile(
                        title:const Align(
                            alignment: Alignment.centerLeft,
                            child: TextComponent(text:'more than 6 months')),
                        value: 4,
                        onChanged: (int? value) {
                          if (value != null) {
                            userDataModel.updateSelectedOption(value);
                            userDataModel.updateSelectedPurpose('more than 6 months');

                          }
                        },
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: userDataModel.selectedOption,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ButtonComponentContinue(
                  text: 'Next',
                  onPress: () async {
                    Map<String, dynamic> additionalData = {
                      'thyroid_checked': userDataModel.selectedPurpose,
                    };
                    await FirebaseFirestore.instance
                        .collection('User')
                        .doc(registerViewModel.nameController.text)
                        .update(additionalData);
                    Beamer.of(context).beamToNamed('/userDataStep3');
                  }),
            ),

          ],
        ),
      ),
    ));
  }
}

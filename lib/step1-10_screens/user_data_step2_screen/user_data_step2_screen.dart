import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/register_screen/register_screen_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step2_screen/user_data_step2_view_model.dart';

import '../../component/button_component.dart';
import '../../component/option_top_component.dart';

class UserDataScreenStep2 extends StatelessWidget {
  const UserDataScreenStep2({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final UserDataStep2ViewModel userDataModel =
    Provider.of<UserDataStep2ViewModel>(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OptionTopComponent(
              text: 'Step 2/10',
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: screenSize.height * 0.15,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: TextComponent(text: 'Is he allergic to:',
                                textStyle: Theme.of(context).textTheme.bodyMedium,),),
                          ),
                          RadioListTile(
                            title: Row(
                              children: [
                                const SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image(image: AssetImage('images/eggs.png'),),),
                                SizedBox(width: screenSize.width * 0.02,),
                                Text('Eggs'),
                              ],
                            ),
                            value: 1,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption(value);
                                userDataModel.updateSelectedPurpose('Eggs');
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
                      height: screenSize.height * 0.08,
                      child: RadioListTile(
                        title: Row(
                          children: [
                            const SizedBox(
                              width: 40,
                              height: 40,
                              child: Image(image: AssetImage('images/milk.png'),),),
                            SizedBox(width: screenSize.width * 0.02,),
                            const Text('Milk'),
                          ],
                        ),
                        value: 2,
                        onChanged: (int? value) {
                          if (value != null) {
                            userDataModel.updateSelectedOption(value);
                            userDataModel.updateSelectedPurpose('Milk');
                          }
                        },
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: userDataModel.selectedOption,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01,),
                    Container(
                      color: Colors.white,
                      height: screenSize.height * 0.08,
                      child: RadioListTile(
                        title: Row(
                          children: [
                            const SizedBox(
                              width: 40,
                              height: 40,
                              child: Image(image: AssetImage('images/fish.png'),),),
                            SizedBox(width: screenSize.width * 0.02,),
                            const Text('Fish'),
                          ],
                        ),
                        value: 3,
                        onChanged: (int? value) {
                          if (value != null) {
                            userDataModel.updateSelectedOption(value);
                            userDataModel.updateSelectedPurpose('Eggs');
                          }
                        },
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: userDataModel.selectedOption,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  ],
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ButtonComponentContinue(
                  text: 'Next',
                  onPress: () async {
                    Map<String, dynamic> additionalData = {
                      'Allergic': userDataModel.selectedPurpose,
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

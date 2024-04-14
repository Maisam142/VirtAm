import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step7_screen/user_data_step7_view_model.dart';

import '../../../../component/button_component.dart';
import '../../../../component/option_top_component.dart';
import '../../../../generated/l10n.dart';
import '../../register_screen/register_screen_view_model.dart';

class UserDataScreenStep7 extends StatelessWidget {
  const UserDataScreenStep7({Key? key});

  @override
  Widget build(BuildContext context) {
    final UserDataStep7ViewModel userDataModel =
    Provider.of<UserDataStep7ViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/userDataStep6');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).focusColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                OptionTopComponent(
                  text: S.of(context).step7,
                  onPressed: () {
                    Beamer.of(context).beamBack();
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500, // Fixed height value
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
                                child: TextComponent(
                                  text: S.of(context).employeeWorker,
                                  textStyle: Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 300, // Fixed height value
                              child: Image(image: AssetImage('images/worker.png')),
                            ),
                            RadioListTile(
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: TextComponent(text: S.of(context).yes),
                              ),
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
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        height: 70, // Fixed height value
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RadioListTile(
                            title: Align(
                              alignment: Alignment.centerLeft,
                              child: TextComponent(text: S.of(context).no),
                            ),
                            value: 2,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption1(value);
                                userDataModel.updateSelectedPurpose1('No');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption1,
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
                    text: S.of(context).next,
                    onPress: () async {
                      Map<String, dynamic> additionalData = {
                        'worker': userDataModel.selectedPurpose1,
                      };
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(registerViewModel.emailController.text)
                          .update(additionalData);
                      if (userDataModel.selectedOption1 == 1) {
                        Beamer.of(context).beamToNamed('/userDataStep8');
                      } else {
                        Beamer.of(context).beamToNamed('/userDataStep9');
                      }
                    },
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

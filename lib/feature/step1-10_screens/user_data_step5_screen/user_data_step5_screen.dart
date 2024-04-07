import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/feature/step1-10_screens/user_data_step5_screen/user_data_step5_view_model.dart';

import '../../../component/button_component.dart';
import '../../../component/option_top_component.dart';
import '../../../generated/l10n.dart';
import '../../register_screen/register_screen_view_model.dart';

class UserDataScreenStep5 extends StatelessWidget {
  const UserDataScreenStep5({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDataStep5ViewModel userDataModel =
    Provider.of<UserDataStep5ViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/userDataStep4');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).focusColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                OptionTopComponent(
                  text: S.of(context).step5,
                  onPressed: () {
                    Beamer.of(context).beamBack();
                  },
                ),
                SizedBox(
                  height: 380,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 120,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextComponent(
                                  text: S.of(context).vitaminDChecked,
                                  textStyle: Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            RadioListTile(
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: TextComponent(text: S.of(context).lessThan90Days),
                              ),
                              value: 1,
                              onChanged: (int? value) {
                                if (value != null) {
                                  userDataModel.updateSelectedOption1(value);
                                  userDataModel.updateSelectedPurpose1('Less than 90 days');
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
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RadioListTile(
                            title: Align(
                              alignment: Alignment.centerLeft,
                              child: TextComponent(text: S.of(context).last3Months),
                            ),
                            value: 2,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption1(value);
                                userDataModel.updateSelectedPurpose1('last 3 months');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption1,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RadioListTile(
                            title: Align(
                              alignment: Alignment.centerLeft,
                              child: TextComponent(text: S.of(context).last6Months),
                            ),
                            value: 3,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption1(value);
                                userDataModel.updateSelectedPurpose1('last 6 months');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption1,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RadioListTile(
                            title: Align(
                              alignment: Alignment.centerLeft,
                              child: TextComponent(text: S.of(context).more6Months),
                            ),
                            value: 4,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption1(value);
                                userDataModel.updateSelectedPurpose1('more than 6 months');
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
                SizedBox(height: 10),
                SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 120,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextComponent(
                                  text: S.of(context).vitaminDDeficiency,
                                  textStyle: Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            RadioListTile(
                              title: Align(
                                alignment: Alignment.centerLeft,
                                child: TextComponent(text: S.of(context).yes),
                              ),
                              value: 1,
                              onChanged: (int? value) {
                                if (value != null) {
                                  userDataModel.updateSelectedOption2(value);
                                  userDataModel.updateSelectedPurpose2('yes');
                                }
                              },
                              activeColor: Theme.of(context).primaryColor,
                              groupValue: userDataModel.selectedOption2,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        height: 70,
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
                                userDataModel.updateSelectedOption2(value);
                                userDataModel.updateSelectedPurpose2('No');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption2,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.white,
                        height: 70,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RadioListTile(
                            title: Align(
                              alignment: Alignment.centerLeft,
                              child: TextComponent(text: S.of(context).dontKnow),
                            ),
                            value: 3,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption2(value);
                                userDataModel.updateSelectedPurpose2('I Don\'t Know');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption2,
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
                        'Vitamin D Checked Time': userDataModel.selectedPurpose1,
                        'Vitamin D Deficiency': userDataModel.selectedPurpose2,
                      };
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(registerViewModel.emailController.text)
                          .update(additionalData);
                      Beamer.of(context).beamToNamed('/userDataStep6');
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

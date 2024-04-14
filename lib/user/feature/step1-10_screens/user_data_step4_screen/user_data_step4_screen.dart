import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step4_screen/user_data_step4_view_model.dart';


import '../../../../component/button_component.dart';
import '../../../../component/option_top_component.dart';
import '../../../../generated/l10n.dart';
import '../../register_screen/register_screen_view_model.dart';


class UserDataScreenStep4 extends StatelessWidget {
  const UserDataScreenStep4({super.key});

  @override
  Widget build(BuildContext context) {
    final UserDataStep4ViewModel userDataModel =
    Provider.of<UserDataStep4ViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/userDataStep3');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).focusColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                OptionTopComponent(
                  text: S.of(context).step4,
                  onPressed: () {
                    Beamer.of(context).beamBack();
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: 100,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextComponent(
                                  text: S.of(context).ironCheck,
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
                SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
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
                                  text: S.of(context).ironDeficiency,
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
                        'Iron Checked Time': userDataModel.selectedPurpose1,
                        'Iron Deficiency': userDataModel.selectedPurpose2,
                      };
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(registerViewModel.emailController.text)
                          .update(additionalData);
                      Beamer.of(context).beamToNamed('/userDataStep5');
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

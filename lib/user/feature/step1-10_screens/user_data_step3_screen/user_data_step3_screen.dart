import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step3_screen/user_data_step3_view_model.dart';

import '../../../../component/button_component.dart';
import '../../../../component/option_top_component.dart';
import '../../../../generated/l10n.dart';
import '../../register_screen/register_screen_view_model.dart';

class UserDataScreenStep3 extends StatelessWidget {
  const UserDataScreenStep3({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final UserDataStep3ViewModel userDataModel =
    Provider.of<UserDataStep3ViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/userDataStep2');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          //backgroundColor: Theme.of(context).focusColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                OptionTopComponent(
                  text: S.of(context).step3,
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
                        color: Theme.of(context).secondaryHeaderColor,
                        height: 130,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextComponent(
                                  text: S.of(context).thyroidCheckedTime,
                                  textStyle:
                                  Theme.of(context).textTheme.bodyMedium,
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
                      SizedBox(height: screenSize.height * 0.01,),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: screenSize.height * 0.07,
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
                      SizedBox(height: screenSize.height * 0.01,),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: screenSize.height * 0.07,
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
                      SizedBox(height: screenSize.height * 0.01,),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: screenSize.height * 0.08,
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
                SizedBox(
                  width: double.infinity,
                  height: 280,
                  child: Column(
                    children: [
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: 100,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextComponent(
                                  text: S.of(context).thyroidProblems,
                                  textStyle:
                                  Theme.of(context).textTheme.bodyMedium,
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
                      SizedBox(height: screenSize.height * 0.01,),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: screenSize.height * 0.07,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: RadioListTile(
                            title:  Align(
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
                      SizedBox(height: screenSize.height * 0.01,),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: screenSize.height * 0.07,
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
                        'Thyroid Checked Time': userDataModel.selectedPurpose1,
                        'Thyroid Problems': userDataModel.selectedPurpose2,
                      };
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(registerViewModel.emailController.text.toLowerCase())
                          .update(additionalData);
                      Beamer.of(context).beamToNamed('/userDataStep4');
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

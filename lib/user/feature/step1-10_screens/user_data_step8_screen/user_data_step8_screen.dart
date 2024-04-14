import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step8_screen/user_data_step8_view_model.dart';

import '../../../../component/button_component.dart';
import '../../../../component/form_component.dart';
import '../../../../component/option_top_component.dart';
import '../../../../generated/l10n.dart';
import '../../register_screen/register_screen_view_model.dart';

class UserDataScreenStep8 extends StatelessWidget {
  const UserDataScreenStep8({Key? key});

  @override
  Widget build(BuildContext context) {
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
                  text: S.of(context).step8,
                  onPressed: () {
                    Beamer.of(context).beamBack();
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: 500,
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
                              height: 400, // Fixed height value
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
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 220, // Fixed height value
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
                                child: TextComponent(
                                  text: S.of(context).work,
                                  textStyle: Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9.0, right: 9.0),
                              child: Column(
                                children: [
                                  FormComponent(
                                    hintText: S.of(context).office,
                                    controller: userDataModel.officeController,
                                  ),
                                  SizedBox(height: 3), // Fixed height value
                                  FormComponent(
                                    hintText: S.of(context).field,
                                    controller: userDataModel.fieldController,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
                        'Office': userDataModel.officeController.text,
                        'Field': userDataModel.fieldController.text,
                      };
                      await FirebaseFirestore.instance
                          .collection('User')
                          .doc(registerViewModel.emailController.text)
                          .update(additionalData);
                      Beamer.of(context).beamToNamed('/userDataStep9');
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

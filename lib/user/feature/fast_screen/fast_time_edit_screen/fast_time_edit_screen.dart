import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/step1-10_screens/user_data_step9_screen/user_data_step9_view_model.dart';
import '../../../../component/button_component.dart';
import '../../../../component/option_top_component.dart';
import '../../../../generated/l10n.dart';
import '../../register_screen/register_screen_view_model.dart';
import 'fast_time_edit_view_model.dart';


class FastTimeEditScreen extends StatelessWidget {
  const FastTimeEditScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    final FastTimeEditViewModel userDataModel =
    Provider.of<FastTimeEditViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return  WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/fastScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          //backgroundColor: Theme.of(context).focusColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                OptionTopComponent(
                  text: 'Fast Time',
                  onPressed: () {
                    Beamer.of(context).beamToNamed('/fastScreen');
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  height: screenSize.height * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: TextComponent(
                                    text: 'when did you start fasting ?',
                                    textStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(

                                  margin: EdgeInsets.only(
                                    bottom:
                                    MediaQuery.of(context).viewInsets.bottom ,
                                    top: MediaQuery.of(context).viewInsets.bottom ,
                                  ),
                                  color: Colors.white,
                                  child: Consumer<FastTimeEditViewModel>(
                                    builder: (context, provider, _) => CupertinoDatePicker(
                                      initialDateTime: provider.selectedStartFast,
                                      mode: CupertinoDatePickerMode.time,
                                      use24hFormat: false,
                                      onDateTimeChanged: (DateTime newTime) {
                                        provider.selectedStartFast = newTime;
                                      },
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: TextComponent(
                                    text: 'when did you end fasting ?',
                                    textStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(

                                  margin: EdgeInsets.only(
                                    bottom:
                                    MediaQuery.of(context).viewInsets.bottom ,
                                    top: MediaQuery.of(context).viewInsets.bottom ,
                                  ),
                                  color: Colors.white,
                                  child: Consumer<FastTimeEditViewModel>(
                                    builder: (context, provider, _) => CupertinoDatePicker(
                                      initialDateTime: provider.selectedEndFast,
                                      mode: CupertinoDatePickerMode.time,
                                      use24hFormat: false,
                                      onDateTimeChanged: (DateTime newTime) {
                                        provider.selectedEndFast = newTime;
                                      },
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ButtonComponentContinue(
                            text: S.of(context).next,
                            onPress: () async {
                              String period1 = userDataModel.selectedStartFast.hour < 12 ? 'AM' : 'PM';
                              String period2 = userDataModel.selectedEndFast.hour < 12 ? 'AM' : 'PM';

                              Map<String, dynamic> additionalData = {
                                'startFastTime': '${userDataModel.selectedStartFast.hour}:${userDataModel.selectedStartFast.minute} $period1',
                                'endFastTime': '${userDataModel.selectedEndFast.hour}:${userDataModel.selectedEndFast.minute} $period2',
                              };
                              await FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(registerViewModel.emailController.text.toLowerCase())
                                  .update(additionalData);
                              Beamer.of(context).beamToNamed('/fastScreen');
                            },
                          ),
                        ),
                      ),
                    ],
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

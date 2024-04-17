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


class UserDataScreenStep9 extends StatelessWidget {
  const UserDataScreenStep9({super.key});

  @override
  Widget build(BuildContext context) {

    final Size screenSize = MediaQuery.of(context).size;
    final UserDataStep9ViewModel userDataModel =
    Provider.of<UserDataStep9ViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return  WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/userDataStep8');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).focusColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                OptionTopComponent(
                  text: S.of(context).step9,
                  onPressed: () {
                    Beamer.of(context).beamBack();
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
                                    text: S.of(context).wakeUp,
                                    textStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Image(
                                  image: AssetImage('images/wakeup.png'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01 ,),
                      Expanded(
                        flex: 2,
                        child: Container(

                          margin: EdgeInsets.only(
                            bottom:
                            MediaQuery.of(context).viewInsets.bottom ,
                            top: MediaQuery.of(context).viewInsets.bottom ,
                          ),
                          color: Colors.white,
                          child: Consumer<UserDataStep9ViewModel>(
                            builder: (context, provider, _) => CupertinoDatePicker(
                              initialDateTime: provider.selectedDate,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: false,
                              onDateTimeChanged: (DateTime newTime) {
                                provider.selectedDate = newTime;
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ButtonComponentContinue(
                            text: S.of(context).next,
                            onPress: () async {
                              String period = userDataModel.selectedDate.hour < 12 ? 'AM' : 'PM';

                              Map<String, dynamic> additionalData = {
                                'wakeup time': '${userDataModel.selectedDate.hour}:${userDataModel.selectedDate.minute} $period',
                              };
                              await FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(registerViewModel.emailController.text.toLowerCase())
                                  .update(additionalData);
                              Beamer.of(context).beamToNamed('/userDataStep10');
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

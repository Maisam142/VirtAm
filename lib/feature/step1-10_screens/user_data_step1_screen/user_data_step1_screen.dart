import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/feature/step1-10_screens/user_data_step1_screen/user_data_step1_screen_view_model.dart';

import '../../../component/button_component.dart';
import '../../../component/option_top_component.dart';
import '../../../generated/l10n.dart';
import '../../register_screen/register_screen_view_model.dart';

class UserDataScreenStep1 extends StatelessWidget {
  final double minValue = 20;
  final double maxValue = 200;
  final double initialValue = 50;

  const UserDataScreenStep1({super.key});


  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    final UserDataStep1ViewModel userDataModel =
    Provider.of<UserDataStep1ViewModel>(context);
    return Consumer<UserDataStep1ViewModel>(
      builder: (context, model, child) {
        return WillPopScope(
          onWillPop: () async {
            Beamer.of(context).beamToNamed('/registerScreen');
            return false;
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).focusColor,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    OptionTopComponent(
                      text: S.of(context).step1,
                      onPressed: () {
                        Beamer.of(context).beamBack();
                      },
                    ),
                    Container(
                      height: 200, // Adjusted height
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 15.5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    TextComponent(
                                      text: S.of(context).whatIsYour,
                                      textStyle: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    TextLabelComponent(text: S.of(context).age),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' ${model.selectedValueAge}'),
                                TextComponent(
                                  text: S.of(context).years,
                                  textStyle: Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: (maxValue - minValue).toInt() + 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final double value = 1 + index.toDouble();
                                  return InkWell(
                                    onTap: () {
                                      model.setSelectedValueAge(value.toInt());
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 150.0,
                                      alignment: Alignment.center,
                                      child: Text(
                                        value.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: value == model.selectedValueAge
                                              ? Theme.of(context).primaryColor
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Adjusted height
                    Container(
                      height: 200, // Adjusted height
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 15.5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    TextComponent(
                                      text: S.of(context).whatIsYour,
                                      textStyle: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    TextLabelComponent(text: S.of(context).weight),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' ${model.selectedValueWeight}'),
                                TextComponent(
                                  text: S.of(context).kg,
                                  textStyle: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ((maxValue - minValue) * 10).toInt() + 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final double value = 30 + (index * 0.1);
                                  return InkWell(
                                    onTap: () {
                                      model.setSelectedValueWeight(value);
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 150.0,
                                      alignment: Alignment.center,
                                      child: Text(
                                        value.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: value == model.selectedValueWeight
                                              ? Theme.of(context).primaryColor
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Adjusted height
                    Container(
                      height: 200, // Adjusted height
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0, bottom: 25.0, left: 15.5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  children: [
                                    TextComponent(
                                      text: S.of(context).whatIsYour,
                                      textStyle: TextStyle(color: Colors.black),
                                    ),
                                    TextLabelComponent(text: S.of(context).height),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(' ${model.selectedValueHeight}'),
                                TextComponent(
                                  text: S.of(context).cm,
                                  textStyle: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: ((maxValue - minValue) * 10).toInt() + 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final double value = 140 + (index * 0.1);
                                  return InkWell(
                                    onTap: () {
                                      model.setSelectedValueHeight(value);
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 150.0,
                                      alignment: Alignment.center,
                                      child: Text(
                                        value.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: value == model.selectedValueHeight
                                              ? Theme.of(context).primaryColor
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ButtonComponentContinue(
                        text: S.of(context).next,
                        onPress: () async {
                          Map<String, dynamic> additionalData = {
                            'weight': userDataModel.selectedValueWeight,
                            'Age': userDataModel.selectedValueAge,
                            'Height': userDataModel.selectedValueHeight,
                          };
                          await FirebaseFirestore.instance
                              .collection('User')
                              .doc(registerViewModel.emailController.text)
                              .update(additionalData);
                          Beamer.of(context).beamToNamed('/userDataStep2');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}

import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/step1-10_screens/user_data_step1_screen/user_data_step1_screen_view_model.dart';

import '../../component/button_component.dart';
import '../../component/option_top_component.dart';
import '../../register_screen/register_screen_view_model.dart';


class UserDataScreenStep1 extends StatelessWidget {
  final double minValue = 20;
  final double maxValue = 200;
  final double initialValue = 50;

  const UserDataScreenStep1({super.key});


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    final UserDataStep1ViewModel userDataModel =
    Provider.of<UserDataStep1ViewModel>(context);
    return Consumer<UserDataStep1ViewModel>(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).focusColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  OptionTopComponent(
                    text: 'Step 1/10',
                    onPressed: () {
                      Beamer.of(context).beamBack();
                    },
                  ),
                  Container(
                    height: screenSize.height * 0.22,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:25.0,bottom: 25.0,left: 15.5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                TextComponent(text: 'What is your',
                                  textStyle: Theme.of(context).textTheme.bodyMedium,),
                                TextComponent(text: ' age?',
                                  textStyle: Theme.of(context).textTheme.displayLarge,),
                              ],
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' ${model.selectedValueAge}'),
                            TextComponent(text: '  Years', textStyle: Theme.of(context).textTheme.headlineSmall,)
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            (maxValue - minValue) ~/ 0.1 + 1,
                            itemBuilder: (BuildContext context, int index) {
                              final double value = 1 + (index * 1);
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
                  SizedBox(height: screenSize.height * 0.01,),
                  Container(
                    height: screenSize.height * 0.22,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:25.0,bottom: 25.0,left: 15.5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                TextComponent(text: 'What is your',
                                  textStyle: Theme.of(context).textTheme.bodyMedium,),
                                TextComponent(text: ' Wight?',
                                  textStyle: Theme.of(context).textTheme.displayLarge,),
                              ],
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' ${model.selectedValueWeight}'),
                            TextComponent(text: '  Kg', textStyle: Theme.of(context).textTheme.headlineSmall,)
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            (maxValue - minValue) ~/ 0.1 + 1,
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
                  SizedBox(height: screenSize.height * 0.01,),
                  Container(
                    height: screenSize.height * 0.22,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:25.0,bottom: 25.0,left: 15.5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                TextComponent(text: 'What is your',
                                  textStyle: Theme.of(context).textTheme.bodyMedium,),
                                TextComponent(text: ' Height?',
                                  textStyle: Theme.of(context).textTheme.displayLarge,),
                              ],
                            ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(' ${model.selectedValueHeight}'),
                            TextComponent(text: '  Cm', textStyle: Theme.of(context).textTheme.headlineSmall,)
                          ],
                        ),
                        SizedBox(
                          height: 40.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            (maxValue - minValue) ~/ 0.1 + 1,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonComponentContinue(
                        text: 'Next',
                        onPress: () async {
                          Map<String, dynamic> additionalData = {
                            'weight': userDataModel.selectedValueWeight,
                            'Age': userDataModel.selectedValueAge,
                            'Height': userDataModel.selectedValueHeight,

                          };
                          await FirebaseFirestore.instance
                              .collection('User')
                              .doc(registerViewModel.nameController.text)
                              .update(additionalData);
                          Beamer.of(context).beamToNamed('/userDataStep2');
                        }),
                  ),


                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

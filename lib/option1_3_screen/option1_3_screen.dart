import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/choice_component.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/component/quantity_component.dart';
import 'package:virtam/option1_3_screen/option1_3_view_model.dart';
import '../component/button_component.dart';
import '../user_data_screen/user_data_view_model.dart';

class Option13Screen extends StatelessWidget {
  Option13Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final vmProvider = Provider.of<Option13ViewModel>(context);
    final UserDataViewModel userDataModel =
    Provider.of<UserDataViewModel>(context);
    final Map<String, List<String>> choiceTexts = {
      'allergy': ['Eggs', 'Milk', 'Fish'],
      'thyroidCheck': [
        'Less than 90 days',
        'last 3 months',
        'last 6 months',
        'more than 6 months'
      ],
      'thyroidProblem': ['Yes', 'No', "I don't know"],
      'ironCheck': [
        'Less than 90 days',
        'Last 3 months',
        'Last 6 months',
        'More than 6 months'
      ],
      'ironDefect': ['Yes', 'No', "I don't know"],
      'vitaminDCheck': [
        'Less than 90 days',
        'Last 3 months',
        'Last 6 months',
        'More than 6 months'
      ],
      'vitaminDDeficiency': ['Yes', 'No', "I don't know"],
      'vitaminB12Check': [
        'Less than 90 days',
        'Last 3 months',
        'Last 6 months',
        'More than 6 months'
      ],
      'vitaminB12Deficiency': ['Yes', 'No', "I don't know"],
      'employee': ['Yes', 'No'],
      'workNature': ['Office', 'Field'],
    };


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(''),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text('Weight : '),
                        const QuantityComponent(
                            maxVal: 200, initVal: 50, minVal: 35, steps: 1),
                        SizedBox(
                          width: screenSize.width * 0.09,
                        ),
                        const Row(
                          children: [
                            Text('Weight : '),
                            QuantityComponent(
                                maxVal: 200,
                                initVal: 120,
                                minVal: 50,
                                steps: 1),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Row(
                      children: [
                        const Center(child: Text('Birthday Date :  ')),
                        FormComponent(
                          width: 150,
                          icon: const Icon(Icons.calendar_today),
                          hintText: ' --  :  --  :  ----  ',
                          controller: vmProvider.dateController,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);
                              vmProvider.dateController.text = formattedDate;
                            } else {}
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const Text('Is he allergic to :     '),
                          ChoiceComponent(
                            choiceKey: 'allergy',
                            choiceText: const ['Eggs', 'Milk', 'Fish'],
                            selectedValue: vmProvider.allergyValue,
                            onValueChanged: (int? index) {
                              vmProvider.setChoiceValue('allergy', index!);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'When is the thyroid gland checked for the last time ?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'thyroidCheck',
                          choiceText: const [
                            'Less than 90 days',
                            'last 3 months',
                            'last 6 months',
                            'more than 6 months'
                          ],
                          selectedValue: vmProvider.thyroidCheckValue,
                          onValueChanged: (int? index) {
                            vmProvider.setChoiceValue('thyroidCheck', index!);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'Does he have a thyroid problem?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'thyroidProblem',
                          choiceText: const ['Yes', 'No', "I don't know"],
                          selectedValue: vmProvider.thyroidProblemValue,
                          onValueChanged: (int? index) {
                            vmProvider.thyroidProblemValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'When was the last time your iron was checked?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'ironCheck',
                          choiceText: const [
                            'Less than 90 days',
                            'Last 3 months',
                            'Last 6 months',
                            'More than 6 months'
                          ],
                          selectedValue: vmProvider.ironCheckValue,
                          onValueChanged: (int? index) {
                            vmProvider.ironCheckValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'Does he have defects in iron?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'ironDefect',
                          choiceText: const ['Yes', 'No', "I don't know"],
                          selectedValue: vmProvider.ironDefectValue,
                          onValueChanged: (int? index) {
                            vmProvider.ironDefectValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'When was your vitamin D last checked?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'vitaminDCheck',
                          choiceText: const [
                            'Less than 90 days',
                            'Last 3 months',
                            'Last 6 months',
                            'More than 6 months'
                          ],
                          selectedValue: vmProvider.vitaminDCheckValue,
                          onValueChanged: (int? index) {
                            vmProvider.vitaminDCheckValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'Does he have a vitamin D deficiency?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'vitaminDDeficiency',
                          choiceText: const ['Yes', 'No', "I don't know"],
                          selectedValue: vmProvider.vitaminDDeficiencyValue,
                          onValueChanged: (int? index) {
                            vmProvider.vitaminDDeficiencyValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'When was Vitamin B12 checked again?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'vitaminB12Check',
                          choiceText: const [
                            'Less than 90 days',
                            'Last 3 months',
                            'Last 6 months',
                            'More than 6 months'
                          ],
                          selectedValue: vmProvider.vitaminB12CheckValue,
                          onValueChanged: (int? index) {
                            vmProvider.vitaminB12CheckValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'Does he have a vitamin B12 deficiency?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'vitaminB12Deficiency',
                          choiceText: const ['Yes', 'No', "I don't know"],
                          selectedValue: vmProvider.vitaminB12DeficiencyValue,
                          onValueChanged: (int? index) {
                            vmProvider.vitaminB12DeficiencyValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'Are you an employee/worker?',
                        ),
                        ChoiceComponent(
                          choiceKey: 'employee',
                          choiceText: const ['Yes', 'No'],
                          selectedValue: vmProvider.employeeValue,
                          onValueChanged: (int? index) {
                            vmProvider.employeeValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Column(
                      children: [
                        const Text(
                          'Nature of work',
                        ),
                        ChoiceComponent(
                          choiceKey: 'workNature',
                          choiceText: const ['Office', 'Field'],
                          selectedValue: vmProvider.workNatureValue,
                          onValueChanged: (int? index) {
                            vmProvider.workNatureValue = index;
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.03),
                    Row(
                      children: [
                        const Center(
                            child: Text('When do you wake up every day?  ')),
                        FormComponent(
                          width: 115,
                          icon: const Icon(Icons.access_time_outlined),
                          hintText: ' --  :  -- ',
                          controller: vmProvider.wakeUpTimeController,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              vmProvider.setWakeUpTime(pickedTime);
                              String formattedTime = pickedTime.format(context);
                              vmProvider.wakeUpTimeController.text =
                                  formattedTime;
                            }
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Center(
                            child: Text('When is your daily bedtime?  ')),
                        FormComponent(
                          width: 115,
                          icon: const Icon(Icons.access_time_outlined),
                          hintText: ' --  :  -- ',
                          controller: vmProvider.bedTimeController,
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              vmProvider.setBedtime(pickedTime);
                              String formattedTime = pickedTime.format(context);
                              vmProvider.bedTimeController.text = formattedTime;
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonComponent(
                            customColor: const Color(0xffBE543D),
                            width: 150,
                            text: 'Next',
                            onPress: () async {
                              Map<String, dynamic> additionalData = {
                                'weight': vmProvider.weight,
                                'birthdayDate': vmProvider.dateController.text,
                                'bedtime': vmProvider.bedTimeController.text,
                                'wakeuptime': vmProvider.wakeUpTimeController.text,
                                'allergy': vmProvider.choiceValues['allergy'] != null ? choiceTexts['allergy']![vmProvider.choiceValues['allergy']!] : null,
                                'thyroidCheck': vmProvider.choiceValues['thyroidCheck'] != null ? choiceTexts['thyroidCheck']![vmProvider.choiceValues['thyroidCheck']!] : null,
                                'thyroidProblem':vmProvider.choiceValues['thyroidProblem'] != null ? choiceTexts['thyroidProblem']![vmProvider.choiceValues['thyroidProblem']!] : null,
                                'ironCheck':vmProvider.choiceValues['ironCheck'] != null ? choiceTexts['ironCheck']![vmProvider.choiceValues['ironCheck']!] : null,
                                'ironDefect':vmProvider.choiceValues['ironDefect'] != null ? choiceTexts['ironDefect']![vmProvider.choiceValues['ironDefect']!] : null,
                                'vitaminDCheck':vmProvider.choiceValues['vitaminDCheck'] != null ? choiceTexts['vitaminDCheck']![vmProvider.choiceValues['vitaminDCheck']!] : null,
                                'vitaminDDeficiency':vmProvider.choiceValues['vitaminDDeficiency'] != null ? choiceTexts['vitaminDDeficiency']![vmProvider.choiceValues['vitaminDDeficiency']!] : null,
                                'vitaminB12Check':vmProvider.choiceValues['vitaminB12Check'] != null ? choiceTexts['vitaminB12Check']![vmProvider.choiceValues['vitaminB12Check']!] : null,
                                'vitaminB12Deficiency':vmProvider.choiceValues['vitaminB12Deficiency'] != null ? choiceTexts['vitaminB12Deficiency']![vmProvider.choiceValues['vitaminB12Deficiency']!] : null,
                                'employee':vmProvider.choiceValues['employee'] != null ? choiceTexts['employee']![vmProvider.choiceValues['employee']!] : null,
                                'workNature':vmProvider.choiceValues['workNature'] != null ? choiceTexts['workNature']![vmProvider.choiceValues['workNature']!] : null,

                              };
                              await FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(userDataModel.nameController.text)
                                  .update(additionalData);
                              Beamer.of(context).beamToNamed('/homeScreen');
                            })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

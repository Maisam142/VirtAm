import 'dart:async';
import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtam/component/meals_component.dart';
import 'package:virtam/component/text_component.dart';
import '../../../component/circular_component.dart';
import '../../../component/home_component.dart';
import '../../../generated/l10n.dart';
import '../../../helper/calories_class.dart';
import '../../../helper/profile_class.dart';
import '../register_screen/register_screen_view_model.dart';
import 'calories_view_model.dart';


class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(registerViewModel.emailController.text.toLowerCase())
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData && snapshot.data!.exists) {
            final data = snapshot.data?.data();

            final weightData = data?['weight'] ?? '----';
            final breakfastRecFat = data?['breakfastFats'] ?? '----';
            final breakfastRecPro = data?['breakfastPro'] ?? '----';
            final breakfastRecCarb = data?['breakfastCarb'] ?? '----';
            final lunchRecFat = data?['lunchFats'] ?? '----';
            final lunchRecPro = data?['lunchPro'] ?? '----';
            final lunchRecCarb = data?['lunchCarb'] ?? '----';
            final dinnerRecFat = data?['dinnerFats'] ?? '----';
            final dinnerRecPro = data?['dinnerPro'] ?? '----';
            final dinnerRecCarb = data?['dinnerCarb'] ?? '----';
            final snackRecFat = data?['snackFats'] ?? '----';
            final snackRecPro = data?['snackPro'] ?? '----';
            final snackRecCarb = data?['snackCarb'] ?? '----';
            //--------------------------------------------------------------------

            return CaloriesScreenContent( weight: weightData,
              breakfastRecFat: breakfastRecFat,breakfastRecPro: breakfastRecPro,breakfastRecCarb: breakfastRecCarb,
              lunchRecFat: lunchRecFat,lunchRecCarb: lunchRecCarb,lunchRecPro: lunchRecPro,
              dinnerRecFat: dinnerRecFat,dinnerRecCarb: dinnerRecCarb,dinnerRecPro: dinnerRecPro,
              snackRecFat: snackRecFat,snackRecCarb: snackRecCarb,snackRecPro: snackRecPro,);
          }
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
        },
      ),

    );
  }
}

class CaloriesScreenContent extends StatefulWidget {
  CaloriesScreenContent({super.key, required this.weight,
    required this.breakfastRecFat, required this.breakfastRecPro, required this.breakfastRecCarb, required this.lunchRecFat, required this.lunchRecPro, required this.lunchRecCarb, required this.dinnerRecFat, required this.dinnerRecPro, required this.dinnerRecCarb, required this.snackRecFat, required this.snackRecPro, required this.snackRecCarb, });
  final double weight;
  final String breakfastRecFat;
  final String breakfastRecPro;
  final String breakfastRecCarb;
  final String lunchRecFat;
  final String lunchRecPro;
  final String lunchRecCarb;
  final String dinnerRecFat;
  final String dinnerRecPro;
  final String dinnerRecCarb;
  final String snackRecFat;
  final String snackRecPro;
  final String snackRecCarb;

  @override
  State<CaloriesScreenContent> createState() => _CaloriesScreenContentState();
}

class _CaloriesScreenContentState extends State<CaloriesScreenContent> {
  late StepCalculator calculator = StepCalculator();
  int dailyStepCount = 0;
  late StreamSubscription<StepCount> _subscription;


  void startListeningToSteps() {
    _subscription = Pedometer.stepCountStream.listen(
            (StepCount event) {
              setState(() {
                dailyStepCount = event.steps;
              });
            }
    );}
  @override
  Widget build(BuildContext context) {
    final caloriesProvider = Provider.of<CaloriesViewModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    double calories = calculator.calculateCalories(
      isMetric: true,
      isRunning: false,
      bodyWeight: widget.weight,
      stepLength: 170.0,
      stepCount: dailyStepCount,
    );

    final Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
      //Beamer.of(context).beamToNamed('/homeNavigationBar');

          return false;
    },
    child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextComponent(text: S.of(context).CalorieCalc),
                    ),
                    IconButton(
                      onPressed: () {
                        Beamer.of(context).beamToNamed('/caloriesSettingScreen');
                      },
                      icon: const ImageIcon(
                        AssetImage('images/setting.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: 400,
                  child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: CircularComponent(
                        text1: S.of(context).remaining,
                        text2: '$calories',
                        text3: S.of(context).remainingml,
                      )
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: HomeComponent(
                        valueText: '21/46.0',
                        text: S.of(context).proteina,
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Expanded(
                      child: HomeComponent(
                        valueText: '18/45.0',
                        text: S.of(context).carbohydrates,
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    Expanded(
                      child: HomeComponent(
                        valueText: '18/59.0',
                        text: S.of(context).fast,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02,),
                Column(
                  children: [
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/breakfast.png'),
                      mealTypeText: S.of(context).addBreakFast,
                      text: '${S.of(context).recommended} ${widget.breakfastRecPro ?? ''} || ${widget.breakfastRecCarb ?? ''} || ${widget.breakfastRecFat ?? ''}',
                      onPressedIcon: () async {
                        String imageUrl = '';
                        await caloriesProvider.pickImage(context);
                        if (caloriesProvider.selectedImage != null) {
                          imageUrl = await StoreDate().uploadImageToStorage(
                            'BreakFast',
                            caloriesProvider.selectedImage!,
                            context,
                          );
                          Map<String, dynamic> updatedData = {
                            'breakfastFats': '00',
                            'breakfastPro': '00',
                            'breakfastCarb': '00',
                          };
                          if (imageUrl.isNotEmpty) {
                            updatedData['breakfast'] = imageUrl;

                          }

                          await FirebaseFirestore.instance
                              .collection('User')
                              .doc(registerViewModel.emailController.text.toLowerCase())
                              .update(updatedData);

                        } else {
                          print('No image selected.');
                        }
                      },

                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/lunch.png'),
                      mealTypeText: S.of(context).addLunch,
                      text: '${S.of(context).recommended} ${widget.lunchRecPro ?? ''} || ${widget.lunchRecCarb ?? ''} || ${widget.lunchRecFat ?? ''}',
                      onPressedIcon: () async {
                        String imageUrl = '';
                        await caloriesProvider.pickImage(context);
                        if (caloriesProvider.selectedImage != null) {
                          imageUrl = await StoreDate().uploadImageToStorage(
                            'lunch}',
                            caloriesProvider.selectedImage!,
                            context,
                          );
                          Map<String, dynamic> updatedData = {
                            'lunchFats': '00',
                            'lunchPro': '00',
                            'lunchCarb': '00',
                          };
                          if (imageUrl.isNotEmpty) {
                            updatedData['lunch'] = imageUrl;
                          }

                          await FirebaseFirestore.instance
                              .collection('User')
                              .doc(registerViewModel.emailController.text.toLowerCase())
                              .update(updatedData);

                        } else {
                          print('No image selected.');
                        }
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/dinner.png'),
                      mealTypeText: S.of(context).addDinner,
                      text: '${S.of(context).recommended} ${widget.dinnerRecPro ?? ''} || ${widget.dinnerRecCarb ?? ''} || ${widget.dinnerRecFat ?? ''} ',
                      onPressedIcon: () async {
                        String imageUrl = '';
                        await caloriesProvider.pickImage(context);
                        if (caloriesProvider.selectedImage != null) {
                          imageUrl = await StoreDate().uploadImageToStorage(
                            'dinner',
                            caloriesProvider.selectedImage!,
                            context,
                          );
                          Map<String, dynamic> updatedData = {
                            'dinnerFats': '00',
                            'dinnerPro': '00',
                            'dinnerCarb': '00',
                          };
                          updatedData['dinner'] = imageUrl;

                          await FirebaseFirestore.instance
                              .collection('User')
                              .doc(registerViewModel.emailController.text.toLowerCase())
                              .update(updatedData);

                        } else {
                          print('No image selected.');
                        }
                      },

                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/snack.png'),
                      mealTypeText: S.of(context).addSnack,
                      text: '${S.of(context).recommended} ${widget.snackRecPro ?? ''} || ${widget.snackRecCarb ?? ''} || ${widget.snackRecFat ?? ''}',
                      onPressedIcon: () async {
                        String imageUrl = '';
                        await caloriesProvider.pickImage(context);
                        if (caloriesProvider.selectedImage != null) {
                          imageUrl = await StoreDate().uploadImageToStorage(
                            'snack',
                            caloriesProvider.selectedImage!,
                            context,
                          );
                          Map<String, dynamic> updatedData = {
                            'snackFats': '00',
                            'snackPro': '00',
                            'snackCarb': '00',
                          };
                          if (imageUrl.isNotEmpty) {
                            updatedData['snack'] = imageUrl;
                          }

                          await FirebaseFirestore.instance
                              .collection('User')
                              .doc(registerViewModel.emailController.text.toLowerCase())
                              .update(updatedData);

                        } else {
                          print('No image selected.');
                        }
                      },

                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                  ],
                ),
              ],
            ),
          ),
        )
    ));
  }
}

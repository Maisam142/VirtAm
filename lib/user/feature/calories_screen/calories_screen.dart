import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtam/component/meals_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/circular_component.dart';
import '../../../component/home_component.dart';
import '../../../generated/l10n.dart';




class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/homeNavigationBar');

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
                      physics: NeverScrollableScrollPhysics(),
                      child: CircularComponent(
                        text1: S.of(context).remaining,
                        text2: S.of(context).calories,
                        text3: S.of(context).remaining200,
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
                      text: S.of(context).recommended,
                      onPressedIcon: (){},
                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/lunch.png'),
                      mealTypeText: S.of(context).addLunch,
                      text: S.of(context).recommended,
                      onPressedIcon: (){},

                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/dinner.png'),
                      mealTypeText: S.of(context).addDinner,
                      text: S.of(context).recommended,
                      onPressedIcon: (){},
                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/snack.png'),
                      mealTypeText: S.of(context).addSnack,
                      text: S.of(context).recommended,
                      onPressedIcon: (){},
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

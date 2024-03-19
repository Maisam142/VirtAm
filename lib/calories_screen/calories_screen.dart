import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virtam/component/meals_component.dart';
import 'package:virtam/component/text_component.dart';

import '../component/circular_component.dart';
import '../component/home_component.dart';
import '../component/logo_component.dart';

class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: TextComponent(text: 'Calorie calculator'),
                    ),
                    IconButton(
                      onPressed: () {},
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
                        text1: 'Remaining',
                        text2: 'Calories',
                        text3: 'Remaining: 2000',
                      )
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: HomeComponent(
                        valueText: '21/4656.0',
                        text: 'Proteina',
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    const Expanded(
                      child: HomeComponent(
                        valueText: '18/435.0',
                        text: 'carbohydrates',
                      ),
                    ),
                    SizedBox(
                      width: screenSize.width * 0.01,
                    ),
                    const Expanded(
                      child: HomeComponent(
                        valueText: '18/59.0',
                        text: 'Fats',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.02,),
                Column(
                  children: [
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/breakfast.png'),
                      mealTypeText: ' Add Breakfast',
                      text: 'recommended .767-1024',
                      onPressedIcon: (){},
                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/lunch.png'),
                      mealTypeText: 'Add Lunch',
                      text: 'recommended .767-1024',
                      onPressedIcon: (){},

                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/dinner.png'),
                      mealTypeText: 'Add Dinner',
                      text: 'recommended .767-1024',
                      onPressedIcon: (){},
                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                    MealsComponent(
                      mealTypeImage: const AssetImage('images/snack.png'),
                      mealTypeText: ' Add Snack',
                      text: 'recommended .767-1024',
                      onPressedIcon: (){},
                    ),
                    SizedBox(height: screenSize.height * 0.02,),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}

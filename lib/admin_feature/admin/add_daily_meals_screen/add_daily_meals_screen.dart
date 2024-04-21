import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';

class AddDailyMealsScreen extends StatelessWidget {
  const AddDailyMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Beamer.of(context).beamToNamed('/homeAdminScreen');
          return false;
        },
        child: SafeArea(
        child: Scaffold(
        body: SingleChildScrollView(
        child: Column(children: [
          BackComponent(
            onPressed: (){
              Beamer.of(context).beamToNamed('/homeAdminScreen');
            },
            text: S.of(context).addDailyMeal,
          ),
          Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: TextComponent(text: S.of(context).addDailyMealForMembers,)),
                  ],
                ),
              ),
              const Image(image: AssetImage('images/meals.png'),),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      FormComponent(
                      hintText: S.of(context).mealName,
                      ),
                      FormComponent(
                        hintText: S.of(context).addFirstType,
                      ),
                      FormComponent(
                        hintText: S.of(context).describeFirstType,),
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey.shade400,
                      ),
                      FormComponent(
                        hintText: S.of(context).selectMembers,
                      ),
                      ElevatedButton(

                        onPressed: (){},
                          child: Row(
                            children: [
                              const Icon(Icons.add_box,color: Colors.black,size: 25,),
                              TextComponent(text: S.of(context).addSecondType),
                            ],
                          ),),

                    ],
                  ),
                ),
              ),

            ],
          )
          ]),
    ),
        ),
        ),
    );
  }
}

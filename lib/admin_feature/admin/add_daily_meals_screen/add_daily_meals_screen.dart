import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/form_component.dart';

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
            text: 'Add Daily Meals',
          ),
          Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.white,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: TextComponent(text: '    Add daily meals for your Members :',)),
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
                      hintText: 'Meal Name',
                      ),
                      FormComponent(
                        hintText: 'Add First Type',
                      ),
                      FormComponent(
                        hintText: 'Describe First Type',),
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Colors.grey.shade400,
                      ),
                      FormComponent(
                        hintText: 'Select Members',
                      ),
                      ElevatedButton(

                        onPressed: (){},
                          child: const Row(
                            children: [
                              Icon(Icons.add_box,color: Colors.black,size: 25,),
                              TextComponent(text: '  Add Second Type'),
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

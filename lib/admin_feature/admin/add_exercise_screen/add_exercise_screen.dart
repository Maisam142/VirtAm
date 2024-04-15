import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/form_component.dart';

class AddExerciseScreen extends StatelessWidget {
  const AddExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/profileScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const BackComponent(
                  text: 'Add Exercise',
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextComponent(text: '    The center send exercise members:',
                            textStyle: TextStyle(fontSize: 20
                            ),),
                        ],
                      ),
                      const Image(image: AssetImage('images/add_exercise.png'),),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            FormComponent(
                              hintText: 'Exercise Name: ',
                            ),
                            FormComponent(
                              hintText: 'Select Members ',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey.shade400,
                        height: 200,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20,),
                      const ButtonComponentContinue(text: 'Add')
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

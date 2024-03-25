import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import '../component/feild_component.dart';

class CaloriesSettingScreen extends StatelessWidget {
  const CaloriesSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/homeNavigationBar');
      return false;
    },
    child:SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackComponent(
              text: 'Settings',
              onPressed: (){
                Beamer.of(context).beamBack();

              },
            ),
            const SizedBox(height: 40,),
            FieldComponent(
              onPressed: (){

              },
              text: '  Calories Goal',
            ),
            SizedBox(height: 10,),

            SizedBox(height: 10,),
            FieldComponent(
              onPressed: (){

              },
              text: '   Meal Numbers',
            ),

          ],
        ),
      ),
    )));
  }
}

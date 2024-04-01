import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../component/feild_component.dart';
import '../../generated/l10n.dart';

class DrinkSettingScreen extends StatelessWidget {
  const DrinkSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/drinkWaterScreen');
      return false;
    },
    child:SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BackComponent(
              text: S.of(context).settings,
              onPressed: (){
                Beamer.of(context).beamBack();
              },
            ),
            const SizedBox(height: 40,),
            FieldComponent(
              onPressed: (){

              },
              text: S.of(context).waterGoal,
            ),

            SizedBox(height: 10,),
            FieldComponent(
              onPressed: (){

              },
              text: S.of(context).habitSetting,
            ),

          ],
        ),
      ),
    )));
  }
}

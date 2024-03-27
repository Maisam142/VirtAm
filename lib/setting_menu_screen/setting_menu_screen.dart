import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import '../component/feild_component.dart';
import '../generated/l10n.dart';

class SettingMenuScreen extends StatelessWidget {
  const SettingMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            BackComponent(
              text: S.of(context).settings,
              onPressed: (){
                Beamer.of(context).beamBack();
              },
            ),
            const SizedBox(height: 40,),
            FieldComponent(
              onPressed: (){
                Beamer.of(context).beamToNamed('/aboutVirtAmScreen');

              },
              text: S.of(context).aboutVirAm,
              imageIcon: AssetImage('images/about.png'),
            ),
            // const SizedBox(height: 10,),
            // FieldComponent(
            //   onPressed: (){
            //   },
            //   text: '  Language',
            //   imageIcon: AssetImage('images/language.png'),
            // ),
            const SizedBox(height: 10,),
            FieldComponent(
              onPressed: (){

              },
              text: S.of(context).termsCondition,
              imageIcon: AssetImage('images/terms.png'),
            ),
            const SizedBox(height: 10,),
            FieldComponent(
              onPressed: (){
                Beamer.of(context).beamToNamed('/subscriptionScreen');
              },
              text: S.of(context).subscription,
              imageIcon: AssetImage('images/subscription.png'),
            ),

          ],
        ),
      ),
    )));
  }
}

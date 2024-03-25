import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import '../component/feild_component.dart';

class SettingMenuScreen extends StatelessWidget {
  const SettingMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
              text: '  About VirAm',
              imageIcon: AssetImage('images/about.png'),
            ),
            SizedBox(height: 10,),
            FieldComponent(
              onPressed: (){
                Beamer.of(context).beamToNamed('aboutVirtAmScreen');
              },
              text: '  Language',
              imageIcon: AssetImage('images/language.png'),
            ),
            SizedBox(height: 10,),
            FieldComponent(
              onPressed: (){

              },
              text: '  Terms and Conditions',
              imageIcon: AssetImage('images/terms.png'),
            ),
            SizedBox(height: 10,),
            FieldComponent(
              onPressed: (){

              },
              text: '   Subscription',
              imageIcon: AssetImage('images/subscription.png'),
            ),

          ],
        ),
      ),
    ));
  }
}

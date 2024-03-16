import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/option_top_component.dart';
import 'package:virtam/component/text_component.dart';

import '../component/design_component.dart';
import 'location_screen_view_model.dart';

class CurrentLocationScreen extends StatelessWidget {
  const CurrentLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final CurrentLocationViewModel viewModel =
    Provider.of<CurrentLocationViewModel>(context);
    return SafeArea(
          child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: const Stack(
                children: [
                  DesignComponent(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(image: AssetImage('images/location.png',),
                    width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.2,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: TextLabelComponent(text: 'What is your location?')),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: TextComponent(text: 'we need know your location in order to\nsuggest nearby service.')),
                  SizedBox(height: screenSize.height * 0.03,),
                  ButtonComponentContinue(
                    text: 'Allow Location Access',
                    onPress: (){
                      viewModel.currentLocationData();
                    },
                  ),
                  SizedBox(height: screenSize.height * 0.017,),
                  ButtonComponentContinue(
                    text: 'Enter location manually ',
                    customColor: Colors.grey.shade400,
                    onPress: (){

                    },
                  ),
                ],
              ),
            ),


          ],
        ),
      ) ,
    ));
  }
}

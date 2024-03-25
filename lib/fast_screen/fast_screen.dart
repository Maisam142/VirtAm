import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/home_component.dart';

import '../component/back_component.dart';
import '../component/circular_component.dart';
import '../component/text_component.dart';

class FastScreen extends StatelessWidget {
  const FastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/homeScreen');
      return false;
    },
    child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children:[
                BackComponent(text: '',
                onPressed: (){
                  Beamer.of(context).beamBack();
                }),
                const SizedBox(
                  height: 200,
                  width: 400,
                  child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: CircularComponent(
                        text1: '10 Hours',
                        text3: 'remaining: 13:00 h',
                      ),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: HomeComponent(
                        valueText: '5:00',
                        text: 'Start Time',
                      ),
                    ),
                    Expanded(
                      child: HomeComponent(
                        valueText: '7:00',
                        text: 'End Time',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Instructions for when to fast', style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))),
                      SizedBox(height: screenSize.height * 0.02,),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('  Lorem ipsum dolor sit amet consectetur. ',style: TextStyle(fontSize: 12),),),
                      SizedBox(height: screenSize.height * 0.02,),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('  Lorem ipsum dolor sit amet consectetur.\n   Gravida purus pellentesque . ',
                            style: TextStyle(fontSize: 12),),),
                      SizedBox(height: screenSize.height * 0.02,),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('  Gravida purus pellentesque egestas auctor urna\n   vel sit. ',
                            style: TextStyle(fontSize: 12),),),

                    ],
                  ),
                ),
                SizedBox(height: screenSize.height * 0.05),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ButtonComponentContinue(text: 'End Fast'),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ButtonComponentContinue(text: 'Break Fast',customColor: Colors.grey.shade400,
                  onPress: (){
                    Beamer.of(context).beamToNamed('/breakFastScreen');
                  },),
                ),

              ]),
          ),
        ),));
  }
}

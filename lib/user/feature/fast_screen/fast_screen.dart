import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/home_component.dart';

import '../../../component/back_component.dart';
import '../../../component/circular_component.dart';
import '../../../generated/l10n.dart';
import '../home_screen/home_screen_view_model.dart';


class FastScreen extends StatelessWidget {
  const FastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fastViewModel = Provider.of<HomeViewModel>(context);

    int startFast = int.tryParse(fastViewModel.startFastController.text) ?? 0;
    int endFast = int.tryParse(fastViewModel.endFastController.text) ?? 0;

    int hours = endFast - startFast;
    //]fastViewModel.timeFastController.text = hours as String;
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
                SizedBox(
                  height: 200,
                  width: 400,
                  child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: CircularComponent(
                        text1:  '$hours ${S.of(context).hours}',
                        text3: S.of(context).remainingTime,
                      ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: HomeFastComponent(
                        valueText: fastViewModel.startFastController.text,
                        text: S.of(context).start,
                        controller: fastViewModel.startFastController,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: HomeFastComponent(
                        valueText: fastViewModel.endFastController.text,
                        text: S.of(context).end,
                        controller: fastViewModel.endFastController,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(S.of(context).instructions, style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ButtonComponentContinue(text: S.of(context).end),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ButtonComponentContinue(text: S.of(context).breakFast ,customColor: Colors.grey.shade400,
                  onPress: (){
                    Beamer.of(context).beamToNamed('/breakFastScreen');
                  },),
                ),

              ]),
          ),
        ),));
  }
}

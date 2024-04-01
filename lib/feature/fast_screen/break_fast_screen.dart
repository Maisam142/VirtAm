import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

class BreakFastScreen extends StatelessWidget {
  const BreakFastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/fastScreen');
      return false;
    },
    child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                BackComponent(
                  text: ' Breaking Fasting',
                  onPressed: (){
                    Beamer.of(context).beamBack();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Instructions to break fast ',
                              style: TextStyle(color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: screenSize.height * 0.02,),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('  Lorem ipsum dolor sit amet consectetur.  ',style: TextStyle(fontSize: 12),),),
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
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(image: AssetImage('images/fast1.png'),),
                            )),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(image: AssetImage('images/fast2.png'),),
                            )),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(image: AssetImage('images/fast3.png'),),
                            )),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(image: AssetImage('images/fast4.png'),),
                            )),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(image: AssetImage('images/fast5.png'),),
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
    )));
  }
}

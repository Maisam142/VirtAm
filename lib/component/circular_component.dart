import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:virtam/component/text_component.dart';

class CircularComponent extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  const CircularComponent({
    super.key,
    this.text1,
    this.text2,
    this.text3

  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return CircularPercentIndicator(
      radius: 150,
      lineWidth: 10,
      animation: true,
      arcType: ArcType.HALF,
      percent: 0.5,
      arcBackgroundColor: Colors.grey.withOpacity(0.3),
      startAngle: 270,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Theme.of(context).primaryColor,
      center: Column(children: [
        SizedBox(
          height: screenSize.height * 0.04,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextComponent(
            text: text1,
            textStyle: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        TextComponent(
          text: text2,
          textStyle: TextStyle(color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: screenSize.height * 0.03,
        ),
         Text(
          text3!,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(height: screenSize.height * 0.04),
      ]),
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';


import '../../../component/back_component.dart';
import '../../../generated/l10n.dart';


class BreakFastScreen extends StatelessWidget {
  const BreakFastScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/fastScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BackComponent(
                  text: ' Breaking Fasting',
                  onPressed: () {
                    Beamer.of(context).beamBack();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).breakFastInstructions,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '  Lorem ipsum dolor sit amet consectetur.  ',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '  Lorem ipsum dolor sit amet consectetur.\n   Gravida purus pellentesque . ',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 16),
                      Text(
                        '  Gravida purus pellentesque egestas auctor urna\n   vel sit. ',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset('images/fast1.png'),
                      ),
                      Expanded(
                        child: Image.asset('images/fast2.png'),
                      ),
                      Expanded(
                        child: Image.asset('images/fast3.png'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset('images/fast4.png'),
                      ),
                      Expanded(
                        child: Image.asset('images/fast5.png'),
                      ),
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

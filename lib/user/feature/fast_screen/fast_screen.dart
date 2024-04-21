import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/home_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/back_component.dart';
import '../../../component/circular_component.dart';
import '../../../generated/l10n.dart';
import '../../../helper/fasting.dart';
import '../home_screen/home_screen_view_model.dart';
import '../register_screen/register_screen_view_model.dart';

class FastScreen extends StatelessWidget {
  const FastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fastViewModel = Provider.of<HomeViewModel>(context);
    final RegisterViewModel registerViewModel =
        Provider.of<RegisterViewModel>(context);



    final Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/homeNavigationBar');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('User')
                .doc(registerViewModel.emailController.text.toLowerCase())
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');
              if (snapshot.hasData && snapshot.data!.exists) {
                final data = snapshot.data?.data();
                final startFastTimeShow = data!['startFastTime'];
                final endFastTimeShow = data['endFastTime'];

                //--------------------------------------------------------------------
                final startFastTime = parseTimeString(data['startFastTime']);
                final endFastTime = parseTimeString(data['endFastTime']);

                final startHour = startFastTime.hour;
                final startMinute = startFastTime.minute;

                final endHour = endFastTime.hour;
                final endMinute = endFastTime.minute;
                final hourDifference = endFastTime.hour > startFastTime.hour ? endFastTime.difference(startFastTime).inHours : startFastTime.difference(endFastTime).inHours;

                print('Start fasting time: $startHour:$startMinute');
                print('End fasting time: $endHour:$endMinute');


                return SingleChildScrollView(
                  child: Column(children: [
                    BackComponent(
                        text: '',
                        onPressed: () {
                          Beamer.of(context).beamToNamed('/homeNavigationBar');
                        }),
                    SizedBox(
                      height: 200,
                      width: 400,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: CircularComponent(
                          text1: '$hourDifference ${S.of(context).hours}',
                          text3: S.of(context).remainingTime,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 80,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextLabelComponent(text: '$startFastTimeShow'),
                                TextComponent(
                                  text: S.of(context).start,
                                  textStyle: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: 80,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextLabelComponent(text: '$endFastTimeShow'),
                                TextComponent(
                                  text: S.of(context).end,
                                  textStyle: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
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
                              child: Text(S.of(context).instructions,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '  Lorem ipsum dolor sit amet consectetur. ',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '  Lorem ipsum dolor sit amet consectetur.\n   Gravida purus pellentesque . ',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.02,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '  Gravida purus pellentesque egestas auctor urna\n   vel sit. ',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.05),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                      child: ButtonComponentContinue(text: S.of(context).editFastTime,
                      onPress: (){
                        Beamer.of(context).beamToNamed('/fastTimeEditScreen');
                      },),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                      child: ButtonComponentContinue(text: S.of(context).end),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0),
                      child: ButtonComponentContinue(
                        text: S.of(context).breakFast,
                        customColor: Colors.grey.shade400,
                        onPress: () {
                          Beamer.of(context).beamToNamed('/breakFastScreen');
                        },
                      ),
                    ),
                  ]),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

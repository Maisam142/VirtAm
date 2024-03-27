import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';

import '../component/text_component.dart';
import '../generated/l10n.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return  WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/homeNavigationBar');
      return false;
    },
    child: SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            BackComponent(
              onPressed: (){
                Beamer.of(context).beamBack();
              },
              text: S.of(context).notification,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextComponent(text: S.of(context).today)),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: screenSize.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(image: AssetImage('images/notificationLogo.png',),width: 50,height: 50,),
                            ),
                            Column(
                              children: [
                                TextLabelComponent(text: S.of(context).drinkWater),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: TextComponent(text: S.of(context).reminderToDrink, textStyle: Theme.of(context).textTheme.bodySmall,),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const TextComponent(text: '20:04'),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextComponent(text: S.of(context).yesterday)),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: screenSize.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(image: AssetImage('images/notificationLogo.png',),width: 50,height: 50,),
                            ),
                            Column(
                              children: [
                                TextLabelComponent(text: S.of(context).drinkWater),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: TextComponent(text: S.of(context).reminderToDrink, textStyle: Theme.of(context).textTheme.bodySmall,),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const TextComponent(text: '20:04'),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
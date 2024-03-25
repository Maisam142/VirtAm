import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';

import '../component/text_component.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const BackComponent(
              text: 'Notification',
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextComponent(text: 'Today')),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: screenSize.height * 0.1,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(image: AssetImage('images/notificationLogo.png',),width: 50,height: 50,),
                            ),
                            Column(
                              children: [
                                TextLabelComponent(text: 'Drink Water'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: TextComponent(text: 'Reminder to drink water', textStyle: Theme.of(context).textTheme.bodySmall,),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextComponent(text: 'Yesterday')),
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: screenSize.height * 0.1,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(image: AssetImage('images/notificationLogo.png',),width: 50,height: 50,),
                            ),
                            Column(
                              children: [
                                TextLabelComponent(text: 'Drink Water'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: TextComponent(text: 'Reminder to drink water', textStyle: Theme.of(context).textTheme.bodySmall,),
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
    );
  }
}
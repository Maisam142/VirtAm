import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';

class SendNotificationScreen extends StatelessWidget {
  const SendNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Beamer.of(context).beamToNamed('/profileScreen');
          return false;
        },
        child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                BackComponent(
                  text: S.of(context).sendNotification,
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextComponent(text: S.of(context).centerSendNotification,
                          textStyle: const TextStyle(fontSize: 20
                          ),),
                        ],
                      ),
                      Image(image: AssetImage('images/notification_send.png'),),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            FormComponent(
                              hintText: S.of(context).notificationText,
                            ),
                            FormComponent(
                              hintText: S.of(context).selectMembers,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: 200,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20,),
                      ButtonComponentContinue(text: S.of(context).send)
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

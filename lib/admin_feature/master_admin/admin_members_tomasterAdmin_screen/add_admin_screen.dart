import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/button_component.dart';

import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';

class AddAdminScreen extends StatelessWidget {
  const AddAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          return false;
        },
        child: SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Column(
        children: [
          BackComponent(text: S.of(context).addNewAdmin,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(S.of(context).adminInclude),
                  ],
                ),
                SizedBox(height: 5,),
                Image(image: AssetImage('images/yesNo.png'),),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Text(S.of(context).adminName,style: TextStyle(color:Theme.of(context).hoverColor),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: 200,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20,),
                      ButtonComponentContinue(text: S.of(context).add)
                    ],
                  ),
                ),

              ],
            ),
          ),
        ]
        ),
        ),
    ),
        ),);
  }
}

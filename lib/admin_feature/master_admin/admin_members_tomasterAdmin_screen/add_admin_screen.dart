import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/button_component.dart';

import '../../../component/text_component.dart';

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
          backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child: Column(
        children: [
          BackComponent(text: 'Add New Admin',),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('  The center includes 3 admin to\n   supervise its members:'),
                  ],
                ),
                SizedBox(height: 5,),
                Image(image: AssetImage('images/yesNo.png'),),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey.shade200,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            const Text('  Admin Name: ',style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        color: Colors.grey.shade300,
                        height: 200,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20,),
                      ButtonComponentContinue(text: 'Add')
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

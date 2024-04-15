import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/design_component.dart';
import '../../../helper/weight_class.dart';

class AdminUserDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> memberData;
  final List<ChartData> chartData = [
    ChartData(80, 1),
    ChartData(76, 2),
    ChartData(68, 3),
    ChartData(60, 4),
    ChartData(55, 5)
  ];

  AdminUserDetailsScreen({super.key, required this.memberData});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    children: [
                      DesignComponent3(
                          onPressed:(){
                            Navigator.of(context).pop();
                          }
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white,
                          child: memberData['imageUrl'] != null
                              ? CircleAvatar(
                            backgroundImage: NetworkImage(memberData['imageUrl']),
                            radius: 88,
                          )
                              : const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png',
                            ),
                            radius: 88,
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey.shade200,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            const Text('  Full Name:  ',style: TextStyle(color: Colors.grey),),
                            TextComponent(text: memberData['name'] ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        color: Colors.grey.shade200,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            const Text('  Email Adress:  ',style: TextStyle(color: Colors.grey),),
                            TextComponent(text: memberData['email'] ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        color: Colors.grey.shade200,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            const Text('  00962  ',style: TextStyle(color: Colors.grey),),
                            TextComponent(text: memberData['number'] ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        color: Colors.grey.shade200,
                        width: double.infinity,
                        height: 50,
                        child: const Row(
                          children: [
                            Text('  Member Numbers',style: TextStyle(color: Colors.grey )),
                          ],
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
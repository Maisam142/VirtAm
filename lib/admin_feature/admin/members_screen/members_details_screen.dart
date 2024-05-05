import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/design_component.dart';
import '../../../generated/l10n.dart';
import '../../../helper/weight_class.dart';

class UserDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> memberData;
  final List<ChartData> chartData = [
    ChartData(80, 1),
    ChartData(76, 2),
    ChartData(68, 3),
    ChartData(60, 4),
    ChartData(55, 5)
  ];

  UserDetailsScreen({super.key, required this.memberData});

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
                      child: memberData['imageLink'] != null
                          ? CircleAvatar(
                        backgroundImage: NetworkImage(memberData['imageLink']),
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
                    color: Theme.of(context).secondaryHeaderColor,
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        Text(S.of(context).fullName,style: TextStyle(color: Theme.of(context).hoverColor),),
                        TextComponent(text: memberData['name'] ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    color: Theme.of(context).secondaryHeaderColor,
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        Text(S.of(context).email,style: TextStyle(color: Theme.of(context).hoverColor),),
                        TextComponent(text: memberData['email'] ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    color: Theme.of(context).secondaryHeaderColor,
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        Text(S.of(context).phoneNumber,style: TextStyle(color: Theme.of(context).hoverColor),),
                        TextComponent(text: memberData['number'] ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    color: Theme.of(context).secondaryHeaderColor,
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      children: [
                        Text(S.of(context).adminName,style: TextStyle(color: Theme.of(context).hoverColor),),
                        TextComponent(text: memberData['name'] ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Theme.of(context).secondaryHeaderColor,
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            children: [
                              Text(S.of(context).weightBefore,style: TextStyle(color: Theme.of(context).hoverColor),),
                              TextComponent(text: '${memberData['weight']}' ?? '0' ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          color: Theme.of(context).secondaryHeaderColor,
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            children: [
                              Text(S.of(context).weightAfter,style: TextStyle(color: Theme.of(context).hoverColor),),
                              TextComponent(text: '${memberData['weight']}' ??'0' ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: SfCartesianChart(
                        margin: EdgeInsets.zero,
                        series: <CartesianSeries>[
                          SplineSeries<ChartData, int>(
                            color: Theme.of(context).primaryColor,
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                          ),
                        ]),
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
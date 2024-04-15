import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/home_component.dart';
import 'package:virtam/component/viewall_component.dart';

import '../../../component/text_component.dart';
import '../../../helper/weight_class.dart';



class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final List<ChartData> chartData = [
      ChartData(80, 1),
      ChartData(76, 2),
      ChartData(68, 3),
      ChartData(60, 4),
      ChartData(55, 5)
    ];
    return WillPopScope(
        onWillPop: () async {
          Beamer.of(context).beamToNamed('/homeAdminScreen');

          return false;
        },
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const DesignComponent(),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png',
                            ),
                            radius: 20,
                          ),

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 100.0,left: 25.0,right: 25.0),
                        child: Container(
                          color: Colors.white,
                          height: 350,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextComponent(text: 'Number of Members'),
                                      ViewAllComponent(
                                        onPressed: (){
                                          Beamer.of(context).beamToNamed('/membersScreen');
                                        },
                                      ),
                                    ],
                                  ),
                                  SfCartesianChart(
                                      margin: EdgeInsets.zero,
                                      series: <CartesianSeries>[
                                        SplineSeries<ChartData, int>(
                                          color: Theme.of(context).primaryColor,
                                          dataSource: chartData,
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y,
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity ,
                          height: 75,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextLabelComponent(text: '  Admins',textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              ViewAllComponent(
                                onPressed: (){},
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextLabelComponent(text: 'Member activity',textStyle: TextStyle(fontSize: 25),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                  child: HomeAdminComponent(
                                    icon: 'images/notification.png',
                                    valueText: 'Send Notification',
                                    onPressed: (){},

                                  )),
                              SizedBox(
                                width: screenSize.width * 0.01,
                              ),
                              Expanded(
                                  child: HomeAdminComponent(
                                    icon: 'images/apple.png',
                                    valueText: 'Add daily meals',
                                    onPressed: (){
                                      Beamer.of(context).beamToNamed('/addDailyMealsScreen');
                                    },

                                  )),
                              SizedBox(
                                width: screenSize.width * 0.01,
                              ),
                              Expanded(
                                  child: HomeAdminComponent(
                                    icon: 'images/exer.png',
                                    valueText: 'Add exercise',
                                    onPressed: (){},

                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),));
  }
}
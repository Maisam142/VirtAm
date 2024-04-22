import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';
import '../../../generated/l10n.dart';


class WeightHistoryScreen extends StatelessWidget {
  const WeightHistoryScreen({super.key});

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
      Beamer.of(context).beamToNamed('/homeNavigationBar');
      return false;
    },
    child: SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  BackComponent(text: 'Name-Weight History',
                  onPressed: (){
                    Beamer.of(context).beamBack();
                  },)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SfCartesianChart(
                  margin: EdgeInsets.zero,
                  series: <CartesianSeries>[
                    SplineSeries<ChartData, int>(
                      color: Theme.of(context).primaryColor,
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    )
                  ]),
            ),
            SizedBox(height: screenSize.height * 0.05,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextComponent(text: S.of(context).time,textStyle: const TextStyle(color: Colors.grey ,fontSize: 12),),
                    TextComponent(text: S.of(context).wightKg,textStyle: const TextStyle(color: Colors.grey ,fontSize: 12),),
                    TextComponent(text: S.of(context).fat,textStyle: const TextStyle(color: Colors.grey ,fontSize: 12),),
                    const SizedBox(width: 15,)
                  ],
                )
              ],
            )

          ],
        ),
      ),
    )));
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final int x;
  final double y;
}

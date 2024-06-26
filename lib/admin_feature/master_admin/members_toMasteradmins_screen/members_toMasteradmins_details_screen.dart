import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/design_component.dart';
import '../../../component/popup_component.dart';
import '../../../generated/l10n.dart';
import '../../../helper/weight_class.dart';

class MemberDetailsToMasterAdminScreen extends StatelessWidget {
  final Map<String, dynamic> memberData;
  final List<ChartData> chartData = [
    ChartData(80, 1),
    ChartData(76, 2),
    ChartData(68, 3),
    ChartData(60, 4),
    ChartData(55, 5)
  ];

  MemberDetailsToMasterAdminScreen({super.key, required this.memberData});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
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
                      DesignComponent3(onPressed: () {
                        Navigator.pop(context);
                      }),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor:Theme.of(context).hoverColor,
                          child: memberData['imageLink'] != null
                              ? CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(memberData['imageLink']),
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
                        color:Theme.of(context).secondaryHeaderColor,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Text(
                              S.of(context).fullName,
                              style: TextStyle(color: Theme.of(context).hoverColor,
                              ),
                            ),
                            TextComponent(text: memberData['name']),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color:Theme.of(context).secondaryHeaderColor,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Text(
                              S.of(context).email,
                              style: TextStyle(color: Theme.of(context).hoverColor,
                              ),
                            ),
                            TextComponent(text: memberData['email']),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color:Theme.of(context).secondaryHeaderColor,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Text(
                              S.of(context).phoneNumber,
                              style: TextStyle(color: Theme.of(context).hoverColor,
                              ),
                            ),
                            TextComponent(text: memberData['number']),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color:Theme.of(context).secondaryHeaderColor,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            Text(
                              S.of(context).adminName,
                              style: TextStyle(color: Theme.of(context).hoverColor,
                              ),
                            ),
                            TextComponent(text: memberData['name']),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color:Theme.of(context).secondaryHeaderColor,
                              width: double.infinity,
                              height: 50,
                              child: Row(
                                children: [
                                  Text(
                                    S.of(context).weightBefore,
                                    style: TextStyle(color: Theme.of(context).hoverColor,
                                    ),
                                  ),
                                  TextComponent(
                                      text: '${memberData['weight']}' ?? '0'),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              color:Theme.of(context).secondaryHeaderColor,
                              width: double.infinity,
                              height: 50,
                              child: Row(
                                children: [
                                  Text(
                                    S.of(context).weightAfter,
                                    style: TextStyle(color: Theme.of(context).hoverColor,
                                    ),
                                  ),
                                  TextComponent(
                                      text: '${memberData['weight']}' ?? '0'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        //color:Theme.of(context).secondaryHeaderColor,
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
                      SizedBox(
                        height: 20,
                      ),
                      ButtonComponent(
                        text: S.of(context).deleteMember,
                        textStyle: TextStyle(color: Colors.white, fontSize: 15),
                        onPress: ()  {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return PopupWidget(
                                  titleText: S.of(context).deleteMember,
                                  contentText: S.of(context).areYouSure,
                                  body: [
                                    Row(
                                      mainAxisAlignment:MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                          ),
                                            onPressed: (){
                                              Navigator.pop(context);
                                            },
                                            child: Text(S.of(context).cancel,style: const TextStyle(fontSize: 12,color: Colors.black),),),
                                        const SizedBox(width: 10,),
                                        ElevatedButton(
                                            onPressed: ()async{
                                            print('Member email: ${memberData['email']}');
                                            String emailLowerCase = memberData['email'].toLowerCase();

                                               await FirebaseFirestore.instance
                                                  .collection('User')
                                                  .doc(emailLowerCase)
                                                  .delete();
                                            // FirebaseAuth auth = FirebaseAuth.instance;
                                            //
                                            // User? userToDelete = (await auth.userChanges().firstWhere((user) => user!.email!.trim() ==emailLowerCase));
                                            // userToDelete!.delete();
                                            // print('----------${auth.currentUser} ------------------');

                                            Beamer.of(context).beamBack();
                                            },
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                              minimumSize: MaterialStateProperty.all<Size>(Size(120, 40)),

                                            ),
                                            child: const Text('Delete',style: TextStyle(fontSize: 15,color: Colors.black),)),

                                      ],
                                    ),
                                  ],
                                );
                              });

                        },
                      )
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

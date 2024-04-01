import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../component/back_component.dart';
import '../../component/text_component.dart';
import '../../generated/l10n.dart';


class DrinkWaterScreen extends StatelessWidget {
  const DrinkWaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackComponent(
                        text: S.of(context).drinkWater,
                      onPressed: (){
                          Beamer.of(context).beamBack();
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        Beamer.of(context).beamToNamed('/drinkSettingScreen');

                      },
                      icon: const ImageIcon(
                        AssetImage('images/setting.png'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.05,),
                Column(
                  children: [
                    Text(S.of(context).remaining200,style: TextStyle(fontSize: 13,color: Colors.grey, fontWeight: FontWeight.bold),),
                    TextLabelComponent(text: '1,290 ml',textStyle: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
                    SizedBox(height: screenSize.height * 0.09,),
                    Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            height: screenSize.height * 0.7,
                            child: Image(image: AssetImage('images/personwater.png',),fit: BoxFit.cover,)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 95.0,left: 30.0),
                              child: TextLabelComponent(text: '68%',),
                            )),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top:400.0),
                            child: IconButton(
                              onPressed: (){
                                Beamer.of(context).beamToNamed('/addTargetScreen');
                              },
                              icon: Icon(Icons.add_box,color: Colors.black,size: 50,),
                            ),
                          ),
                        )

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

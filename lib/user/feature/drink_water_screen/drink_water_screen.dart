import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/back_component.dart';
import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';
import '../register_screen/register_screen_view_model.dart';

class DrinkWaterScreen extends StatelessWidget {
  const DrinkWaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(registerViewModel.emailController.text.toLowerCase())
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData && snapshot.data!.exists) {
            final data = snapshot.data?.data();
            final waterTarget = data!['waterTarget'];

            return DrinkWaterScreenContent(waterTarget: waterTarget.toString(),);
          }
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
        },
      ),

    );
  }
}

class DrinkWaterScreenContent extends StatelessWidget {
  const DrinkWaterScreenContent({super.key, required this.waterTarget});
  final String waterTarget;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final water = int.parse(waterTarget);

    final int waterRemaining = water - 0 ;

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
                    Text('${S.of(context).remainingml} $waterRemaining ${S.of(context).ml}',style: const TextStyle(fontSize: 13,color: Colors.grey, fontWeight: FontWeight.bold),),
                    const TextLabelComponent(text: '1,290 ml',textStyle: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold),),
                    SizedBox(height: screenSize.height * 0.09,),
                    Stack(
                      children: [
                        const SizedBox(
                            width: double.infinity,
                            height: 550,
                            child: Image(image: AssetImage('images/personwater.png',),fit: BoxFit.cover,)),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 95.0,left: 30.0),
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
                              icon: const Icon(Icons.add_box,color: Colors.black,size: 50,),
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

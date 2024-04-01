import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/logo_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../generated/l10n.dart';

class AboutVirtAmScreen extends StatelessWidget {
  const AboutVirtAmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/settingMenuScreen');
      return false;
    },
    child:SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              BackComponent(
                text: S.of(context).aboutVirAm,
                onPressed: (){
                  Beamer.of(context).beamBack();

                },
              ),
              SizedBox(
                height: screenSize.height * 0.6,
                // width: screenSize.width * ,
                child: const Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child:  LogoComponent(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image(
                        image: AssetImage('images/img.png',),
                        fit: BoxFit.fill,
                        width: 990,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [

                    Column(
                      children: [
                        Column(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: TextLabelComponent(text: 'Lorem ipsum dolor sit',
                                ),),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: TextLabelComponent(text: 'amet consectetur.',),
                              ),
                            ]),
                        const Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextComponent(text: 'Lorem ipsum dolor sit  amet consectetur',
                                  textStyle: TextStyle(fontSize: 12),),
                              ),
                              Padding(padding: EdgeInsets.only(top: 0.1)),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextComponent(text: 'Lorem ipsumconsectetur.',
                                  textStyle: TextStyle(fontSize: 12),),
                              ),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

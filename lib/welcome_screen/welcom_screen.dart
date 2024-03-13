import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/logo_component.dart';
import 'package:virtam/component/text_component.dart';

import '../component/button_component.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
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
                                  child: TextComponent(text: 'Lorem ipsum dolor sit',
                                      textStyle: Theme.of(context).textTheme.labelLarge),),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: TextComponent(text: 'amet consectetur.',
                                      textStyle: Theme.of(context).textTheme.labelLarge),
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
                      SizedBox(height: screenSize.height * 0.02,),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0,left: 25.0),
                        child: ButtonComponent(
                          text: 'Log In',
                          textStyle: TextStyle(color: Colors.white , fontSize: 15,),
                          onPress: (){
                            Beamer.of(context).beamToNamed('/loginScreen');
                          },
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01,),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0,left: 25.0),
                        child: ButtonComponent(
                          text: 'Create Account',
                          customColor: Colors.white60,
                          onPress: (){},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

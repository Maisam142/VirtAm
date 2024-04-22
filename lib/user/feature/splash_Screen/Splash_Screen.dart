import 'dart:async';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),() {
      context.beamToNamed('/welcomeScreen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          // backgroundColor: Colors.white ,
          body: Center(
            child: Container(
              child: const Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image(
                      image: AssetImage('images/splashScreenImages/backGroundGrey.png',),
                      fit: BoxFit.fill,

                    ),
                  ),
                  Center(
                    child: Image(
                      image: AssetImage('images/splashScreenImages/splashLogo.png',),
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
                  ),

                ],
              ),
            ),
          ),
    );
  }
}

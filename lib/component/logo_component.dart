import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class LogoComponent extends StatelessWidget{
  const LogoComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return  Row(
      children: [
        const Image(
          image: AssetImage('images/splashScreenImages/logo.png',),
          fit: BoxFit.fill,
          width: 25,
          height: 25,
        ),
        SizedBox(width: screenSize.width * 0.01,),
        const TextComponent(
          text: 'VirtAm',
          textStyle: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
      ],
    );
  }

}
class LogoComponentWhite extends StatelessWidget{
  const LogoComponentWhite({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return  Row(
      children: [
        const Image(
          image: AssetImage('images/logoWhite.png',),
          fit: BoxFit.fill,
          width: 25,
          height: 25,
        ),
        SizedBox(width: screenSize.width * 0.01,),
        const TextComponent(
          text: 'VirtAm',
          textStyle: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 15,color: Colors.white),
        ),
      ],
    );
  }

}
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import 'logo_component.dart';

class DesignComponent extends StatelessWidget{
  final String? text;
  final String? smallText;
  final TextStyle? textStyle;


  const DesignComponent({super.key,
    this.text,
    this.smallText,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
     height:screenSize .height * 0.30,
     color: Theme.of(context).primaryColor,
     child:  Stack(
       children: [
         const Padding(
           padding: EdgeInsets.all(10.0),
           child: Align(
             alignment: Alignment.topLeft,
             child:  LogoComponentWhite(),
           ),
         ),
         Align(
           alignment: Alignment.centerRight,
           child: Image(
             image: const AssetImage('images/img_1.png',),
             fit: BoxFit.fill,
             width: screenSize .width * 0.6,
             height: screenSize .height * 75,
           ),
         ),
         Align(
             alignment: Alignment.bottomLeft,
             child: Padding(
               padding:  const EdgeInsets.all(10.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   TextLabelComponent(text: text,
                     textStyle: textStyle,
                   ),
                   TextComponent(text: smallText, textStyle: Theme.of(context).textTheme.displaySmall,),
                 ],
               ),
             )),
       ],
     ),
   );

  }

}
class DesignComponent2 extends StatelessWidget{
  final String? text;
  final String? smallText;
  final Function()? onPressed;

  const DesignComponent2({super.key,
    this.text,
    this.smallText,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      height:screenSize .height * 0.30,
      color: Theme.of(context).primaryColor,
      child:  Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.close),
                  color: Colors.white,)),
          ),

          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding:  const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextComponent(text: text,
                      textStyle: Theme.of(context).textTheme.labelLarge,),
                    TextComponent(text: smallText, textStyle: Theme.of(context).textTheme.titleSmall,),
                  ],
                ),
              )),
        ],
      ),
    );

  }

}
class DesignComponent3 extends StatelessWidget{
  final String? text;
  final String? smallText;
  final TextStyle? textStyle;
  final Function()? onPressed;


  const DesignComponent3({super.key,
    this.text,
    this.smallText,
    this.textStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
     height:screenSize .height * 0.30,
     color: Theme.of(context).primaryColor,
     child:  Stack(
       children: [
         Padding(
           padding: EdgeInsets.only(top: 10.0),
           child: Align(
             alignment: Alignment.topLeft,
             child: IconButton(
               icon: Icon(Icons.arrow_back_ios_new_sharp,size: 20,color: Colors.black,),
               onPressed: onPressed,
             ),
           ),
         ),
         Align(
           alignment: Alignment.centerRight,
           child: Image(
             image: const AssetImage('images/img_1.png',),
             fit: BoxFit.fill,
             width: screenSize .width * 0.6,
             height: screenSize .height * 75,
           ),
         ),
         Align(
             alignment: Alignment.bottomLeft,
             child: Padding(
               padding:  const EdgeInsets.all(10.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   TextLabelComponent(text: text,
                     textStyle: textStyle,
                   ),
                   TextComponent(text: smallText, textStyle: Theme.of(context).textTheme.displaySmall,),
                 ],
               ),
             )),
       ],
     ),
   );

  }

}

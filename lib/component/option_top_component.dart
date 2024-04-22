import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class OptionTopComponent extends StatelessWidget{
  final String? text;
  final Function()? onPressed;
  const OptionTopComponent({super.key,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey.shade100,
      height: screenSize.height * 0.13,
      width: double.infinity,
      child:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.02,),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  IconButton(onPressed: onPressed,
                    icon: Icon(Icons.arrow_back_ios_new),),
                  TextComponent(text: text,
                    textStyle: Theme.of(context).textTheme.titleSmall,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LinearProgressIndicator(
                color: Theme.of(context).primaryColor,
                value: 0.25,
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            )

          ],
        ),
      ),
    );
  }

}
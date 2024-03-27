import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class HomeComponent extends StatelessWidget {
  final String? valueText;
  final String? text;
  final IconData? icon;
  const HomeComponent({super.key,
    this.text,
    this.valueText,
    this.icon


  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      width: screenSize.width * 0.2,
      height: screenSize.height * 0.12,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextLabelComponent(text: valueText),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                Center(
                  child: TextComponent(
                    text: text,
                    textStyle: TextStyle(
                      color: Theme.of(context).primaryColor,fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class FieldComponent extends StatelessWidget {
  final ImageProvider? imageIcon;
  final String? text;
  final Function()? onPressed;
  const FieldComponent({super.key, this.imageIcon, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ImageIcon(imageIcon),
                TextComponent(text: text),
              ],
            ),
            IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.navigate_next_sharp)),
          ],
        ),
      ),
    );
  }
}

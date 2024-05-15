import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class PopupWidget extends StatelessWidget {
  final String? titleText;
  final String? contentText;
  final List<Widget> body;
  final TextStyle? textStyle;



  const PopupWidget({
    super.key,
    this.titleText,
    this.contentText,
    required this.body,
    this.textStyle,

  });



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      title:  TextComponent (text: titleText,textStyle: textStyle ?? Theme.of(context).textTheme.titleMedium,),
      content: TextComponent (text:contentText,textStyle: textStyle ?? Theme.of(context).textTheme.bodySmall,),
        insetPadding: const EdgeInsets.all(10),
        actions: body
    );
  }
}
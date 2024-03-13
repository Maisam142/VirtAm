import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String? text;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const TextComponent({
    super.key,
    required this.text,
     this.textStyle,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      style: textStyle ?? Theme.of(context).textTheme.bodySmall,
    );
  }
}

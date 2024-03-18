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
      style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
    );
  }
}
class TextLabelComponent extends StatelessWidget {
  final String? text;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const TextLabelComponent({
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
      style: textStyle ?? Theme.of(context).textTheme.labelLarge,
    );
  }
}
class TextLabelBigComponent extends StatelessWidget {
  final String? text;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const TextLabelBigComponent({
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
      style: textStyle ?? Theme.of(context).textTheme.displayLarge,
    );
  }
}

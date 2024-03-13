import 'package:flutter/material.dart';

import '../styles/style.dart';

class ButtonComponent extends StatelessWidget {
  final Function()? onPress;
  final String text;
  final double width;
  final Color? customColor;
  final TextStyle? textStyle;

  const ButtonComponent({super.key,
    required this.text,
    this.onPress,
    this.width = double.infinity,
    this.customColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ).merge(
          ButtonStyle(
            backgroundColor: MaterialStateProperty.all(customColor ?? ThemeApp.primaryColor),
          ),
        ),
        child: Text(
          text,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

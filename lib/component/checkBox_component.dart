import 'package:flutter/material.dart';

class CheckBoxComponent extends StatelessWidget{
  final bool? value;
  final Function(bool? value)? onChanged;
  final String text;
  const CheckBoxComponent({super.key,
    this.value ,
    this.onChanged,
    required this.text,
});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          key: key,
          //tristate: true,
          checkColor: Colors.white,
            value: value,
            onChanged: onChanged,
        ),
        Text(text,
        style: Theme.of(context).textTheme.labelMedium,),
              ],
    );

  }}


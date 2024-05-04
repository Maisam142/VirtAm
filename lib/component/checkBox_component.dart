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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Checkbox(
            key: key,
            hoverColor: Colors.black,
            fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Theme.of(context).primaryColor;
                }
                return Colors.transparent;
              },
            ),
            //tristate: true,
            checkColor: Colors.white,
              value: value,
              onChanged: onChanged,
          ),
          Text(text,
          style: Theme.of(context).textTheme.labelMedium),
                ],
      ),
    );

  }}


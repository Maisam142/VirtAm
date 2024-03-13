import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/option1_3_screen/option1_3_view_model.dart';

class ChoiceComponent extends StatelessWidget {
  final List<String> choiceText;
  final int? selectedValue;
  final Function(int?)? onValueChanged;
  final String text;
  final String choiceKey;



  const ChoiceComponent({
    Key? key,
    required this.choiceKey,
    required this.choiceText,
    required this.selectedValue,
    required this.onValueChanged,
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<Option13ViewModel>(context);


    return  Wrap(
      spacing: 5.0,
      children: List<Widget>.generate(
        choiceText.length,
            (int index) {
          return ChoiceChip(

            label: Text(choiceText[index],
            style: Theme.of(context).textTheme.bodyMedium),
            selected: vm.choiceValues[choiceKey] == index,
            onSelected: (bool selected) {
              if (selected) {
                vm.setChoiceValue(choiceKey, index);
              }
            },
          );
        },
      ).toList(),
    );
  }
}

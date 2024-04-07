import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class BackComponent extends StatelessWidget{
  final String? text;
  final Function()? onPressed;
  const BackComponent({super.key,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: 60,
      //width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                IconButton(onPressed: onPressed,
                  icon: const Icon(Icons.arrow_back_ios_new),),
                TextComponent(text: text,
                  textStyle: Theme.of(context).textTheme.bodyMedium,),
              ],
            ),
          ),

        ],
      ),
    );
  }

}
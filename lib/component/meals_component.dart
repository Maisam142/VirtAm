import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';

class MealsComponent extends StatelessWidget {
  final String? mealTypeText;
  final ImageProvider? mealTypeImage;
  final String? text;
  final ImageProvider? image;
  final Function()? onPressedIcon;
  const MealsComponent({super.key, this.mealTypeText, this.text, this.image, this.mealTypeImage, this.onPressedIcon});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 95,
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          width: 55,
                          height: 55,
                          child: Image(image: mealTypeImage!,fit: BoxFit.cover,)),
                    ),
                    Column(
                      children: [
                        TextComponent(text: mealTypeText,textStyle: Theme.of(context).textTheme.labelLarge,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(text!, style: TextStyle(fontSize: 12,color: Theme.of(context).hoverColor),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(onPressed:
                  onPressedIcon,
                  icon: Icon(Icons.add_box,size: 30,color:  Theme.of(context).dialogBackgroundColor),),

              ],
            ),
          )
        ],
      ),
    );
  }
}

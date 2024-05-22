import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';
import '../../../component/back_component.dart';
import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';

class MealsImagesToAdminScreen extends StatelessWidget {
  final Map<String, dynamic> memberData;

  const MealsImagesToAdminScreen({super.key, required this.memberData});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fatsControllerBre = TextEditingController();
    final TextEditingController carbControllerBre = TextEditingController();
    final TextEditingController proControllerBre = TextEditingController();
    final TextEditingController fatsControllerLun = TextEditingController();
    final TextEditingController carbControllerLun = TextEditingController();
    final TextEditingController proControllerLun = TextEditingController();
    final TextEditingController fatsControllerDinn = TextEditingController();
    final TextEditingController carbControllerDinn = TextEditingController();
    final TextEditingController proControllerDinn = TextEditingController();
    final TextEditingController fatsControllerSna = TextEditingController();
    final TextEditingController carbControllerSna = TextEditingController();
    final TextEditingController proControllerSna = TextEditingController();
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          return false;
        },
        child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
              children: [
                BackComponent(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Column(
                  children: [
                    buildMealSection(context, 'Breakfast', memberData['breakfast'],fatsControllerBre,carbControllerBre,proControllerBre,
                      memberData['breakfastFats']??'',memberData['breakfastPro']??'',memberData['breakfastCarb']??'',),
                    buildMealSection(context, 'Lunch', memberData['lunch'],fatsControllerLun,carbControllerLun,proControllerLun,
                      memberData['lunchFats']??'',memberData['lunchPro']??'',memberData['lunchCarb']??'',),
                    buildMealSection(context, 'Dinner', memberData['dinner'],fatsControllerDinn,carbControllerDinn,proControllerDinn,
                      memberData['dinnerFats']??'',memberData['dinnerPro']??'',memberData['dinnerCarb']??'',),
                    buildMealSection(context, 'Snack', memberData['snack'],fatsControllerSna,carbControllerSna,proControllerSna,
                      memberData['snackFats']??'',memberData['snackPro']??'',memberData['snackCarb']??'',),
                  ],
                ),
              ],
            ),
          ),
        ),
        ),
    );
  }

  Widget buildMealSection(
      BuildContext context, String mealName, String? imageUrl,controllerFat,controllerPro,controllerCar,imageFats,imagePro,imageCarb) {
    return Card(
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextLabelComponent(text: mealName),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: imageUrl != null && imageUrl.isNotEmpty
                ? Image.network(imageUrl)
                : const Image(image: AssetImage('images/check.png')),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: imageUrl != null && imageUrl.isNotEmpty
            ? Row(
              children: [
                Expanded(
                  child: FormComponent(
                    controller: controllerPro,
                    hintText: '${S.of(context).proteina}:',
                    textInputType: TextInputType.number,

                  ),
                ),
                Expanded(
                  child: FormComponent(
                    controller: controllerCar,
                    hintText: '${S.of(context).carbohydrates}:',
                    textInputType: TextInputType.number,

                  ),
                ),
                Expanded(
                  child: FormComponent(
                    controller: controllerFat,
                    hintText: '${S.of(context).fast}:',
                    textInputType: TextInputType.number,
                  ),
                ),
              ],
            ):
                Text('Fats : $imageFats || Protein : $imagePro || Carb : $imageCarb ' )
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ButtonComponentContinue(
            text: S.of(context).done,
            onPress: () async {
              String fatsValue = controllerFat.text;
              String carValue = controllerCar.text;
              String proValue = controllerPro.text;
              String userEmail = memberData['email'].toLowerCase();

              Map<String, dynamic> initialData = {
                '${mealName.toLowerCase()}Fats': fatsValue,
                '${mealName.toLowerCase()}Pro': proValue,
                '${mealName.toLowerCase()}Carb': carValue,
                mealName.toLowerCase(): ''
              };
              await FirebaseFirestore.instance
                  .collection('User')
                  .doc(userEmail)
                  .update(initialData);
              if(imageUrl != null && imageUrl.isNotEmpty) {

              }
    },

          ),

          ),
          const SizedBox(height: 8),

        ],
      ),
    );
  }
}

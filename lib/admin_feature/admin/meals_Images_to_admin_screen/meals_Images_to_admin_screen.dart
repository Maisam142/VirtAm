import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    final TextEditingController breakfastController = TextEditingController();
    final TextEditingController lunchController = TextEditingController();
    final TextEditingController dinnerController = TextEditingController();
    final TextEditingController snackController = TextEditingController();
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
                    buildMealSection(context, 'Breakfast', memberData['breakfast'],breakfastController,memberData['breakfastComment']??''),
                    buildMealSection(context, 'Lunch', memberData['lunch'],lunchController,memberData['lunchComment']?? ''),
                    buildMealSection(context, 'Dinner', memberData['dinner'],dinnerController,memberData['dinnerComment']?? ''),
                    buildMealSection(context, 'Snack', memberData['snack'],snackController,memberData['snackComment']?? ''),
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
      BuildContext context, String mealName, String? imageUrl,controller,imageComment) {
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
            ?FormComponent(
              controller: controller,
              hintText: 'calories:',
            ):
                Text('$imageComment' )
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ButtonComponentContinue(
            text: S.of(context).done,
            onPress: () async {
              String calorieValue = controller.text;
              String userEmail = memberData['email'].toLowerCase();

              Map<String, dynamic> initialData = {
                '${mealName.toLowerCase()}Comment': calorieValue,
                mealName.toLowerCase(): ''
              };
              await FirebaseFirestore.instance
                  .collection('User')
                  .doc(userEmail)
                  .update(initialData);
            },

          ),),
          const SizedBox(height: 8),

        ],
      ),
    );
  }
}

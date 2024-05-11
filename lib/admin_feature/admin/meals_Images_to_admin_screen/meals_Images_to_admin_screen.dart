import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/register_screen/register_screen_view_model.dart';

import '../../../component/back_component.dart';
import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';
import 'meals_iamges_to_admin_view_model.dart';

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
                    buildMealSection(
                        context, 'Breakfast', memberData['breakfast'],breakfastController),
                    buildMealSection(context, 'Lunch', memberData['lunch'],lunchController),
                    buildMealSection(context, 'Dinner', memberData['dinner'],dinnerController),
                    buildMealSection(context, 'Snack', memberData['snack'],snackController),
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
      BuildContext context, String mealName, String? imageUrl,controller) {
    return Card(
      color: Theme.of(context).secondaryHeaderColor,
      child: Column(
        children: [
          const SizedBox(height: 8),
          TextLabelComponent(text: mealName),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: imageUrl != null && imageUrl.isNotEmpty
                ? Image.network(imageUrl)
                : const Center(child: Text('Image not available')),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormComponent(
              controller: controller,
              hintText: 'calories:',
            ),
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
              };
              await FirebaseFirestore.instance
                  .collection('User')
                  .doc(userEmail)
                  .update(initialData);
            },

          ),),
        ],
      ),
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/register_screen/register_screen_view_model.dart';

import '../../../component/back_component.dart';
import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';
import 'meals_iamges_to_admin_view_model.dart';

class MealsImagesToAdminScreen extends StatelessWidget {
  final Map<String, dynamic> memberData;

  const MealsImagesToAdminScreen({Key? key, required this.memberData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        context, 'Breakfast', memberData['breakfast']),
                    buildMealSection(context, 'Lunch', memberData['lunch']),
                    buildMealSection(context, 'Dinner', memberData['dinner']),
                    buildMealSection(context, 'Snack', memberData['snack']),
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
      BuildContext context, String mealName, String? imageUrl) {
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
            child: FormComponent(),
          )
        ],
      ),
    );
  }
}

import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/form_component.dart';

import '../../../component/button_component.dart';
import '../../../generated/l10n.dart';
import '../register_screen/register_screen_view_model.dart';
import 'drink_water_view_model.dart';

class AddTargetScreen extends StatelessWidget {
  const AddTargetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(registerViewModel.emailController.text.toLowerCase())
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData && snapshot.data!.exists) {
            final data = snapshot.data?.data();
            final waterTarget = data!['waterTarget'];

            return AddTargetScreenContent(waterTarget: waterTarget.toString(),);
          }
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
        },
      ),

    );
  }
}

class AddTargetScreenContent extends StatelessWidget {
  const AddTargetScreenContent({super.key, required this.waterTarget});
  final String waterTarget;

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
        Provider.of<RegisterViewModel>(context);
    final DrinkWaterViewModel viewModel =
        Provider.of<DrinkWaterViewModel>(context);
    return WillPopScope(
        onWillPop: () async {
          Beamer.of(context).beamToNamed('/drinkWaterScreen');
          return false;
        },
        child: SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  DesignComponent2(
                    text: waterTarget,
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    smallText: S.of(context).customGoal,
                    smalltextStyle: Theme.of(context).textTheme.displayMedium,
                    onPressed: () {
                      Beamer.of(context).beamBack();
                    },
                  ),
                  Container(
                    child: FormComponent(
                      controller: viewModel.targetController,
                      textInputType: TextInputType.number,
                      hintText: S.of(context).target,
                      onTap: (){
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ButtonComponentContinue(
                      text: S.of(context).done,
                      onPress: () async {
                        Map<String, dynamic> additionalData = {
                          'waterTarget': viewModel.targetController.text,
                        };
                        await FirebaseFirestore.instance
                            .collection('User')
                            .doc(registerViewModel.emailController.text
                                .toLowerCase())
                            .update(additionalData);
                        Beamer.of(context).beamBack();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

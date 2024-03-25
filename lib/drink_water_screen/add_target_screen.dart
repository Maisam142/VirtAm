import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/drink_water_screen/drink_water_view_model.dart';
import 'package:virtam/register_screen/register_screen_view_model.dart';
import '../component/button_component.dart';
import '../component/text_component.dart';

class AddTargetScreen extends StatelessWidget {
  const AddTargetScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final DrinkWaterViewModel viewModel =
    Provider.of<DrinkWaterViewModel>(context);
    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/drinkWaterScreen');
      return false;
    },
    child:SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              DesignComponent2(
                text: '8993 ml ',
                smallText: 'custom water goal' ,
                onPressed: (){
                  Beamer.of(context).beamBack();
                },
              ),
              Container(
                child: FormComponent(
                  controller: viewModel.targetController,
                  textInputType: TextInputType.number,
                  hintText: 'The Target ',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ButtonComponentContinue(
                  text: 'Done',
                  onPress: (){
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

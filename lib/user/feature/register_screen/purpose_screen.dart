import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/design_component.dart';
import 'package:virtam/user/feature/register_screen/register_screen_view_model.dart';

import '../../../component/back_component.dart';
import '../../../component/button_component.dart';
import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';




class PurposeScreen extends StatelessWidget {
  const PurposeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final RegisterViewModel userDataModel =
    Provider.of<RegisterViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
               DesignComponent2(
                smallText: S.of(context).purpose,
                onPressed: (){
                  Beamer.of(context).beamBack();
                },
                             ),
              Container(
                width: double.infinity,
                height: 300,
                child: Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,),
                        child: Container(
                          color: Theme.of(context).secondaryHeaderColor,
                          child: RadioListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextComponent(text:S.of(context).purpose1,textStyle: Theme.of(context).textTheme.titleMedium,),
                              ],
                            ),
                            value: 1,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption(value);
                                userDataModel.updateSelectedPurpose('Follow my personal data.');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,),
                        child: Container(
                          color: Theme.of(context).secondaryHeaderColor,
                          child: RadioListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                TextComponent(text:S.of(context).purpose2,textStyle: Theme.of(context).textTheme.titleMedium,),
                              ],
                            ),
                            value: 2,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption(value);
                                userDataModel.updateSelectedPurpose('Follow up with my nutrition counselor.');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          color: Theme.of(context).secondaryHeaderColor,
                          child: RadioListTile(
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                TextComponent(text:S.of(context).purpose3,textStyle: Theme.of(context).textTheme.titleMedium,),
                              ],
                            ),
                            value: 3,
                            onChanged: (int? value) {
                              if (value != null) {
                                userDataModel.updateSelectedOption(value);
                                userDataModel.updateSelectedPurpose('Find a nutrition counselor in my area');
                              }
                            },
                            activeColor: Theme.of(context).primaryColor,
                            groupValue: userDataModel.selectedOption,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ButtonComponentContinue(
                  text: S.of(context).done,
                  onPress: (){
                    Beamer.of(context).beamBack();

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

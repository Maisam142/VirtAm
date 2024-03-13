import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/design_component.dart';
import '../component/button_component.dart';
import '../user_data_screen/user_data_view_model.dart';

class PurposeScreen extends StatelessWidget {
  const PurposeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final UserDataViewModel userDataModel =
    Provider.of<UserDataViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
               DesignComponent2(
                smallText: 'The purpose of creating the account? ',
                onPressed: (){
                  Beamer.of(context).beamBack();
                },
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Column(
                  children: [
                    RadioListTile(
                      title: Text('Follow my personal data.'),
                      value: 1,
                      onChanged: (int? value) {
                        if (value != null) {
                          userDataModel.updateSelectedOption(value);
                          userDataModel.updateSelectedPurpose('Follow my personal data.');

                        }
                      },
                      activeColor: Theme.of(context).primaryColor,
                      groupValue: userDataModel.selectedOption,

                    ),
                    RadioListTile(
                      title: Text('Follow up with my nutrition counselor.'),
                      value: 2,
                      onChanged: (int? value) {
                        if (value != null) {
                          userDataModel.updateSelectedOption(value);
                          userDataModel.updateSelectedPurpose('Follow up with my nutrition counselor.');

                        }
                      },
                      activeColor: Theme.of(context).primaryColor,
                      groupValue: userDataModel.selectedOption,
                    ),

                    RadioListTile(
                      title: Text('Find a nutrition counselor in my area'),
                      value: 3,
                      onChanged: (int? value) {
                        if (value != null) {
                          userDataModel.updateSelectedOption(value);
                          userDataModel.updateSelectedPurpose('Find a nutrition counselor in my area');

                        }
                      },
                      activeColor: Theme.of(context).primaryColor,
                      groupValue: userDataModel.selectedOption,

                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ButtonComponent(
                  text: 'Done',
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  customColor: Colors.black,
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

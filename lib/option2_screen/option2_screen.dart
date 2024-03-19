import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/register_screen/register_screen_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step10_screen/user_data_step10_view_model.dart';
import 'package:virtam/step1-10_screens/user_data_step9_screen/user_data_step9_view_model.dart';
import '../../component/button_component.dart';
import '../../component/option_top_component.dart';
import 'option2_view_model.dart';
class Option2Screen extends StatelessWidget {
  const Option2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final Option2UserModel userDataModel =
    Provider.of<Option2UserModel>(context);
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).focusColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
               OptionTopComponent(
                text: 'Complete Login',
                onPressed: () {
                  Beamer.of(context).beamBack();
                },
              ),
              SizedBox(
                width: double.infinity,
                height: screenSize.height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: TextComponent(
                                  text: 'Name of the nutrition consultant \nyou follow up with?',
                                  textStyle:
                                  Theme.of(context).textTheme.labelMedium,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Image(
                                image: AssetImage('images/worker.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02 ,),
                    Container(
                        color: Colors.white,
                        child:  FormComponent(
                          hintText: 'nutrition consultant name',
                          controller: userDataModel.companyNameController,
                        ),),

                    SizedBox(height: screenSize.height * 0.1 ,),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonComponentContinue(
                          text: 'Continue',
                          onPress: () async {
                            Map<String, dynamic> additionalData = {
                              'Company name ' : userDataModel.companyNameController.text,
                            };
                            await FirebaseFirestore.instance
                                .collection('User')
                                .doc(registerViewModel.nameController.text)
                                .update(additionalData);
                            Beamer.of(context).beamToNamed('/userDataStep9');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

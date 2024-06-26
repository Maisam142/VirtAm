import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/back_component.dart';
import '../../../component/button_component.dart';
import '../../../component/option_top_component.dart';
import '../../../generated/l10n.dart';


import '../register_screen/register_screen_view_model.dart';
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
        //backgroundColor: Theme.of(context).focusColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
               OptionTopComponent(
                text: S.of(context).completeLogin,
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
                        color: Theme.of(context).secondaryHeaderColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextComponent(
                                    text: S.of(context).nutritionName,
                                    textStyle:
                                    Theme.of(context).textTheme.labelMedium,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
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
                    FormComponent(
                      hintText: S.of(context).consultantName,
                      controller: userDataModel.companyNameController,
                    ),

                    SizedBox(height: screenSize.height * 0.1 ,),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonComponentContinue(
                          text: S.of(context).next,
                          onPress: () async {
                            Map<String, dynamic> additionalData = {
                              'Company name ' : userDataModel.companyNameController.text,
                            };
                            await FirebaseFirestore.instance
                                .collection('User')
                                .doc(registerViewModel.emailController.text.toLowerCase())
                                .update(additionalData);
                            Beamer.of(context).beamToNamed('/fastTimeScreen');
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

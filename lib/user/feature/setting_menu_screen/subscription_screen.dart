import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/setting_menu_screen/setting_menu_view_model.dart';

import '../../../component/back_component.dart';
import '../../../component/popup_component.dart';
import '../../../generated/l10n.dart';
import '../register_screen/register_screen_view_model.dart';


class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    final SettingMenuViewModel userDataModel =
    Provider.of<SettingMenuViewModel>(context);

    return WillPopScope(
        onWillPop: () async {
          Beamer.of(context).beamToNamed('/settingMenuScreen');
          return false;
        },
        child:SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    BackComponent(
                      text: '',
                      onPressed: (){
                        Beamer.of(context).beamBack();

                      },
                    ),
                    const SizedBox(height: 40,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextLabelBigComponent(text: S.of(context).subscription),),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('  Lorem ipsum dolor sit amet consectetur. ',style: TextStyle(fontSize: 15),),),
                          SizedBox(height: screenSize.height * 0.02,),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('  Lorem ipsum dolor sit amet consectetur.\n   Gravida purus pellentesque . ',
                              style: TextStyle(fontSize: 15),),),
                          SizedBox(height: screenSize.height * 0.02,),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('  Gravida purus pellentesque egestas auctor urna\n   vel sit. ',
                              style: TextStyle(fontSize: 15),),),

                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),

                    Container(
                      color: Theme.of(context).secondaryHeaderColor,
                      height: screenSize.height * 0.1,
                      child: RadioListTile(
                        title: Row(
                          children: [
                            SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft ,
                                      child: TextComponent(text: S.of(context).month5,
                                        textStyle: TextStyle(color: Theme.of(context).primaryColor,
                                            fontSize: 25,fontWeight: FontWeight.bold),),
                                    ),
                                    TextComponent(text: S.of(context).free,
                                      textStyle: TextStyle(color: Theme.of(context).hoverColor,fontSize: 10),),
                                  ],
                                )
                            )],
                        ),
                        value: 1,
                        onChanged: (int? value) {
                          if (value != null) {
                            userDataModel.updateSelectedOption(value);
                            userDataModel.updateSelectedPurpose('5 JOD / Month');
                          }
                        },
                        activeColor: Theme.of(context).primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                        groupValue: userDataModel.selectedOption,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.01,),
                    Container(
                      color: Theme.of(context).secondaryHeaderColor,
                      height: screenSize.height * 0.1,
                      child: RadioListTile(
                        title: Row(
                          children: [
                            SizedBox(
                                height: 200,
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft ,
                                      child: TextComponent(text: S.of(context).year5,
                                        textStyle: TextStyle(color: Theme.of(context).primaryColor,
                                            fontSize: 25,fontWeight: FontWeight.bold),),
                                    ),
                                    TextComponent(text: S.of(context).free,
                                      textStyle:  TextStyle(color: Theme.of(context).hoverColor,fontSize: 10),),
                                  ],
                                )
                            )],
                        ),
                        value: 2,
                        onChanged: (int? value) {
                          if (value != null) {
                            userDataModel.updateSelectedOption(value);
                            userDataModel.updateSelectedPurpose('50 JOD / Year');
                          }
                        },
                        activeColor: Theme.of(context).primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                        groupValue: userDataModel.selectedOption,

                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.06,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ButtonComponentContinue(text: S.of(context).subscription,
                        onPress: ()async {
                          Map<String, dynamic> additionalData = {
                            'subscription': userDataModel.selectedPurpose,

                          };
                          await FirebaseFirestore.instance
                              .collection('User')
                              .doc(registerViewModel.emailController.text.toLowerCase())
                              .update(additionalData);

                          showDialog(
                            context: context,
                            builder: (context) => PopupWidget(
                              titleText: S.of(context).done,
                              contentText: userDataModel.selectedPurpose ,
                              body: [],
                            ),
                          );
                        },


                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}

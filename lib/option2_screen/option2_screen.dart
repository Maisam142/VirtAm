import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/form_component.dart';

import '../component/button_component.dart';
import '../user_data_screen/user_data_view_model.dart';
import 'option2_view_model.dart';

class Option2Screen extends StatelessWidget {
  const Option2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final UserDataViewModel userDataModel =
    Provider.of<UserDataViewModel>(context);
    final Option2UserModel vmProvider =
    Provider.of<Option2UserModel>(context);

    return  SafeArea(
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text('Company Info',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                    Padding(
                      padding: const EdgeInsets.only(top: 150,bottom: 150),

                      child: Column(
                        children: [ FormComponent(
                          width: 200,
                          controller: vmProvider.companyNameController ,
                          hintText: 'Company Name',
                        ),
                          const SizedBox(height: 15,),
                          FormComponent(
                            width: 200,
                            controller: vmProvider.companyUsernameController ,
                            hintText: 'Company UserName',
                          ),],
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: ButtonComponent(
                            customColor: const Color(0xffBE543D),
                            width: 150,
                            text: 'Next',
                            onPress: () async {
                              Map<String, dynamic> additionalData = {
                                'companyName' : vmProvider.companyNameController.text,
                                'companyUserName' : vmProvider.companyUsernameController.text,
                              };
                              await FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(userDataModel.nameController.text)
                                  .update(additionalData);
                            }
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

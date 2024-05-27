import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:virtam/admin_feature/master_admin/admin_members_tomasterAdmin_screen/admin_members_view_model.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/button_component.dart';

import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';

class AddAdminScreen extends StatelessWidget {
  const AddAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final AdminMembersToMasterViewModel viewModel = Provider.of<AdminMembersToMasterViewModel>(context);

    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/adminMembersToMasterScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                BackComponent(
                  onPressed: () {
                    Beamer.of(context).beamToNamed('/adminMembersToMasterScreen');
                  },
                  text: S.of(context).addNewAdmin,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(S.of(context).adminInclude),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Image(image: AssetImage('images/yesNo.png')),
                      FormComponent(
                        hintText: S.of(context).adminName,
                        controller: viewModel.nameController,
                        errorText: viewModel.isNameValid ? null : S.of(context).adminName,
                      ),
                      FormComponent(
                        hintText: S.of(context).email,
                        controller: viewModel.emailController,
                        errorText: viewModel.isEmailValid ? null : S.of(context).enterValidEmail,
                      ),
                      const SizedBox(height: 5),
                      FormComponent(
                        controller: viewModel.passwordController,
                        hintText: S.of(context).password,
                        obscureText: viewModel.isObscure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            viewModel.visibilityPass();
                          },
                          icon: Icon(
                            viewModel.isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      FormComponent(
                        textInputType: TextInputType.text,
                        controller: viewModel.rePasswordController,
                        hintText: S.of(context).rePassword,
                        obscureText: viewModel.isObscureRewrite,
                        suffixIcon: IconButton(
                          onPressed: () {
                            viewModel.visibilityRewritePass();
                          },
                          icon: Icon(
                            viewModel.isObscureRewrite ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                        errorText: viewModel.isValidRewritePass ? null : S.of(context).notMatch,
                      ),
                      InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber phoneNumber) {
                          final isValid = phoneNumber.phoneNumber!.length >= 8;
                          viewModel.updatePhoneNumberValidity(isValid);
                          if (phoneNumber.phoneNumber != null) {
                            viewModel.updatePhoneNumber(phoneNumber.phoneNumber!);
                            viewModel.updateCountry(phoneNumber.isoCode!);
                          }
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        selectorTextStyle: Theme.of(context).textTheme.labelMedium,
                        textStyle: Theme.of(context).textTheme.labelMedium,
                        initialValue: PhoneNumber(isoCode: viewModel.selectedCountry),
                        textFieldController: TextEditingController(),
                        hintText: S.of(context).phoneNumber,
                        inputDecoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.labelMedium,
                          hintText: S.of(context).phoneNumber,
                        ),
                        errorMessage: viewModel.isValidPhoneNumber && viewModel.isPhoneNumberValid
                            ? null
                            : S.of(context).phoneMust,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              color: Theme.of(context).secondaryHeaderColor,
                              height: 200,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 20),
                            ButtonComponentContinue(
                              text: S.of(context).add,
                              onPress: () async {
                                try {
                                  UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                                    email: viewModel.emailController.text,
                                    password: viewModel.passwordController.text,
                                  );
                                  User? user = userCredential.user;

                                  if (user != null) {
                                    await FirebaseFirestore.instance
                                        .collection('admin')
                                        .doc(viewModel.emailController.text)
                                        .set({
                                      'name': viewModel.nameController.text,
                                      'email': viewModel.emailController.text,
                                      'password': viewModel.passwordController.text,
                                      'number': viewModel.phoneNumber,
                                    });

                                    print('New admin created: ${user.uid}');
                                  }
                                } catch (e) {
                                  print('Failed to create new admin: $e');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Error: $e')),
                                  );
                                }
                                Beamer.of(context).beamToNamed('/adminMembersToMasterScreen');
                                viewModel.nameController.text = '';
                                viewModel.emailController.text = '';
                                viewModel.passwordController.text = '';
                                viewModel.rePasswordController.text = '';
                                viewModel.phoneNumber = '';
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

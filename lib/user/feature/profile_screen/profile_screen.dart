import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/user/feature/profile_screen/profile_view_model.dart';

import '../../../component/back_component.dart';
import '../../../component/design_component.dart';
import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';


import '../../../helper/profile_class.dart';
import '../register_screen/register_screen_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: ProfileScreenContent(),
    );
  }
}

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    final Size screenSize = MediaQuery.of(context).size;

    final profileProvider = Provider.of<ProfileViewModel>(context);

    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/profileScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('User')
                .doc(registerViewModel.emailController.text.toLowerCase())
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');
              if (snapshot.hasData && snapshot.data!.exists) {
                final data = snapshot.data!.data();

                final originalName = data?['name'];
                final originalEmail = data?['email'];
                final originalNumber = data?['number'];
                final imageUrl = data?['imageLink'];
                final wakeupTime = data?['wakeup time'];

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Stack(
                          children: [
                            const DesignComponent(),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                child: imageUrl != null
                                    ? CircleAvatar(
                                  backgroundImage: NetworkImage(imageUrl),
                                  radius: 68,
                                )
                                    : const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png',
                                  ),
                                  radius: 68,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextComponent(
                              text: S.of(context).changePic,
                            ),
                            const ImageIcon(AssetImage('images/edit.png')),
                          ],
                        ),
                        onPressed: () {
                          profileProvider.pickImage(context);
                        },
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      FormComponent(
                        hintText: S.of(context).fullName +   '  $originalName',
                        controller: registerViewModel.nameController,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      FormComponent(
                        hintText: S.of(context).email  +  '  $originalEmail',
                        controller: registerViewModel.emailController,
                        // Disable email field
                        enabled: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber phoneNumber) {},
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          ignoreBlank: false,
                          autoValidateMode:
                          AutovalidateMode.onUserInteraction,
                          selectorTextStyle:
                          const TextStyle(color: Colors.black),
                          textStyle: const TextStyle(color: Colors.black),
                          initialValue: PhoneNumber(
                              isoCode:
                              registerViewModel.selectedCountry),
                          textFieldController: TextEditingController(),
                          hintText: '  $originalNumber',
                          // Disable phone number field
                          isEnabled: false,
                        ),
                      ),
                      FormComponent(
                        hintText: S.of(context).password  + '. . . . . . . . . ',
                        obscureText: registerViewModel.isObscure,
                        controller: registerViewModel.passwordController,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonComponentContinue(
                          text: S.of(context).update,
                          onPress: () async {
                            String imageUrl = '';
                            if (profileProvider.selectedImage != null) {
                              imageUrl = await StoreDate()
                                  .uploadImageToStorage(
                                registerViewModel.nameController.text,
                                profileProvider.selectedImage!,
                                context,
                              );
                            }

                            Map<String, dynamic> updatedData = {};

                            if (registerViewModel.nameController.text !=
                                originalName) {
                              updatedData['name'] =
                                  registerViewModel.nameController.text;
                            }


                            if (registerViewModel.passwordController.text
                                .isNotEmpty) {
                              updatedData['password'] =
                                  registerViewModel.passwordController.text;
                            }

                            if (imageUrl.isNotEmpty) {
                              updatedData['imageLink'] = imageUrl;
                            }

                            await FirebaseFirestore.instance
                                .collection('User')
                                .doc(registerViewModel.emailController.text)
                                .update(updatedData);
                            print(profileProvider.selectedImage);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content:
                                  Text(S.of(context).updated)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

}

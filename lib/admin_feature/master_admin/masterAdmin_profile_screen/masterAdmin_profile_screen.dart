import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../component/button_component.dart';
import '../../../component/design_component.dart';
import '../../../component/form_component.dart';
import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';
import '../../../helper/profile_class.dart';
import '../../../user/feature/profile_screen/profile_view_model.dart';
import '../../../user/feature/register_screen/register_screen_view_model.dart';

class MasterAdminProfileScreen extends StatelessWidget {
  const MasterAdminProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: const MasterAdminProfileScreenContent(),
    );
  }
}

class MasterAdminProfileScreenContent extends StatelessWidget {
  const MasterAdminProfileScreenContent({Key? key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    final Size screenSize = MediaQuery.of(context).size;
    final profileProvider = Provider.of<ProfileViewModel>(context);

    String email = registerViewModel.emailController.text.toLowerCase();

    if (email.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('Email is not provided. Please log in again.'),
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/homeMasterAdminScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('masterAdmin')
                .doc(email)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');
              if (snapshot.hasData && snapshot.data!.exists) {
                final data = snapshot.data?.data();

                final originalName = data!['name'];
                final originalDescription = data['description'];
                final originalNumber = data['number'];
                final imageUrl = data['imageLink'];
                final subscription = data['subscription'];
                final locationLink = data['locationLink'];

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Stack(
                          children: [
                            DesignComponent3(
                              onPressed: () {
                                Beamer.of(context)
                                    .beamToNamed('/homeMasterAdminScreen');
                              },
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                onPressed: () {
                                  Beamer.of(context).beamToNamed(
                                      '/subscriptionToAdminScreen');
                                },
                                child: TextComponent(
                                  text: S.of(context).editSubscription,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelSmall,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white,
                                child: imageUrl != null
                                    ? CircleAvatar(
                                  backgroundImage:
                                  NetworkImage(imageUrl),
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Container(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: double.infinity,
                              height: 60,
                              child: FormComponent(
                                hintText:
                                '${S.of(context).centerName} $originalName',
                                controller: registerViewModel.nameController,
                              ),
                            ),
                            const SizedBox(height: 15,),
                            FormComponent(
                              hintText:
                              '${S.of(context).describe} $originalDescription',
                              maxLines: null, // Allow multiline input
                              controller: registerViewModel.descController,
                            ),
                            const SizedBox(height: 15,),
                            Container(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: double.infinity,
                              height: 60,
                              child: Row(
                                children: [
                                  Text(
                                    S.of(context).subscriptionPrice,
                                    style: TextStyle(
                                      color: Theme.of(context).hoverColor,
                                    ),
                                  ),
                                  TextComponent(text: subscription),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Container(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: double.infinity,
                              height: 60,
                              child: Row(
                                children: [
                                  Text(
                                    S.of(context).phoneNumber,
                                    style: TextStyle(
                                      color: Theme.of(context).hoverColor,
                                    ),
                                  ),
                                  TextComponent(text: originalNumber),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              color: Theme.of(context).secondaryHeaderColor,
                              width: double.infinity,
                              height: 60,
                              child: FormComponent(
                                hintText: '${S.of(context).locationLink} $locationLink',
                                controller: registerViewModel.locationLinkController,
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Container(
                              color: Theme.of(context).secondaryHeaderColor,
                              height: 200,
                              width: double.infinity,
                            ),
                            const SizedBox(height: 15,),
                            Container(
                              color: Theme.of(context).secondaryHeaderColor,
                              height: 200,
                              width: double.infinity,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonComponentContinue(
                          text: S.of(context).update,
                          onPress: () async {
                            String imageUrl = '';
                            if (profileProvider.selectedImage != null) {
                              imageUrl = await StoreDate().uploadImageToStorage(
                                originalName,
                                profileProvider.selectedImage!,
                                context,
                              );
                            }

                            Map<String, dynamic> updatedData = {};

                            if (registerViewModel.nameController.text.isNotEmpty) {
                              updatedData['name'] = registerViewModel.nameController.text;
                            }
                            if (registerViewModel.descController.text.isNotEmpty) {
                              updatedData['description'] = registerViewModel.descController.text;
                            }
                            if (registerViewModel.locationLinkController.text.isNotEmpty) {
                              updatedData['locationLink'] = registerViewModel.locationLinkController.text;
                            }

                            if (imageUrl.isNotEmpty) {
                              updatedData['imageLink'] = imageUrl;
                            }

                            await FirebaseFirestore.instance
                                .collection('masterAdmin')
                                .doc(registerViewModel.emailController.text.toLowerCase())
                                .update(updatedData);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(S.of(context).updated)),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 30.0,
                          right: 30.0,
                        ),
                        child: ButtonComponentContinue(
                          text: S.of(context).logOut,
                          onPress: () async {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('isLoggedIn', false);

                            registerViewModel.logOut();
                            Beamer.of(context).beamToNamed('/welcomeScreen');
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

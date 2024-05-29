import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/design_component.dart';
import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';
import '../../../user/feature/profile_screen/profile_view_model.dart';
import '../../../user/feature/register_screen/register_screen_view_model.dart';
class MasterAdminProfileScreen extends StatelessWidget {
  const MasterAdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: const MasterAdminProfileScreenContent(),
    );
  }
}

class MasterAdminProfileScreenContent extends StatelessWidget {
  const MasterAdminProfileScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel = Provider.of<RegisterViewModel>(context);
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
        final originalEmail = data['email'];
        final originalNumber = data['number'];
        final imageUrl = data['imageLink'];
        final subscription = data['subscription'];

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
                              Beamer.of(context).beamToNamed('/homeMasterAdminScreen');
                            }
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(onPressed: () {
                            Beamer.of(context).beamToNamed(
                                '/subscriptionToAdminScreen');
                          }, child: TextComponent(text: S
                              .of(context)
                              .editSubscription,
                            textStyle: Theme
                                .of(context)
                                .textTheme
                                .labelSmall,),),),
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Container(
                          color: Theme
                              .of(context)
                              .secondaryHeaderColor,
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            children: [
                              Text(S
                                  .of(context)
                                  .centerName,
                                style: TextStyle(color: Theme
                                    .of(context)
                                    .hoverColor,
                                ),),
                              TextComponent(text: originalName),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          color: Theme
                              .of(context)
                              .secondaryHeaderColor,
                          width: double.infinity,
                          height: 100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(S
                                  .of(context)
                                  .describe,
                                  style: TextStyle(color: Theme
                                      .of(context)
                                      .hoverColor,
                                  )),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                          'Text fetched from Firebase ewf ljfclihioehyiohvt etiuhetvuiqheuihqeui',
                                          maxLines: null),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          color: Theme
                              .of(context)
                              .secondaryHeaderColor,
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            children: [
                              Text('  Subscription Price:  ',
                                style: TextStyle(color: Theme
                                    .of(context)
                                    .hoverColor,
                                ),),
                              TextComponent(text: subscription),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),
                        Container(
                          color: Theme
                              .of(context)
                              .secondaryHeaderColor,
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            children: [
                              Text(S
                                  .of(context)
                                  .phoneNumber,
                                style: TextStyle(color: Theme
                                    .of(context)
                                    .hoverColor,
                                ),),
                              TextComponent(text: originalNumber),
                            ],
                          ),
                        ),
                        Container(
                          color: Theme
                              .of(context)
                              .secondaryHeaderColor,
                          width: double.infinity,
                          height: 50,
                          child: Row(
                            children: [
                              Text('  Location Link:  ',
                                style: TextStyle(color: Theme
                                    .of(context)
                                    .hoverColor,
                                ),),
                              TextComponent(text: 'adfkcklfdjslkfhahflahs;l'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15,),

                        Container(
                          color: Theme
                              .of(context)
                              .secondaryHeaderColor,
                          height: 200,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 15,),

                        Container(
                          color: Theme
                              .of(context)
                              .secondaryHeaderColor,
                          height: 200,
                          width: double.infinity,
                        ),

                      ],
                    ),
                  )
                ]
            ));
      }
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      );

    }
    )
    ),
    ),
    );
  }
}

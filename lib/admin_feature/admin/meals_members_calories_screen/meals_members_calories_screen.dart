import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../component/back_component.dart';
import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';
import '../../../user/feature/register_screen/register_screen_view_model.dart';
import '../meals_Images_to_admin_screen/meals_Images_to_admin_screen.dart';
class MealsMembersCalories extends StatelessWidget {
  const MealsMembersCalories({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('User')
            .doc(registerViewModel.emailController.text.toLowerCase())
            .snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasError) return Text('Error = ${snapshot.error}');
          if (snapshot.hasData && snapshot.data!.exists) {
            final data = snapshot.data?.data();

            final name = data?['name'];
            final email = data?['email'];

            //--------------------------------------------------------------------

            return MealsMembersCaloriesContent();
          }
          return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,));
        },
      ),

    );
  }

}

class MealsMembersCaloriesContent extends StatefulWidget {
  const MealsMembersCaloriesContent({super.key});

  @override
  State<MealsMembersCaloriesContent> createState() => _MealsMembersCaloriesContentState();
}

class _MealsMembersCaloriesContentState extends State<MealsMembersCaloriesContent> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          //Beamer.of(context).beamToNamed('/homeNavigationBar');

          return false;
        },
        child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    BackComponent(
                      onPressed: () {
                        Beamer.of(context).beamToNamed('/homeAdminScreen');
                      },
                      text: S.of(context).allMembers,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection('User').snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return  Center(child: Center(child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColor,
                                )));
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                var members = snapshot.data?.docs;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: members?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    var memberData = members![index].data() as Map<String, dynamic>;
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MealsImagesToAdminScreen(memberData: memberData),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          color: Theme.of(context).secondaryHeaderColor,
                                          height: 80,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(width: 5,),
                                                  CircleAvatar(
                                                    radius: 21,
                                                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                                                    child: memberData['imageUrl'] != null
                                                        ? CircleAvatar(
                                                      backgroundImage: NetworkImage(memberData['imageUrl']),
                                                      radius: 20,
                                                    )
                                                        : const CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                        'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png',
                                                      ),
                                                      radius: 20,
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      TextComponent(text: memberData['name']),
                                                      TextComponent(text: S.of(context).admins,textStyle: TextStyle(fontSize: 12,color: Theme.of(context).hoverColor),),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                onPressed: (){},
                                                icon: Icon(Icons.navigate_next_rounded,color: Theme.of(context).hoverColor,),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ));
  }
}

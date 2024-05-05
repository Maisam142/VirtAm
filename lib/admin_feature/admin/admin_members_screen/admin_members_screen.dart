import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/back_component.dart';
import '../../../generated/l10n.dart';
import 'admin_members_details_screen.dart';

class AdminMembersScreen extends StatelessWidget {
  const AdminMembersScreen();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/homeAdminScreen');
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
                            return const Center(child: CircularProgressIndicator());
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
                                        builder: (context) => AdminUserDetailsScreen(memberData: memberData),
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
        ),
      ),
    );
  }
}


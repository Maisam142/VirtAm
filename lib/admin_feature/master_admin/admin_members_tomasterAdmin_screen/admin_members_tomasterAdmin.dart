import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/back_component.dart';
import 'admin_members_tomasterAdmin_details.dart';

class AdminMembersToMasterScreen extends StatelessWidget {
  const AdminMembersToMasterScreen();

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
                  text: 'All Members',
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('Admin').snapshots(),
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
                                        builder: (context) => AdminUserToMasterDetailsScreen(memberData: memberData),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      color: Colors.white,
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor: Colors.white,
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
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  TextComponent(text: memberData['name']),
                                                  const TextComponent(text: 'Admin',textStyle: TextStyle(fontSize: 12,color: Colors.grey),),

                                                ],
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: (){},
                                            icon: const Icon(Icons.navigate_next_rounded,color: Colors.grey,),
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


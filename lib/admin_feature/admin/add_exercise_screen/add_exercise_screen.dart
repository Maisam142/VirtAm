import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  String? selectedUser;
  List<String> users = [];
  Future<void> fetchUsers() async {
    final snapshot = await FirebaseFirestore.instance.collection('User').get();
    setState(() {
      users = snapshot.docs.map((doc) => doc['name'].toString()).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/homeAdminScreen');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          //backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                BackComponent(
                  text: S.of(context).addExercise,
                  onPressed: (){
                    Beamer.of(context).beamBack();
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextComponent(text: S.of(context).sendExercise,
                            ),
                        ],
                      ),
                      const Image(image: AssetImage('images/add_exercise.png'),),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            FormComponent(
                              hintText: S.of(context).exerciseName,
                            ),
                            DropdownButtonFormField<String>(
                              hint: Text(S.of(context).selectMembers),
                              value: selectedUser,
                              dropdownColor: Theme.of(context).secondaryHeaderColor,

                              items: users.map((String user) {
                                return DropdownMenuItem<String>(
                                  value: user,
                                  child: Text(user),

                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  selectedUser = newValue;
                                });
                              },
                            ),

                          ],
                        ),
                      ),
                      Container(
                        color: Theme.of(context).secondaryHeaderColor,
                        height: 200,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 20,),
                       ButtonComponentContinue(text: S.of(context).add)
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

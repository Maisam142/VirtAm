import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/text_component.dart';

import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';

class AddDailyMealsScreen extends StatefulWidget {
  const AddDailyMealsScreen({super.key});

  @override
  State<AddDailyMealsScreen> createState() => _AddDailyMealsScreenState();
}

class _AddDailyMealsScreenState extends State<AddDailyMealsScreen> {
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
        body: SingleChildScrollView(
        child: Column(children: [
          BackComponent(
            onPressed: (){
              Beamer.of(context).beamToNamed('/homeAdminScreen');
            },
            text: S.of(context).addDailyMeal,
          ),
          Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 50,
                color: Theme.of(context).secondaryHeaderColor,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(child: TextComponent(text: S.of(context).addDailyMealForMembers,)),
                  ],
                ),
              ),
              const Image(image: AssetImage('images/meals.png'),),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      FormComponent(
                      hintText: S.of(context).mealName,
                      ),
                      FormComponent(
                        hintText: S.of(context).addFirstType,
                      ),
                      FormComponent(
                        hintText: S.of(context).describeFirstType,),
                      Container(
                        height: 200,
                        width: double.infinity,
                        color: Theme.of(context).secondaryHeaderColor,
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
                      ElevatedButton(

                        onPressed: (){},
                          child: Row(

                            children: [
                              SizedBox(width: 5,),
                              Icon(Icons.add_box, color:   Theme.of(context).dialogBackgroundColor, size: 25,),
                              TextComponent(text: S.of(context).addSecondType),
                            ],
                          ),),

                    ],
                  ),
                ),
              ),

            ],
          )
          ]),
    ),
        ),
        ),
    );
  }
}

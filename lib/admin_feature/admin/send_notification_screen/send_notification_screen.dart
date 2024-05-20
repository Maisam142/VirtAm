import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/component/button_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';

class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({super.key});

  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  final TextEditingController _messageController = TextEditingController();
  String? _selectedUser;
  List<String> _users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final snapshot = await FirebaseFirestore.instance.collection('User').get();
    setState(() {
      _users = snapshot.docs.map((doc) => doc['name'].toString()).toList();
    });
  }

  void _sendNotification() async {
    if (_selectedUser == null || _messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).fillAllFields)),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('https://your-backend.com/send-notification'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'users': [_selectedUser],
        'message': _messageController.text,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).notificationSent)),
      );
      _messageController.clear();
      setState(() {
        _selectedUser = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).notificationFailed)),
      );
    }
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
            child: Column(
              children: [
                BackComponent(
                  text: S.of(context).sendNotification,
                  onPressed: () {
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
                          TextComponent(
                            text: S.of(context).centerSendNotification,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Image(
                        image: AssetImage('images/notification_send.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            FormComponent(
                              hintText: S.of(context).notificationText,
                              controller: _messageController,
                            ),
                            DropdownButtonFormField<String>(
                              hint: Text(S.of(context).selectMembers),
                              value: _selectedUser,
                              dropdownColor: Theme.of(context).secondaryHeaderColor,

                              items: _users.map((String user) {
                                return DropdownMenuItem<String>(
                                  value: user,
                                  child: Text(user),

                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedUser = newValue;
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
                      SizedBox(height: 20),
                      ButtonComponentContinue(
                        text: S.of(context).send,
                        onPress: _sendNotification,
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

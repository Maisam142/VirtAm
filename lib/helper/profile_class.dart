import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../feature/register_screen/register_screen_view_model.dart';


class StoreDate {
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, BuildContext context) async {
    final registerInfo = Provider.of<RegisterViewModel>(context, listen: false);
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('images/${registerInfo.emailController.text}/$childName');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
    }
}
class UserModel {
  final String username;
  final String email;
  final String password;
  final String phone;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}

import 'dart:async';
import 'package:beamer/beamer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtam/user/feature/register_screen/register_screen_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> {
  bool isTrue = false;
  String email = '';

  @override
  void initState() {
    super.initState();
    initializeScreen();
  }

  Future<void> initializeScreen() async {
    await sharedPrefData();
    Timer(const Duration(seconds: 5), () async {
      final registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);

      // Log the retrieved email for debugging
      print('Email from shared preferences: $email');

      if (isTrue && email.isNotEmpty) {
        registerViewModel.emailController.text = email;

        try {
          DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('User').doc(email).get();
          DocumentSnapshot adminDoc = await FirebaseFirestore.instance.collection('admin').doc(email).get();
          DocumentSnapshot masterAdminDoc = await FirebaseFirestore.instance.collection('masterAdmin').doc(email).get();

          if (adminDoc.exists) {
            Beamer.of(context).beamToNamed('/homeAdminScreen');
          } else if (userDoc.exists) {
            Beamer.of(context).beamToNamed('/homeNavigationBar');
          } else if (masterAdminDoc.exists) {
            Beamer.of(context).beamToNamed('/homeMasterAdminScreen');
          } else {
            context.beamToNamed('/welcomeScreen');
          }
        } catch (e) {
          print('Error fetching documents: $e');
          context.beamToNamed('/welcomeScreen');
        }
      } else {
        context.beamToNamed('/welcomeScreen');
      }
    });
  }

  Future<void> sharedPrefData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isTrue = prefs.getBool('isLoggedIn') ?? false;
      email = prefs.getString('email') ?? '';
    });

    // Log the initial shared preferences values for debugging
    print('isLoggedIn: $isTrue, email: $email');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Image(
                  image: AssetImage('images/splashScreenImages/backGroundGrey.png'),
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Image(
                  image: AssetImage('images/splashScreenImages/splashLogo.png'),
                  fit: BoxFit.cover,
                  height: 120,
                  width: 120,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

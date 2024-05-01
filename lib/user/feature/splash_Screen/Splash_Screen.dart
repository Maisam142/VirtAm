import 'dart:async';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtam/component/text_component.dart';
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
    Timer(const Duration(seconds: 5), () {
      if (isTrue && email.isNotEmpty) {
        final registerViewModel = Provider.of<RegisterViewModel>(context, listen: false);
        registerViewModel.emailController.text = email;
        context.beamToNamed('/homeNavigationBar');
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

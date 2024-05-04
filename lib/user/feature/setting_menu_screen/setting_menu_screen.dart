import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtam/component/back_component.dart';
import 'package:virtam/user/feature/register_screen/register_screen_view_model.dart';

import '../../../component/back_component.dart';
import '../../../component/feild_component.dart';
import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';



class SettingMenuScreen extends StatelessWidget {
  const SettingMenuScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final RegisterViewModel registerViewModel =
    Provider.of<RegisterViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        Beamer.of(context).beamToNamed('/homeNavigationBar');
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BackComponent(
                        text: S.of(context).settings,
                        onPressed: () {
                          Beamer.of(context).beamToNamed('/homeNavigationBar');
                        },
                      ),
                      const SizedBox(height: 40),
                      FieldComponent(
                        onPressed: () {
                          Beamer.of(context).beamToNamed('/aboutVirtAmScreen');
                        },
                        text: S.of(context).aboutVirAm,
                        imageIcon: AssetImage('images/about.png'),
                      ),
                      const SizedBox(height: 10),
                      FieldComponent(
                        onPressed: () {},
                        text: S.of(context).termsCondition,
                        imageIcon: AssetImage('images/terms.png'),
                      ),
                      const SizedBox(height: 10),
                      FieldComponent(
                        onPressed: () {
                          Beamer.of(context).beamToNamed('/subscriptionScreen');
                        },
                        text: S.of(context).subscription,
                        imageIcon: AssetImage('images/subscription.png'),
                      ),
                      //SizedBox(height: 250),
                    ],
                  ),
                ),
              ),
              Container(
                color:  Theme.of(context).secondaryHeaderColor,
                width: double.infinity,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextComponent(text: '  Logout'),
                        ],
                      ),
                      IconButton(
                        onPressed: () async{
                          final prefs =
                              await SharedPreferences.getInstance();
                          prefs.setBool('isLoggedIn', false);

                          registerViewModel.logOut();
                          Beamer.of(context).beamToNamed('/welcomeScreen');
                        },
                        icon: Icon(Icons.login),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

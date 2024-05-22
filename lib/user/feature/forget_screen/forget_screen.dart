import 'package:beamer/beamer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/component/button_component.dart';


import '../../../component/design_component.dart';
import '../../../component/form_component.dart';
import '../../../generated/l10n.dart';
import '../register_screen/register_screen_view_model.dart';
import 'forget_screen_view_model.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final viewModel = Provider.of<RegisterViewModel>(context);

    // final ForgetViewModel userDataModel =
    // Provider.of<ForgetViewModel>(context);
    final auth = FirebaseAuth.instance;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const DesignComponent(
                text: 'New Password',
                textStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                smallText:
                'You can reset your password now. Make sure you\n remember it now or you can reset again & again',
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FormComponent(
                  hintText: S.of(context).email,
                  controller: viewModel.emailController,
                  errorText: viewModel.isEmailValid
                      ? null
                      : S.of(context).enterValidEmail,
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonComponentContinue(
                  text: S.of(context).resetPass,
                  onPress: () async {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: viewModel.emailController.text.trim());
                    Beamer.of(context).beamToNamed('/loginScreen');

                    }
                ),
              ),


            ],
          ),
        ),
      ),
    );

  }
}

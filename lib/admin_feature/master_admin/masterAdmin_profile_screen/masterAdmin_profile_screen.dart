import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../component/design_component.dart';
import '../../../component/text_component.dart';
import '../../../generated/l10n.dart';

class MasterAdminProfileScreen extends StatelessWidget {
  const MasterAdminProfileScreen({super.key});

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
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Stack(
              children: [
                DesignComponent3(
                    onPressed:(){
                      Navigator.of(context).pop();
                    }
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(onPressed: (){
                      Beamer.of(context).beamToNamed('/subscriptionToAdminScreen');
                    }, child:  TextComponent(text: S.of(context).editSubscription,
                      textStyle: Theme.of(context).textTheme.labelSmall ,),),),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    child:  CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://w7.pngwing.com/pngs/205/731/png-transparent-default-avatar-thumbnail.png',
                      ),
                      radius: 88,
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Text(S.of(context).centerName,
                        style: TextStyle(color: Theme.of(context).hoverColor,
                      ),),
                      const TextComponent(text: 'name' ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).describe,
                          style: TextStyle(color: Theme.of(context).hoverColor,
                      )),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Text fetched from Firebase ewf ljfclihioehyiohvt etiuhetvuiqheuihqeui', maxLines: null),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Text('  Subscription Price:  ',
                        style: TextStyle(color: Theme.of(context).hoverColor,
                      ),),
                      TextComponent(text: '99 JOD/Month' ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Text(S.of(context).phoneNumber,
                    style: TextStyle(color: Theme.of(context).hoverColor,
        ),),
                      TextComponent(text: 'number' ),
                    ],
                  ),
                ),
                Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      Text('  Location Link:  ',
                        style: TextStyle(color: Theme.of(context).hoverColor,
                      ),),
                      TextComponent(text: 'adfkcklfdjslkfhahflahs;l' ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),

                Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  height: 200,
                  width: double.infinity,
                ),
                const SizedBox(height: 15,),

                Container(
                  color: Theme.of(context).secondaryHeaderColor,
                  height: 200,
                  width: double.infinity,
                ),

              ],
            ),
          )
        ]
    ),
    ),
    ),
        ),);
  }
}

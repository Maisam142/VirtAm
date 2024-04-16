import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../component/design_component.dart';
import '../../../component/text_component.dart';

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
                    }, child:  TextComponent(text: 'Edit Subscription',
                      textStyle: Theme.of(context).textTheme.labelSmall ,),),),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 90,
                    backgroundColor: Colors.white,
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
                  color: Colors.grey.shade200,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      const Text('  Center Name:  ',style: TextStyle(color: Colors.grey),),
                      TextComponent(text: 'name' ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  color: Colors.grey.shade200,
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('  Description:  ', style: TextStyle(color: Colors.grey)),
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
                  color: Colors.grey.shade200,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      const Text('  Subscription Price:  ',style: TextStyle(color: Colors.grey),),
                      TextComponent(text: '99 JOD/Month' ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  color: Colors.grey.shade200,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      const Text('  00962  ',style: TextStyle(color: Colors.grey),),
                      TextComponent(text: 'number' ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      const Text('  Location Link:  ',style: TextStyle(color: Colors.grey),),
                      TextComponent(text: 'adfkcklfdjslkfhahflahs;l' ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),

                Container(
                  color: Colors.grey.shade300,
                  height: 200,
                  width: double.infinity,
                ),
                const SizedBox(height: 15,),

                Container(
                  color: Colors.grey.shade300,
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

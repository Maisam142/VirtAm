import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:virtam/component/text_component.dart';
import '../component/back_component.dart';
import '../generated/l10n.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> items = [
      {
        'image': 'images/img_2.png',
        'title': 'Title 1',
        'subtitle': 'Subtitle 1',
      },
      {
        'image': 'images/img_2.png',
        'title': 'Title 2',
        'subtitle': 'Subtitle 2',
      },
      {
        'image': 'images/img_2.png',
        'title': 'Title 3',
        'subtitle': 'Subtitle 3',
      },
      {
        'image': 'images/img_2.png',
        'title': 'Title 4',
        'subtitle': 'Subtitle 4',
      },
    ];

    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/homeNavigationBar');
      return false;
    },
    child:SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BackComponent(
              text: S.of(context).exercises,
              onPressed: (){
                Beamer.of(context).beamBack();
              },
            ),
            SizedBox(
              height: screenSize.height * 0.3,
              child: Stack(
                children: [
                  Image(image: AssetImage('images/exercises.png'),),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          SizedBox(height: 110,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 90,
                              color: Colors.white70.withOpacity(0.2),
                              child: Row(
                                children: [
                                  Icon(Icons.local_fire_department,color: Colors.white,size: 15,),
                                  TextComponent(text: '7:00 - 8:00',textStyle: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: TextLabelComponent(text: 'Day 01-Fitness ',textStyle: TextStyle(color: Colors.white,
                                fontSize: 45),),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(onPressed: (){},
                  child: TextComponent(text: S.of(context).lorem),),
                MaterialButton(onPressed: (){},
                  child: TextComponent(text:  S.of(context).lorem),),
                MaterialButton(
                  onPressed: (){},
                  child: TextComponent(text: S.of(context).lorem),),
                MaterialButton(onPressed: (){},
                  child: TextComponent(text: S.of(context).fitness),),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.7, // Adjust this ratio as needed
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GridTile(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image.asset(
                            items[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  items[index]['title'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  items[index]['subtitle'],
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

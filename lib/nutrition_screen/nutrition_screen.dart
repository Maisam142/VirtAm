import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:virtam/component/form_component.dart';
import 'package:virtam/component/text_component.dart';
import 'package:virtam/component/viewall_component.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> items = [
      {
        'image': 'images/center1.png',
        'title': 'Location',
        'subtitle': 'Center1',
      },
      {
        'image': 'images/center2.png',
        'title': 'Location',
        'subtitle': 'Center2',
      },
    ];
    final List<Map<String, dynamic>> allItems = [
      {
        'image': 'images/center3.png',
        'title': 'Location',
        'subtitle': 'Center1',
      },
      {
        'image': 'images/center4.png',
        'title': 'Location',
        'subtitle': 'Center2',
      },
    ];

    return WillPopScope(
        onWillPop: () async {
      Beamer.of(context).beamToNamed('/homeNavigationBar');
      return false;
    },
    child:SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(
                  text: 'Nutrition and slimming centers',
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: screenSize.height * 0.04),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 15,
                    ),
                    TextComponent(
                      text: ' Location Name',
                      textStyle: TextStyle(fontSize: 15),
                    ),
                    Icon(
                      Icons.expand_more_sharp,
                      size: 15,
                    ),
                  ],
                ),
                SizedBox(height: screenSize.height * 0.04),
                FormComponent(
                  prefixIcon: Icon(Icons.search),
                  hintText: ' Search',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list_alt),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 8.0),
                BannerCarousel(
                  height: screenSize.height * 0.3,
                  activeColor: Theme.of(context).primaryColor,
                  customizedBanners: [
                    for (int i = 0; i < 3; i++)
                      SizedBox(
                        width: screenSize.width,
                        child: Stack(
                          children: [
                            Image.asset(
                              'images/nutrition.png',
                              fit: BoxFit.fill,
                              width: screenSize.width,
                              height: screenSize.height * 0.3,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  children: [
                                    SizedBox(height: 110,),
                                    Container(
                                      width: 90,
                                      color: Colors.white70.withOpacity(0.2),
                                      child: Row(
                                        children: [
                                          Icon(Icons.local_fire_department, color: Colors.white, size: 15),
                                          TextComponent(text: '7:00 - 8:00', textStyle: TextStyle(color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    TextComponent(text: 'Day 01-Fitness', textStyle: TextStyle(color: Colors.white, fontSize: 45)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextLabelComponent(text: 'Popular Center',),
                          ViewAllComponent(
                            onPressed: () {},
                          ),
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print('Tapped on image of ${items[index]['subtitle']}');
                                    },
                                    child: Image.asset(
                                      items[index]['image'],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextComponent(
                                          text: items[index]['title'],
                                          textStyle: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                        SizedBox(height: 4.0),
                                        TextComponent(
                                          text: items[index]['subtitle'],
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextLabelComponent(text: 'All Center',),
                          ViewAllComponent(
                            onPressed: () {},
                          ),
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                         // mainAxisSpacing: 10.0,
                         //  crossAxisSpacing: 10.0,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('Tapped on image of ${allItems[index]['subtitle']}');
                                  },
                                  child: Image.asset(
                                    allItems[index]['image'],
                                    fit: BoxFit.contain,
                                    // height: screenSize.height * 0.05,
                                    // width: screenSize.width * 0.2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextComponent(
                                        text: allItems[index]['title'],
                                        textStyle: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      TextComponent(
                                        text: allItems[index]['subtitle'],
                                        textStyle: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtam/home_screen/home_screen.dart';

import '../calories_screen/calories_screen.dart';
import '../nutrition_screen/nutrition_screen.dart';
import '../profile_screen/profile_screen.dart';
import 'navigation_bar_view_model.dart';

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override


  @override
  Widget build(BuildContext context) {
    var navigate = Provider.of<NavigationBarViewModel>(context);



    return Scaffold(
      body: Consumer<NavigationBarViewModel>(
        builder: (context, provider, _) {
          return IndexedStack(
            index: provider.selectedIndex,
            children: const [
              HomeScreen(),
              CaloriesScreen(),
              NutritionScreen(),
              ProfileScreen()
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
                size: 30,
          ),
          type: BottomNavigationBarType.fixed,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/home.png')),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/calories.png')),
                label: ''
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/apple.png')),
                label: ''

            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('images/person.png')),
                label: ''

            ),
          ],
          currentIndex: navigate.selectedIndex,
          onTap: (index)
          {
            navigate.navigate(index);
          }
      ),
    );
  }
}
